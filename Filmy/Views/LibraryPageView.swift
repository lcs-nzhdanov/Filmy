//
//  LibraryView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct LibraryPageView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink(
                        destination: {
                            MovieDetailsView(movie: DunePartTwo)
                    },
                        label: { Text("\(DunePartTwo.title)")
                    })
                }
                .listStyle(.plain)
                .searchable(text: Binding.constant(""))
            }
        }
    }
}

#Preview {
    LibraryPageView()
}
