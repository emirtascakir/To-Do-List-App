//
//  To_Do_List_AppApp.swift
//  To-Do-List-App
//
//  Created by Emir TAŞÇAKIR on 1.09.2023.
//

import SwiftUI

@main
struct To_Do_List_AppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                NavigationView {
                    ListView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(listViewModel)
            }
        }
    }
}
