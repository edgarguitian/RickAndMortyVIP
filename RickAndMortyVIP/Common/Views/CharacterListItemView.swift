//
//  CharacterListItemView.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import SwiftUI

struct CharacterListItemView: View {
    let item: CharactersAPIModel

    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: item.image), urlCache: .imageCache) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .padding(.vertical)
                        case .failure:
                            AsyncImage(url: URL(string: item.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 35))
                            .padding(.vertical)
                        }
                    }

            Spacer()
                    .frame(width: 20)
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)

                Text(item.status)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                    .padding(.vertical, 2)

                Text(item.species)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                    .padding(.vertical, 2)
            }

            Spacer()

            HStack {
                Image(systemName: "chevron.right")

                Spacer().frame(width: 10)
            }
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("CellBackgroundColor"))
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4.0, x: 0.0, y: 4.0)
        .padding(.vertical)
        .frame(height: 140)
    }
}

#Preview {
    CharacterListItemView(item: CharactersAPIModel(id: 1,
                                                   name: "Test Name 1",
                                                   status: "Test Status 1",
                                                   species: "Test Species 1",
                                                   gender: "Test Gender 1",
                                                   url: "",
                                                   image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    )
}

