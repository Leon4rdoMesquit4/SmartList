//
//  ContentViewModel.swift
//  SmartList
//
//  Created by Leonardo Mesquita Alves on 25/10/25.
//

import SwiftUI
import CoreData
import Combine

class SmartListViewModel: ObservableObject {
    @Published private(set) var items: [ItemEntity] = []
    
    private let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ListItemsContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print(error)
            } else {
                print("Successfully loaded Core Data stack")
            }
        }
        fetchItemsOrderedByhour()
    }
    
    private func fetchItemsOrderedByhour() {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        
        let sortByDate = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortByDate]
        
        do {
            items = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching items: \(error)")
        }
    }
    
    func addItem(title: String) {
        let newItem = ItemEntity(context: container.viewContext)
        newItem.title = title
        newItem.date = .now
        newItem.completed = false
        saveData()
    }
    
    func updateItem(entity: ItemEntity, completed: Bool) {
        entity.completed = completed
        saveData()
    }
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = items[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchItemsOrderedByhour()
        } catch let error {
            print("Error saving data: \(error)")
        }
    }
}

