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
    
    init() {
        self.source = ""
    }
    
    init(source: String) {
        self.source = source
    }
    
    var body: some View {
            ScrollView{
                LazyVStack {
                    ForEach(0..<number, id: \.self) { i in
                        HStack {
                            Text(wordList.items[i].English != nil ? wordList.items[i].English! : "").frame(width: 200, alignment: .leading)
                            
                            
                            
                            Text(wordList.items[i].Chinese != nil ? wordList.items[i].Chinese! : "").frame(width: 200, alignment: .leading)
                        }.padding()
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
