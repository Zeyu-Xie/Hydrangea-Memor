//
//  ContentView.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var source: String = "https://zeyu-xie.github.io/Hydrangea-Memor/data/GRE_words.json"
    @State private var wordList: WordList = WordList()
    @State private var number: Int = 0
    
    
    var body: some View {
        TabView {
            ScrollView{
                LazyVStack {
                    ForEach(0..<number, id: \.self) { i in
                        HStack {
                            Text(wordList.items[i].English != nil ? wordList.items[i].English! : "").frame(width: 200, alignment: .leading)
                            
                            
                            
                            Text(wordList.items[i].Chinese != nil ? wordList.items[i].Chinese! : "").frame(width: 200, alignment: .leading)
                        }.padding()
                    }
                }
            }.tabItem {
                Text("Word List")
            }
        }
        .padding().onAppear {
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
                            print(wordList.items[0], wordList.items[1], wordList.items[2], wordList.items[3])
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
