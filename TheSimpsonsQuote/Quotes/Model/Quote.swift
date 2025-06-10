//
//  Quote.swift
//  TheSimpsonsQuote
//
//  Created by Артем Кудрявцев on 09.06.2025.
//

import Foundation

class Quote: Decodable {
    let character: String
    let characterDirection: String
    let image: String
    let quote: String
}
