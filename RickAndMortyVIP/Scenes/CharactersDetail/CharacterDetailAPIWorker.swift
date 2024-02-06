//
//  CharacterDetailAPIWorker.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

class CharacterDetailAPIWorker {
    var API_URL: String { "https://rickandmortyapi.com/api/character/" }
    
    func fetch(idCharacter: String, completed: @escaping (CharactersAPIModel?) -> Void) {
        let url = URL(string: "\(API_URL)"+idCharacter)!

        let task = URLSession.shared.dataTask(with: url) { value, response, error in
            if let value = value {
                let character = try? JSONDecoder().decode(CharactersAPIModel.self, from: value)
                completed(character)
            } else {
                completed(nil)
            }
        }
        task.resume()
    }
}
