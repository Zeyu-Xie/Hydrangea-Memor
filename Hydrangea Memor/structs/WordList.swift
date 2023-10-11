//
//  WordList.swift
//  Hydrangea Memor
//
//  Created by Acan on 2023/10/10.
//

import Foundation

struct WordList: Codable {
    var title: String? = ""
    var number: Int = 0
    var author: String? = ""
    var date: String? = ""
    var index_num: Int = 0
    var indexes: Array<String> = []
    var items: Array<Word> = []
}
