//
//  ContentView.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        
        NavigationView{
            List {
                
                Text("Hydrangea Memor").font(.callout).foregroundColor(.secondary)
                
                NavigationLink(destination: Page_Words().navigationTitle("Words")) {
                    Image(systemName: "list.bullet.clipboard").foregroundColor(.blue)
                    Text("Words")
                }
                
                NavigationLink(destination: Page_About().navigationTitle("About")) {
                    Image(systemName: "person").foregroundColor(.blue)
                    Text("About")
                }
                
                NavigationLink(destination: VStack(alignment: .leading, spacing: 20) {
                    Text("Settings Not Here").font(.title).fontWeight(.bold).foregroundColor(.blue)
                    Text("Please turn to the \(Text("left top corner").foregroundColor(.teal).fontWeight(.bold)) of the screen. Click \"Hydrangea Memor\" - \"Settings\" afterwards.").foregroundStyle(.secondary)
                }.frame(alignment: .leading).navigationTitle("Settings")) {
                    Image(systemName: "gear").foregroundColor(.blue)
                    Text("Settings")
                }
                
                Text("Develop").font(.callout).foregroundColor(.secondary).padding(.top)
                
                NavigationLink(destination: Page_Develop().navigationTitle("Develop")) {
                    Image(systemName: "desktopcomputer").foregroundColor(.blue)
                    Text("Info Page")
                }
                
                
            }.frame(width: 150).listStyle(SidebarListStyle())
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
