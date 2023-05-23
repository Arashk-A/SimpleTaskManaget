//
//  Task.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import Foundation

struct Task: Codable, Identifiable {
  var id: String = UUID().uuidString
  let title: String
  let summery: String
  var isCompleted: Bool = false

}

extension Task {
  static let dummyData = {
    return [
      Task(title: "Task 1", summery: "Do this until next week"),
      Task(title: "Task 2", summery: "Do that on weekends"),
      Task(title: "Task 3", summery: "Do run on mornings", isCompleted: true),
    ]
  }()
}
