//
//  TasksView.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import SwiftUI

struct TasksView: View {
  @StateObject var viewModel = TaskViewModel()
  @State private var isShowingAddTodoView = false
  
  fileprivate func FiltersView() -> some View {
    
    return Menu("Filter") {
      Button("Completed", action: {
        viewModel.filterType = .completed
      })
      
      Button("Not Completed", action: {
        viewModel.filterType = .notCompleted
      })
      
      Button("Clear", action: {
        viewModel.filterType = .none
      })
    }
  }
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(viewModel.tasks) { task in
          TaskItemView(item: task, viewModel: viewModel)
        }
        .onMove(perform: viewModel.moveItem)
        
      }
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button(action: {
            isShowingAddTodoView.toggle()
          } ) {
            Image(systemName: "plus")
          }
        }
        
        ToolbarItemGroup(placement: .navigationBarLeading) {
          FiltersView()
        }
      }
    }
    .sheet(isPresented: $isShowingAddTodoView) {
      AddTaskView()
    }
  }
  
}

struct TasksView_Previews: PreviewProvider {
  static var previews: some View {
    TasksView()
  }
}
