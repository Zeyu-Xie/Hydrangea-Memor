//
//  Words_View.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/11.
//

import Foundation
import SwiftUI

struct Words_View: View {
    
    @State private var source: String
    @State private var isListView : Bool = true
    
    init(source: String) {
        self.source = source
    }
    
    var body: some View {
        VStack {
            if(isListView) {
                List_View(source: source)
            }
            else {
                Card_View(source: source)
            }
        }.toolbar {
            ToolbarItem {
                HStack {
                    Image(systemName: isListView ? "list.bullet" : "lanyardcard")
                    Spacer()
                    Toggle("Switch Label", isOn: $isListView).toggleStyle(SwitchToggleStyle())
                }
            }
            
        }
    }
}
