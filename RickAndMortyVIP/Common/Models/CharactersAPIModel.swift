//
//  CharactersAPIModel.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

struct CharactersAPIModel: Codable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let url: String
    let image: String
}
