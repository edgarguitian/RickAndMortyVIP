//
//  CharacterDetailFactory.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation
import SwiftUI

class CharacterDetailFactory: CreateCharacterDetailView {
    func create(idCharacter: String) -> CharacterDetailView {
        var view = CharacterDetailView(model: CharacterDetailModels.Fetch.ViewModel(), characterId: idCharacter)
        let interactor = CharacterDetailInteractor()
        let presenter = CharacterDetailPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
