//
//  CharacterDetailModels.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

enum CharacterDetailModels {
    enum Fetch {
        struct Request {}
        struct Response { var character: CharactersAPIModel? }
        class ViewModel: ObservableObject {
            @Published var character: CharactersAPIModel?
        }
    }
}
