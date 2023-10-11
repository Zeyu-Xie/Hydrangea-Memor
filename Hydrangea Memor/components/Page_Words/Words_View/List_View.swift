//
//  WordListView.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/10.
//

import Foundation
import SwiftUI

struct List_View: View {
    @State private var source: String
    @State private var wordList: WordList = WordList()
    @State private var number: Int = 0
    
    @State private var isListView: Bool = true
    
    @State private var selectedOption: Int = 1
    
    init() {
        self.source = ""
    }
    
    init(source: String) {
        self.source = source
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
        
        ScrollView{
            
            LazyVStack {
                ForEach(0..<number, id: \.self) { i in
                    HStack {
                        Text(selectedOption != 0 ? wordList.items[i].English! : "").frame(width: 200, alignment: .leading)
                        
                        
                        Text(wordList.items[i].Phonetic!).frame(width: 200, alignment: .leading)
                        
                        
                        Text(selectedOption != 2 ? wordList.items[i].Chinese! : "").frame(width: 200, alignment: .leading)
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
