//
//  InfoAPIModel.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

struct InfoAPIModel: Codable, Equatable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
