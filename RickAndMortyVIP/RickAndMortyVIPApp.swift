//
//  RickAndMortyVIPApp.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import SwiftUI

@main
struct RickAndMortyVIPApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListFactory.createMainView()
        }
    }
    
    
}
