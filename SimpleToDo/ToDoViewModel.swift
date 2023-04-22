//
//  ToDoViewModel.swift
//  SimpleToDo
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import Combine
import Foundation


class ToDoViewModel: ObservableObject {
    @Published var items: [ToDoItem]
    
    private var saveSubscription: AnyCancellable?
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            items =  []
        }
        saveSubscription = $items
            .debounce(for: 5, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.save()
            }
    }
    
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedItems")
    
    func save() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath,options: [.atomic,.completeFileProtection])
        } catch {
            print("Unable to save data!!!")
        }
    }
    
    func add() {
        let newItem = ToDoItem()
        items.append(newItem)
    }
    
    func delete(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func delete(_ selected: Set<ToDoItem>) {
        items.removeAll(where: selected.contains)
    }
    
}
