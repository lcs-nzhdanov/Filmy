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
        VStack {
            
            Text("For you")
            Divider()
                .overlay(.white)
                .padding(.horizontal, 150)
            
            Spacer()
            
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
        }
    }
    
    func removeMovie(at index: Int) {
        moviesList.remove(at: index)
    }
}

#Preview {
    
    TabView() {
        
        HomePageView()
        //   .preferredColorScheme(.dark)
            .tabItem {
                Image(
                    systemName: "house.fill"
                )
                Text(
                    "Home"
                )
            }
            .tag(
                1
            )
        
        LibraryPageView()
            .tabItem {
                Image(
                    systemName: "star.fill"
                )
                Text(
                    "Library"
                )
            }
            .tag(
                2
            )
        
        SearchPageView()
            .tabItem {
                Image(
                    systemName: "magnifyingglass"
                )
                Text(
                    "Search"
                )
            }
            .tag(
                3
            )
        
        ProfilePageView()
            .tabItem {
                Image(
                    systemName: "person.fill"
                )
                Text(
                    "Profile"
                )
            }
            .tag(
                4
            )
    }
    .accentColor(
        .blue
    )
    
}
