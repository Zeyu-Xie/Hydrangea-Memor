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
                
                Text("Pages").font(.callout).foregroundColor(.secondary)
                
                NavigationLink(destination: Page_1().navigationTitle("Words List")) {
                    Image(systemName: "list.bullet.rectangle").foregroundColor(.blue)
                    Text("Words List")
                }
                
                NavigationLink(destination: About()) {
                    Image(systemName: "person").foregroundColor(.blue)
                    Text("About")
                }
                
                Text("Others").font(.callout).foregroundColor(.secondary).padding(.top)

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
