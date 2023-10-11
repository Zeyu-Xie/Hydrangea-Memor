//
//  Page_Develop.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/11.
//

import Foundation
import SwiftUI

struct Page_Develop: View {
    var body: some View {
        
            
        VStack(alignment: .leading, spacing: 20) {
                Text("Hydrangea Memor Development Info").font(.title).fontWeight(.bold).foregroundColor(.blue)
                
                Section(header: Text("GitHub Repository")) {
                    Text("Explore the source code on GitHub:").font(.callout).foregroundColor(.secondary)
                    Link("Hydrangea Memor on GitHub", destination: URL(string: "https://github.com/zeyu-xie/Hydrangea-Memor/tree/MacOS")!)
                }
                
                Section(header: Text("Attributions")) {
                    Text("Special thanks to contributors and libraries used in this project.").font(.callout).foregroundColor(.secondary)
                }
                
                Section(header: Text("Contact Developer")) {
                    Text("For inquiries or feedback, reach out to the developer:").font(.callout).foregroundColor(.secondary)
                    Link("xie.zeyu20@gmail.com", destination: URL(string: "xie.zeyu20@gmail.com")!)
                }
            }.padding().frame(alignment: .leading)
            
}
}
