//
//  AddTaskViewModel.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import Foundation

class AddTaskViewModel: ObservableObject {
  @Published var title = ""
  @Published var descrioption = ""
  
  func addNewTaks() {
    let newTask = Task(title: title, summery: descrioption)
    
    NotificationCenter.default.post(name: .didAddNewTask, object: newTask, userInfo: ["newTask": newTask])
  }
}
