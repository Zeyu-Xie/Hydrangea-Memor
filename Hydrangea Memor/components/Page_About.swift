//
//  About.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/10.
//

import SwiftUI

struct Page_About: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("About Hydrangea Memor").font(.title).fontWeight(.bold).foregroundColor(.blue)
            
            Text("Welcome to Hydrangea Memor, a language learning app designed to enhance your vocabulary effortlessly.").font(.body).foregroundColor(.secondary)
            
            Text("Features").font(.headline).fontWeight(.bold).foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("📚 Word List View").foregroundColor(.teal)
                Text("Display your words in the list. You can either review them all or part of the list.")
                
                Text("🇸🇪 Word Card View").foregroundColor(.teal)
                Text("Try testing yourself with the word card. You can convey to wherever you want — as long as you input the legal index number.")
            }
            
            Text("About the Developer").font(.headline).fontWeight(.bold).foregroundColor(.blue)
            
            Text("This is Acan, a 21 year old undergraduate student in Tsinghua University, Beijing. I'm interested in softwares, devices and the internet. I sincerely look forward to improving all users' English by my codes.").font(.body).foregroundColor(.secondary)
            
        }.padding()
    }
}
