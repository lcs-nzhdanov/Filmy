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
        
//        ForEach(0..<moviesList.count, id:\.self) { index in
//            if moviesList[index].isInLibrary {
//                libraryList.append(moviesList[index])
//            }
//        }
        
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<libraryList.count, id:\.self) { index in
                        NavigationLink(
                            destination: {
                                MovieDetailsView(movie: libraryList[index])
                            },
                            label: { Text("\(libraryList[index].title)")
                            })
                    }
                }
                .listStyle(.plain)
                .searchable(text: Binding.constant(""))
            }
        }
    }
}

#Preview {
    LandingView(selectedTab: Binding.constant(2))
}
