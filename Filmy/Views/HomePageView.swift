//
//  ContentView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct HomePageView: View {
    // MARK: Stored Properties
    
    @Binding var moviesList: [MovieDetails]
    
    @Binding var libraryList: [MovieDetails]
    
    @Binding var didLike: [MovieDetails]
    @Binding var didNotLike: [MovieDetails]
    
    // MARK: Computed properties
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [.gradientBrown, .gradientDarkPurple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    Text("For you")
                    Divider()
                        .overlay(.white)
                        .padding(.horizontal, 150)
                    
                    Spacer()
                    
                    // Creation of recomended movies
                    ZStack {
                        
                        ForEach(Array($moviesList.enumerated()).reversed(), id: \.offset) { index, $movie in
                            let reversedIndex = moviesList.count - 1 - index // Adjust the index to count downwards
                            

                            MovieBox(
                                movie: $movie,
                                moviesList: $moviesList,
                                libraryList: $libraryList,
                                didLike: $didLike,
                                didNotLike: $didNotLike
                            ) {
                                print("movie countOOOOOOOO", moviesList.count)
                                
                                
                                print("INDEXINDEXINDEXINDEX: ", reversedIndex)
                                print(moviesList[reversedIndex].title)
                                
                                // This closure is passed to the `MovieBox` as the `removal` action
                                withAnimation {
                                    removeMovie(at: reversedIndex)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    // Removes a movie from the array after swipe
    func removeMovie(at index: Int) {
        moviesList.remove(at: index)
        print("Count after delete ", moviesList.count)
        print("Deleted index", index)
    }
}

#Preview {
    LandingView(
        selectedTab: Binding.constant(1),
        moviesList:  Binding.constant([]),
        libraryList:  Binding.constant([]),
        didLike:  Binding.constant([]),
        didNotLike:  Binding.constant([])
    )
}
