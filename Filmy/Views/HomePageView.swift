//
//  ContentView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct HomePageView: View {
    // MARK: Stored Properties
    @State private var didNotLike: [MovieDetails] = []
    @State private var didLike: [MovieDetails] = []

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
                    
                    // Creation of recommended movies
                    ZStack {
                        ForEach(0..<moviesList.count, id:\.self) { index in
                            MovieBox(movie: moviesList[index]) {
                                withAnimation {
                                    removeMovie(at: index)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    
                    Text("Interstellar: \(Interstellar.userLiked ? "Liked" : "Not Liked")")
                    Text("Batman: \(Batman.userLiked ? "Liked" : "Not Liked")")
                    Text("Dune: \(DunePartTwo.userLiked ? "Liked" : "Not Liked")")
                    
                    Spacer()
                }
            }
        }
    }
    
    // Removes a movie from the array
    func removeMovie(at index: Int) {
        didLike.append(moviesList[index])
        moviesList.remove(at: index)
    }
}

#Preview {
    LandingView(selectedTab: Binding.constant(1))
}
