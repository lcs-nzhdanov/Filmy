//
//  LibraryView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI



struct LibraryPageView: View {
    
    @Binding var libraryList: [MovieDetails]
      
    var body: some View {
        
        NavigationStack {
            VStack {
                List (libraryList) { currentMovie in
                    NavigationLink {
                        MovieDetailsView(movie: currentMovie, libraryList: $libraryList)
                    } label: {
                        Text(currentMovie.title)
                    }

                }
                .listStyle(.plain)
                .searchable(text: Binding.constant(""))
            }
        }
    }
}

#Preview {
    LandingView(
        selectedTab:  Binding.constant(2),
        moviesList:  Binding.constant([]),
        libraryList:  Binding.constant([]),
        didLike:  Binding.constant([]),
        didNotLike:  Binding.constant([])
    )
}
