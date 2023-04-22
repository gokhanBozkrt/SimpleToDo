//
//  SimpleToDoApp.swift
//  SimpleToDo
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import SwiftUI

@main
struct SimpleToDoApp: App {
    @StateObject var toDoViewModel = ToDoViewModel()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(model: toDoViewModel)
                    .environmentObject(toDoViewModel)
                SelectSomethingView()
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                toDoViewModel.save()
            }
        }
    }
}
