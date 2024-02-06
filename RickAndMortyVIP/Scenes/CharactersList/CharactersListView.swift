//
//  CharactersListView.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import SwiftUI

protocol CharactersListViewLogic {
    func fetch(_ viewModel: CharactersListModels.Fetch.ViewModel)
}

protocol CreateCharacterDetailView {
    func create(idCharacter: String) -> CharacterDetailView
}

struct CharactersListView: View {
    @ObservedObject var model: CharactersListModels.Fetch.ViewModel
    private let createCharacterDetailView: CreateCharacterDetailView

    var interactor: CharactersListInteractorLogic?
    
    init(model: CharactersListModels.Fetch.ViewModel, createCharacterDetailView: CreateCharacterDetailView, interactor: CharactersListInteractorLogic? = nil) {
        self.model = model
        self.createCharacterDetailView = createCharacterDetailView
        self.interactor = interactor
    }
    
    @State private var searchCharacterText: String = ""

    var body: some View {
        VStack {
            if model.charsList == nil {
                LoadingSpinnerView()
            } else {
                NavigationStack {
                    ScrollView {
                        ForEach(model.charsList!.results, id: \.id) { character in
                            NavigationLink {
                                createCharacterDetailView.create(idCharacter: String(character.id))
                            } label: {
                                CharacterListItemView(item: character)
                            }.onAppear {
                                // loadMoreCharactersIfNeeded(currentCharacter: character)
                            }
                        }
                        .accessibilityIdentifier("forEachCharacters")
                    }
                    .navigationTitle("Characters")
                    .accessibilityIdentifier("listCharacters")

                }
                
            }
        }.onAppear {
            interactor?.fetch()
        }
    }
}

extension CharactersListView: CharactersListViewLogic {
    func fetch(_ viewModel: CharactersListModels.Fetch.ViewModel) {
        DispatchQueue.main.sync {
            model.charsList = viewModel.charsList
        }
    }
}

#Preview {
    CharacterListFactory.createMainView()
}
