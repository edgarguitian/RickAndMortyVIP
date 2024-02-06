//
//  CharacterListFactory.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation
import SwiftUI

class CharacterListFactory {
    static func createMainView() -> some View {
        var view = CharactersListView(model: CharactersListModels.Fetch.ViewModel(),
                                      createCharacterDetailView: CharacterDetailFactory())
        let interactor = CharactersListInteractor()
        let presenter = CharactersListPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
