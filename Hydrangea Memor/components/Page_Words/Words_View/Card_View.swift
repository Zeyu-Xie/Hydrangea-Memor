//
//  WordListView.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/10.
//

import Foundation
import SwiftUI
import Combine

struct Card_View: View {
    @State private var source: String
    @State private var wordList: WordList = WordList()
    @State private var number: Int = 0
    
    @State private var isListView: Bool = true
    
    @State private var position : Int = 0
    
    @State private var numericInput: String = ""
    
    @State private var selectedOption : Int = 1
    
    @State private var language : String
    
    init() {
        self.source = ""
        self.language = "English"
    }
    
    init(source: String, language: String) {
        self.source = source
        self.language = language
    }
    
    var body: some View {
        HStack {
            
            Picker("Switch Display Mode", selection: $selectedOption) {
                Text("English").tag(0)
                Text("All").tag(1)
                Text("Chinese").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle()).frame(width: 400)
            
            Spacer()
            
        }.padding()
        
        Divider()
        
        Spacer()
        
        LazyVStack {
            
            if(position < number) {
                Card(cardTitle: selectedOption != 0 ? wordList.items[position].English! : "", cardCallOut: wordList.items[position].Phonetic != nil ? wordList.items[position].Phonetic!: "", cardContent: selectedOption != 2 ? wordList.items[position].Chinese! : "").padding()
            }
            HStack {
                
                
                
                Button(action: {
                    if(position > 0) {
                        position -= 1
                    }
                }) {
                    Text("Previous").frame(width: 60)
                }
                Button(action: {
                    if(position < number-1) {
                        position += 1
                    }
                }) {
                    Text("Next").frame(width: 60)
                }
            }.padding(.vertical)
            
            HStack {
                Text("\(String(position + 1)) / \(String(number))")
                TextField("Jump to", text: $numericInput).textFieldStyle(PlainTextFieldStyle())
                    .onReceive(Just(numericInput)) { newInput in
                        let filtered = newInput.filter { "0123456789".contains($0) }
                        if filtered != newInput {
                            self.numericInput = filtered
                        }
                    }.frame(width: 50).padding(.horizontal)
                Button("Convey") {
                    let newPosition = Int(numericInput) ?? position
                    if( 1 <= newPosition && newPosition <= number) {
                        position = newPosition - 1
                    }
                    numericInput = ""
                }
            }
            
            
            
        }.onAppear {
            getWordList()
        }
        Spacer()
    }
    func getWordList() {
        if let url = URL(string: source) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("ERROR: \(error)")
                }
                else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        do {
                            wordList = try JSONDecoder().decode(WordList.self, from: data)
                            number = wordList.items.count
                        } catch {
                            print("ERROR: \(error)")
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
}
