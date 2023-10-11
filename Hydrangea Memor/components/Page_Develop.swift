//
//  About.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/10.
//

import SwiftUI

struct Page_Develop: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Develop Page of Hydrangea Memor").font(.title).fontWeight(.bold).foregroundColor(.blue)
            
            Text("This page showcases the app's GitHub repos and dev resources. Explore code, find docs, and join the community.").font(.body).foregroundColor(.secondary)
            
            Link(destination: URL(string: "#")!) {
                Image(systemName: "house")
                Text("Repository")
            }.font(.headline).fontWeight(.bold).foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 10) {
                Link(destination: URL(string: "https://github.com/zeyu-xie/Hydrangea-Memor/tree/main")!) {
                    Text("🎒 Hydrangea Memor — Main Branch").foregroundColor(.teal)
                }
                
                Text("Notice that this branch keeps the vacabulary json file.")
                
                Link(destination: URL(string: "https://github.com/zeyu-xie/Hydrangea-Memor/tree/MacOS")!) {
                    Text("🍃 Hydrangea Memor — MacOS Branch").foregroundColor(.teal)
                }
                
                Text("This branch keeps the source code of this MacOS app.")
                
            }
            
            Link(destination: URL(string: "https://github.com/zeyu-xie")!) {
                Image(systemName: "graduationcap")
                Text("Developer")
            }.font(.headline).fontWeight(.bold).foregroundColor(.blue)
            
            Text("Acan Xie, 21, from Tsinghua University. An ordinary student in favor of softwares.").font(.body).foregroundColor(.secondary)
            
        }.padding()
    }
}
