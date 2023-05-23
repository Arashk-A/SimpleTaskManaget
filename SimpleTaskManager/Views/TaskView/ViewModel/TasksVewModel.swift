//
//  TasksVewModel.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import Foundation
import Combine


class TaskViewModel: ObservableObject {
  @Published var alltasks: [Task] = []
  
  @Published var tasks: [Task] = []
  
  @Published var filterType = FilterTypes.none
  
  private var cancelable: AnyCancellable?
    
  init() {
    cancelable = NotificationCenter.default
      .publisher(for: .didAddNewTask)
      .compactMap { $0.object as? Task }
      .receive(on: DispatchQueue.main)
      .sink {[weak self] in
        self?.alltasks.append($0)
      }
    
    // This is for loading dummy data
    // alltasks = Task.dummyData

    Publishers.CombineLatest($alltasks, $filterType)
      .receive(on: DispatchQueue.main)
      .compactMap({ [weak self] _ in
        self?.filterTasks()
      })
      .assign(to: &$tasks)
  }
  
  func moveItem(from source: IndexSet, to destination: Int) {
    alltasks.move(fromOffsets: source, toOffset: destination)
    tasks = alltasks
  }
  
  private func filterTasks() -> [Task] {
      switch filterType {
      case .none:
          return alltasks
      case .completed:
          return alltasks.filter { $0.isCompleted }
      case .notCompleted:
          return alltasks.filter { !$0.isCompleted }
      }
  }
  
  func setComplete(_ task: Task, isComplete: Bool) {
    guard let index = alltasks.firstIndex(where: { $0.id == task.id }) else { return }
    alltasks[index].isCompleted = isComplete
  }
}


