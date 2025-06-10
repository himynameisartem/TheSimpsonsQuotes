//
//  Details.swift
//  TheSimpsonsQuote
//
//  Created by Артем Кудрявцев on 10.06.2025.
//

import Foundation

class Details {
    let person: String
    let quote: String
    let imageUrl: String
    
    init(person: String, quote: String, imageUrl: String) {
        self.person = person
        self.quote = quote
        self.imageUrl = imageUrl
    }
}
