//
//  ListViewModel.swift
//  TodoList
//
//  Created by Benjamin Ngarambe on 22/05/2022.
//

import Foundation

/*this Application is build using
          CRUD FUNCTION
 Create -> to create a new item
 Read -> To access or get items
 Update -> To toggle the items completion
 Delete -> Swipe to delete the item from the list*/

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey:String = "items_list"
    
    init(){
        getItems()
    }
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){ 
        items.move(fromOffsets: from, toOffset: to)
    }
    func AddItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
        func saveItems(){
            if let encodedData = try?JSONEncoder().encode(items){
                UserDefaults.standard.set(encodedData, forKey: itemsKey)
            }
        }
    }

