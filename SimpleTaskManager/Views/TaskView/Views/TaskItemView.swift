//
//  TaskItemView.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import SwiftUI

struct TaskItemView: View {
  var item: Task
  @ObservedObject var viewModel: TaskViewModel

  var isCompleted: Binding<Bool> {
    Binding(
      get: {
        item.isCompleted
      },
      set: { isCompleted, transaction in
        withTransaction(transaction) {
          viewModel.setComplete(item, isComplete: isCompleted)
        }
      })
  }

  var body: some View {
    HStack(alignment: .center) {
        Toggle("", isOn: isCompleted.animation(.easeInOut))
          .toggleStyle(CheckboxToggleStyle())

        VStack(alignment: .leading, spacing: 8) {
          Text("Title: \(item.title)")
            .font(.title2)
            .strikethrough(item.isCompleted)

          HStack {
            Text("description:")
              .strikethrough(item.isCompleted)
            
            Text(item.summery)
              .strikethrough(item.isCompleted)
          }
          .font(.body)
        }
      }
      .foregroundColor(item.isCompleted ? .gray: .black)
      
  }
}


struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
      TaskItemView(item: Task.dummyData[0], viewModel: TaskViewModel())
    }
}
