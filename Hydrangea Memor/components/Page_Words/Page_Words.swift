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
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/IELTS_words.json", language: "English").navigationTitle("IELTS Words")) {
                    Image(systemName: "i.square").foregroundColor(.teal)
                    Text("IELTS Words")
                }
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/GRE_words.json", language: "English").navigationTitle("GRE Words")) {
                    Image(systemName: "g.square").foregroundColor(.teal)
                    Text("GRE Words")
                }
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/Medical_words.json", language: "English").navigationTitle("Medical Words")) {
                    Image(systemName: "m.square").foregroundColor(.teal)
                    Text("Medical Words")
                }
                
                Text("French Words").foregroundColor(.secondary).font(.callout).padding(.top)
                
                NavigationLink(destination: Words_View(source: "https://zeyu-xie.github.io/Hydrangea-Memor/data/French_Basic_words.json", language: "French").navigationTitle("French Basic Words")) {
                    Image(systemName: "f.square").foregroundColor(.teal)
                    Text("French Basic Words")
                }
                
            }.listStyle(InsetListStyle())
            
        }.background(.background)
    }
}
