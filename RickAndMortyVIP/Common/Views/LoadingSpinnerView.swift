//
//  LoadingSpinnerView.swift
//  RickAndMortyVIP
//
//  Created by Edgar Guitian Rey on 6/2/24.
//

import SwiftUI

struct LoadingSpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
}

#Preview {
    LoadingSpinnerView()
}

