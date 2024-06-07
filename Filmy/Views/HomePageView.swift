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
    @State var swipeDirection: String = ""
    
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
            
            // An ability to swipe movies
            // The TabView will updated $currentTab with the tag of whatever page is currently selected
            TabView (selection: $currentTab){
                
                // ForEach which goes through array with movies and displays them to swipe
                ForEach(Array(moviesList.enumerated()), id: \.offset) { index, nextMovie in
                    MovieBox(movie: nextMovie) // Display the movie
                        .tag(index) // tag with the integer
                }
            }
            .tabViewStyle(.page)
            //.indexViewStyle(.page(backgroundDisplayMode: .always))
            
            
            
            // What tab are we on?
            Text("Current tab index: \(currentTab)")
            
            Text(swipeDirection)
        }
        // This is triggered whenever the current tab changes
            .onChange(of: currentTab) { oldValue, newValue in
                
                // Figure out what direction the swipe was
                if oldValue > newValue {
                    swipeDirection = "User swiped right."
                } else {
                    swipeDirection = "User swiped left."
                }
                
            }
        
        
        
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
