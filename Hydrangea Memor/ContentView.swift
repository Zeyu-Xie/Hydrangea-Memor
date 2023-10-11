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
                
                Text("Hydrangea_Memor").font(.callout).foregroundColor(.secondary)
                
                NavigationLink(destination: Page_Words().navigationTitle("Words")) {
                    Image(systemName: "list.bullet.clipboard").foregroundColor(.blue)
                    Text("Words")
                }
                
                NavigationLink(destination: Page_About().navigationTitle("About")) {
                    Image(systemName: "person").foregroundColor(.blue)
                    Text("About")
                }
                
                Text("Others").font(.callout).foregroundColor(.secondary).padding(.top)
                
                NavigationLink(destination: Page_Develop().navigationTitle("Develop")) {
                    Image(systemName: "desktopcomputer").foregroundColor(.blue)
                    Text("Develop")
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
