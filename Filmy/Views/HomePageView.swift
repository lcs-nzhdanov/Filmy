//
//  ContentView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct HomePageView: View {
    // MARK: Stored Properties
    
    // Report on the swipe direction, once a swipe occurs
    @State var userLike: Bool = false
    
    // Keep track of what tab we are currently on
    @State var currentTab: Int = 0
    
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
            
            // What tab are we on?
            Text("Current tab index: \(currentTab)")
            
            Text(userLike ? "Liked" : "Not Liked")
        }
        // This is triggered whenever the current tab changes
            .onChange(of: currentTab) { oldValue, newValue in
                
                // Figure out what direction the swipe was
                if oldValue > newValue {
                    userLike = false
                } else {
                    userLike = true
                }
                
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
