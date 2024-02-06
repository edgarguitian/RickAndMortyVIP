//
//  CharactersListInteractor.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import Foundation

protocol CharactersListInteractorLogic: AnyObject {
    func fetch()
}

class CharactersListInteractor: CharactersListInteractorLogic {
    let charsListApiWorker: CharactersListAPIWorker
    var presenter: CharactersListPresenterLogic?
    
    init(charsListApiWorker: CharactersListAPIWorker = CharactersListAPIWorker()) {
        self.charsListApiWorker = charsListApiWorker
    }
    
    func fetch() {
        charsListApiWorker.fetch { [weak self] charsList in
            let response = CharactersListModels.Fetch.Response(charsList: charsList)
            self?.presenter?.fetch(response)
        }
    }
}
