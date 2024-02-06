//
//  CharactersListPresenter.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

protocol CharactersListPresenterLogic: AnyObject {
    func fetch(_ response: CharactersListModels.Fetch.Response)
}

class CharactersListPresenter: CharactersListPresenterLogic {
    var view: CharactersListViewLogic?
    
    func fetch(_ response: CharactersListModels.Fetch.Response) {
        let charsList = response.charsList
        let viewModel = CharactersListModels.Fetch.ViewModel()
        viewModel.charsList = charsList
        view?.fetch(viewModel)
    }
}
