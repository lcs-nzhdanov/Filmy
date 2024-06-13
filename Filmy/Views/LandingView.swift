//
//  LandingView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-12.
//

import SwiftUI

struct LandingView: View {
    
    @Binding var selectedTab: Int
    
    @Binding var moviesList: [MovieDetails]
    
    @Binding var libraryList: [MovieDetails]
    
    @Binding var didLike: [MovieDetails]
    @Binding var didNotLike: [MovieDetails]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomePageView(
                moviesList: $moviesList,
                libraryList: $libraryList,
                didLike: $didLike,
                didNotLike: $didNotLike
            )
                .preferredColorScheme(.dark)
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
            
            LibraryPageView(libraryList: Binding.constant([]))
                .preferredColorScheme(.dark)
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
                .preferredColorScheme(.dark)
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
                .preferredColorScheme(.dark)
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
    //Gives a black bg
        .onAppear {
                UITabBar.appearance().backgroundColor = UIColor.black
                UITabBar.appearance().unselectedItemTintColor = UIColor.gray
            }

    }
}

#Preview {
    LandingView(
        selectedTab:  Binding.constant(1),
        moviesList:  Binding.constant([]),
        libraryList:  Binding.constant([]),
        didLike:  Binding.constant([]),
        didNotLike:  Binding.constant([])
    )
}
