//
//  CharacterDetailPresenter.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

protocol CharacterDetailPresenterLogic: AnyObject {
    func fetch(_ reponse: CharacterDetailModels.Fetch.Response)
}

class CharacterDetailPresenter: CharacterDetailPresenterLogic {
    var view: CharacterDetailViewLogic?
    
    func fetch(_ reponse: CharacterDetailModels.Fetch.Response) {
        let character = reponse.character
        let viewModel = CharacterDetailModels.Fetch.ViewModel()
        viewModel.character = character
        view?.fetch(viewModel)
    }
}
