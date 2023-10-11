//
//  Card.swift
//  Hydrangea Memor
//
//  Created by 谢泽钰 on 2023/10/11.
//

import Foundation
import SwiftUI

struct Card: View {
    var cardTitle: String
    var cardCallOut : String
    var cardContent: String
    
    init(cardTitle: String, cardCallOut: String ,cardContent: String) {
        self.cardTitle = cardTitle
        self.cardCallOut = cardCallOut
        self.cardContent = cardContent
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text(cardTitle)
                    .font(.title)
                    .foregroundColor(.blue)

                Text(cardCallOut).font(.callout)
            }.frame(alignment: .leading)
            
            
            Text(cardContent)
                .foregroundColor(.black)
        }.frame(minWidth: 150, minHeight: 97, alignment: .leading)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5)).onTapGesture {
            NSSpeechSynthesizer().startSpeaking(cardTitle)
        }
    }
}
