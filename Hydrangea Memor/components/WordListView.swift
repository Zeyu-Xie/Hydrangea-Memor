//
//  WordListView.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/10.
//

import Foundation
import SwiftUI

struct WordListView: View {
    @State private var source: String
    @State private var wordList: WordList = WordList()
    @State private var number: Int = 0
    
    @State private var showEnglish : Bool = true
    @State private var showPhonetic: Bool = true
    @State private var showChinese : Bool = true
    
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
        
        ScrollView{
            
            LazyVStack {
                ForEach(0..<number, id: \.self) { i in
                    HStack {
                        Text(wordList.items[i].English != nil && showEnglish ? wordList.items[i].English! : "").frame(width: 200, alignment: .leading)
                        
                        
                        Text(wordList.items[i].Phonetic != nil && showPhonetic ? wordList.items[i].Phonetic! : "").frame(width: 200, alignment: .leading)
                        
                        
                        Text(wordList.items[i].Chinese != nil && showChinese ? wordList.items[i].Chinese! : "").frame(width: 200, alignment: .leading)
                    }.padding().onTapGesture {
                        NSSpeechSynthesizer().startSpeaking(wordList.items[i].English!)
                    }
                }
            }
        }.onAppear {
            
            getWordList()
        }
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
