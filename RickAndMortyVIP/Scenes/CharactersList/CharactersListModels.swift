//
//  CharactersListModels.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

enum CharactersListModels {
    enum Fetch {
        struct Request {}
        struct Response { var charsList: CharactersListAPIModel? }
        class ViewModel: ObservableObject {
            @Published var charsList: CharactersListAPIModel?
        }
    }
}
