//
//  SearchView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct SearchPageView: View {
    var body: some View {
        NavigationStack {
            Text("Type a movie name")
                .font(.title2)
                .opacity(0.3)
        }
        .searchable(text: Binding.constant(""))
    }
}

#Preview {
    SearchPageView()
}
