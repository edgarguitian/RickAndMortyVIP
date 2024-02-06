//
//  CharacterDetailView.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import SwiftUI

protocol CharacterDetailViewLogic {
    func fetch(_ viewModel: CharacterDetailModels.Fetch.ViewModel)
}

struct CharacterDetailView: View {
    @ObservedObject var model: CharacterDetailModels.Fetch.ViewModel
    let characterId: String

    var interactor: CharacterDetailInteractorLogic?
    
    var body: some View {
        VStack {
            if model.character == nil {
                LoadingSpinnerView()
            } else {
                List {

                    if let character = model.character {
                        CachedAsyncImage(url: URL(string: character.image),
                                            urlCache: .imageCache) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 300, height: 300)
                                            .clipShape(RoundedRectangle(cornerRadius: 35))
                                            .padding(.vertical)
                                    case .failure:
                                        // Handle failure, you might want to show an error view here
                                        AsyncImage(url: URL(string: character.image)) { image in
                                            image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 300, height: 300)
                                            } placeholder: {
                                            ProgressView()
                                            }
                                            .clipShape(RoundedRectangle(cornerRadius: 35))
                                            .padding(.vertical)
                                    }
                                }

                        Section(header: Text("INFO")
                                            .font(.title2)
                        ) {
                            CharacterDetailItemView(title: "🟢 Status",
                                                    value: character.status)
                            CharacterDetailItemView(title: "🧬 Species",
                                                    value: character.species)
                            
                            CharacterDetailItemView(title: "👤 Gender",
                                                    value: character.gender)
                        }

                    } else {
                        Text("Error")
                    }
                    
                }
                
            }
        }
        .navigationTitle(model.character?.name ?? "")
        .onAppear {
            interactor?.fetch(idCharacter: characterId)
        }
    }
}

extension CharacterDetailView: CharacterDetailViewLogic {
    func fetch(_ viewModel: CharacterDetailModels.Fetch.ViewModel) {
        DispatchQueue.main.sync {
            model.character = viewModel.character
        }
    }
}

#Preview {
    CharacterDetailFactory().create(idCharacter: "1")
}
