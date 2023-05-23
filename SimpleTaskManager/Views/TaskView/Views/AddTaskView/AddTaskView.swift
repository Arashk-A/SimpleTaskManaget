//
//  AddTaskView.swift
//  CodeSample
//
//  Created by zero on 5/23/23.
//

import SwiftUI

struct AddTaskView: View {
  @StateObject private var viewModel = AddTaskViewModel()
  
  @Environment(\.presentationMode) private var presentationMode
  
  func addNewTask() {
    viewModel.addNewTaks()
    presentationMode.wrappedValue.dismiss()
  }
  
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Task Title", text: $viewModel.title)
        TextField("Task Description", text: $viewModel.descrioption)
        
        Section {
          Button(action: addNewTask) {
            Text("Add New Task")
          }
          .disabled(viewModel.title.isEmpty || viewModel.descrioption.isEmpty)
        }
      }
      
      .navigationBarTitle(Text("New Task"), displayMode: .inline)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          
          Button(action: dismiss) {
            Image(systemName: "xmark")
          }
        }
      }
    }
    
  }
}
struct AddTaskView_Previews: PreviewProvider {
  static var previews: some View {
    AddTaskView()
      .environmentObject(TaskViewModel())
  }
}
