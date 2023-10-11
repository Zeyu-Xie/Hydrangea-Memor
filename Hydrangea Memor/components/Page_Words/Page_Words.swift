//
//  Page_1.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import Foundation
import SwiftUI

struct Page_Words: View {
    var body: some View {
        NavigationView {
            
            List {
                
                Text("English Words").foregroundColor(.secondary).font(.callout)
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/IELTS_words.json").navigationTitle("IELTS Words")) {
                    Image(systemName: "i.square").foregroundColor(.teal)
                    Text("IELTS Words")
                }
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/GRE_words.json").navigationTitle("GRE Words")) {
                    Image(systemName: "g.square").foregroundColor(.teal)
                    Text("GRE Words")
                }
                
                Text("Swedish Words").foregroundColor(.secondary).font(.callout).padding(.top)
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/GRE_words.json").navigationTitle("GRE Words")) {
                    Image(systemName: "g.square").foregroundColor(.teal)
                    Text("GRE Words")
                }
                
            }.listStyle(InsetListStyle())
            
        }.background(.background)
    }
}
