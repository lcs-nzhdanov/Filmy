//
//  ContentView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack {
            
            Text("For you")
            Divider()
                .overlay(.white)
                .padding(.horizontal, 150)
            
            Spacer()
            TabView {
                MovieBox(movie: DunePartTwo)
                MovieBox(movie: DunePartTwo)
                MovieBox(movie: DunePartTwo)
            }
            .tabViewStyle(.page)
            //.indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Spacer()
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
