//
//  ContentView.swift
//  SimpleToDo
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: ToDoViewModel
    @State private var selectedItems = Set<ToDoItem>()
    @State var editMode = EditMode.inactive
    var body: some View {
        List(selection: $selectedItems) {
            ForEach($model.items, content: ItemRowView.init)
             .onDelete(perform: model.delete)
        }
        .navigationTitle("SimpleToDo")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: EditButton.init)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    model.add()
                } label: {
                    Label("Add", systemImage: "plus")
                }

            }
            ToolbarItem(placement: .bottomBar) {
                if editMode == .active {
                    HStack {
                        Spacer()
                        Button(role: .destructive) {
                            model.delete(selectedItems)
                            selectedItems.removeAll()
                        } label: {
                            Label("Delete selected", systemImage: "trash")
                        }
                        .disabled(selectedItems.isEmpty)
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .animation(.default, value: model.items)
        .environment(\.editMode, $editMode)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ToDoViewModel())
    }
}
