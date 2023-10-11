//
//  Hydrangea_MemorApp.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import SwiftUI

struct GeneralSettingsView: View {
    @AppStorage("showPreview") private var showPreview = true
    @AppStorage("fontSize") private var fontSize = 12.0
    
    @AppStorage("showTitleBar") private var showTitleBar = true
    
    
    var body: some View {
        Form {
            Slider(value: $fontSize, in: 9...96) {
                Text("Font Size (parody) (\(fontSize, specifier: "%.0f") pts)")
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

@main
struct Hydrangea_MemorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands{
            SidebarCommands()
            ToolbarCommands()
        }
#if os(macOS)
        Settings {
            GeneralSettingsView()
        }
#endif
    }
}
