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
  
  private func CheckMark() -> some View {
    return Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
      .resizable()
      .frame(width: 20, height: 20)
      .foregroundColor(item.isCompleted ? .green : .black)
  }
  
  var body: some View {
    HStack(alignment: .center) {
      Button(action: {
        withAnimation(.easeIn(duration: 0.09)) {
          viewModel.setComplete(item, isComplete: !item.isCompleted)
        }
      }) {
        CheckMark()
      }
      .buttonStyle(.plain)
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Title: \(item.title)")
          .font(.title2)
          .strikethrough(item.isCompleted)
        
        HStack {
          Text("Summery:")
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
