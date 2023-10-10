//
//  ContentView.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import SwiftUI

struct Page_1: View {
    var body: some View {
        NavigationView {
            
            List {
                
                NavigationLink(destination: WordListView(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/IELTS_words.json").navigationTitle("IELTS Words")) {
                    Image(systemName: "i.square").foregroundColor(.teal)
                    Text("IELTS Words")
                }
                
                NavigationLink(destination: WordListView(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/GRE_words.json").navigationTitle("GRE Words")) {
                    Image(systemName: "g.square").foregroundColor(.teal)
                    Text("GRE Words")
                }
                
            }.listStyle(InsetListStyle())
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            List {
                NavigationLink(destination: Page_1().navigationTitle("Words List")) {
                    Image(systemName: "list.bullet.rectangle").foregroundColor(.blue)
                    Text("Words List")
                }
                
                NavigationLink(destination: Text("Page 1")) {
                    Text("Item 1")
                }
                
                NavigationLink(destination: Text("Page 1")) {
                    Text("Item 1")
                }
            }.frame(width: 150)
                .listStyle(SidebarListStyle()).padding(.top).padding(.bottom)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
