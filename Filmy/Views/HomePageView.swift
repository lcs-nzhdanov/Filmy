//
//  ContentView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct HomePageView: View {
    // MARK: Stored Properties


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
                            MovieBox(movie: moviesList[index], libraryList: Binding.constant([]), didLike: Binding.constant([]), didNotLike: Binding.constant([])) {
                                withAnimation {
                                    removeMovie(at: index)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    
                    Spacer()
                }
            }
        }
    }
    
    // Removes a movie from the array
    func removeMovie(at index: Int) {
        moviesList.remove(at: index)
    }
}

#Preview {
    LandingView(selectedTab: Binding.constant(1))
}
