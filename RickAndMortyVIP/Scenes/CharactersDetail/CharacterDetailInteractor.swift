//
//  CharacterDetailInteractor.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

protocol CharacterDetailInteractorLogic: AnyObject {
    func fetch(idCharacter: String)
}

class CharacterDetailInteractor: CharacterDetailInteractorLogic {
    let characterApiWorker: CharacterDetailAPIWorker
    var presenter: CharacterDetailPresenterLogic?
    
    init(characterApiWorker: CharacterDetailAPIWorker = CharacterDetailAPIWorker()) {
        self.characterApiWorker = characterApiWorker
    }
    
    func fetch(idCharacter: String) {
        characterApiWorker.fetch(idCharacter: idCharacter) { [weak self] character in
            let response = CharacterDetailModels.Fetch.Response(character: character)
            self?.presenter?.fetch(response)
        }
    }
}
