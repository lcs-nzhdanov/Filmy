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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home")
        }
        .padding()
    }
}

#Preview {
    //ContentView()
    
    TabView() {
        
        HomePageView()
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
