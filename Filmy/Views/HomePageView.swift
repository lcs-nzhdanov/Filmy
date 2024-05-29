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
                .padding(.horizontal, 150)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(width: 325, height: 525)
                    .cornerRadius(40)
                    .overlay {
                        VStack {
                            VStack (spacing: 0) {
                                Text("Dune: Part Two")
                                    .foregroundStyle(.white)
                                .font(.title)
                                .padding(.bottom, 10)
                                
                                Divider()
                                    .overlay(.white)
                                    .padding(.horizontal, 60)
                            }
                            .padding(.top, 25)
                            
                            Spacer()
                            
                            
                        }
                    }
            }
            
            Spacer()
        }
    }
}

#Preview {
    
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
