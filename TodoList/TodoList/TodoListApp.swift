//
//  TodoListApp.swift
//  TodoList
//
//  Created by Benjamin Ngarambe on 22/05/2022.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model - is the data point
 View - is the UI
 ViewModel - it  manages model for views
 
 m
 */
@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
