//
//  Hydrangea_MemorApp.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import SwiftUI

@main
struct Hydrangea_MemorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands{
            SidebarCommands()
            ToolbarCommands()
        }
    }
}
