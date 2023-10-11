//
//  WordListView.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/10.
//

import Foundation
import SwiftUI

struct Card_View: View {
    @State private var source: String
    @State private var wordList: WordList = WordList()
    @State private var number: Int = 0
    
    @State private var showEnglish : Bool = true
    @State private var showPhonetic: Bool = true
    @State private var showChinese : Bool = true
    
    @State private var isListView: Bool = true
    
    @State private var position : Int = 0
    
    init() {
        self.source = ""
    }
    
    init(source: String) {
        self.source = source
    }
    
    var body: some View {
        HStack {
            
            Button("English") {
                showEnglish = !showEnglish
            }.frame(width: 200, alignment: .leading)
            
            Button("Phonetic") {
                showPhonetic = !showPhonetic
            }.frame(width: 200, alignment: .leading)
            
            Button("Chinese") {
                showChinese = !showChinese
            }.frame(width: 200, alignment: .leading)
            
        }.padding()
        
        Divider()
        
        Spacer()
            
            LazyVStack {
                
                if(position < number) {
                    Card(cardTitle: showEnglish ? wordList.items[position].English! : "", cardCallOut: showPhonetic ?  wordList.items[position].Phonetic! : "", cardContent: showChinese ? wordList.items[position].Chinese! : "").padding()
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
                Text("\(String(position + 1)) / \(String(number))")
                
                
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
