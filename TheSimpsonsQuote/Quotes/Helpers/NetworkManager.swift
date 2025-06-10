//
//  NetworkManager.swift
//  TheSimpsonsQuote
//
//  Created by Артем Кудрявцев on 09.06.2025.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let urlString = "https://thesimpsonsquoteapi.glitch.me/quotes?count=20"
    
    func fetchData(completion: @escaping ([Quote]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    completion(quotes)
                }
            } catch {
                print("Failed serializing JSON: \(error)")
            }
        }.resume()
    }
}
