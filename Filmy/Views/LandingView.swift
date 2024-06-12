//
//  LandingView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-12.
//

import SwiftUI

struct LandingView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomePageView()
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
            
            LibraryPageView()
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
    LandingView(selectedTab: Binding.constant(1))
}
