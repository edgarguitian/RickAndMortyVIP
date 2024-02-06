//
//  CharactersListAPIWorker.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

class CharactersListAPIWorker {
    var API_URL: String { "https://rickandmortyapi.com/api/character/?page=1" }
    
    func fetch(completed: @escaping (CharactersListAPIModel?) -> Void) {
        let url = URL(string: "\(API_URL)")!

        let task = URLSession.shared.dataTask(with: url) { value, response, error in
            if let value = value {
                let charsList = try? JSONDecoder().decode(CharactersListAPIModel.self, from: value)
                completed(charsList)
            } else {
                completed(nil)
            }
        }
        task.resume()
    }
}
