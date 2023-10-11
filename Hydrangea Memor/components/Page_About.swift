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
            
            Text("Welcome to Hydrangea Memor, a language learning companion designed to enhance your vocabulary effortlessly.").font(.body).foregroundColor(.secondary)
            
            Text("Features").font(.headline).fontWeight(.bold).foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("📚 Extensive Word Lists").foregroundColor(.teal)
                Text("Explore curated word lists for English proficiency exams like IELTS and GRE, and enrich your vocabulary.")
                
                Text("🇸🇪 Swedish Vocabulary").foregroundColor(.teal)
                Text("Immerse yourself in the beauty of the Swedish language by learning carefully selected Swedish words.")
            }
            
            Text("About the Developer").font(.headline).fontWeight(.bold).foregroundColor(.blue)
            
            Text("Hydrangea Memor is crafted with love by Acan. An enthusiast for language, Acan is dedicated to making learning a joyous experience.").font(.body).foregroundColor(.secondary)
            
        }.padding()
    }
}
