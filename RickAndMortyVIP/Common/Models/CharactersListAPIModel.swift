//
//  CharactersListAPIModel.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

struct CharactersListAPIModel: Codable, Equatable {
    let info: InfoAPIModel
    let results: [CharactersAPIModel]
}
