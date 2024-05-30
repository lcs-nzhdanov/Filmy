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
            
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(width: 325, height: 550)
                    .cornerRadius(40)
                    .overlay {
                        VStack {
                            VStack (spacing: 0) {
                                Text("Dune: Part Two")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .padding(.bottom, 10)
                                    .bold()
                                
                                Divider()
                                    .overlay(.white)
                                    .padding(.horizontal, 60)
                            }
                            .padding(.top, 25)
                            .padding(.bottom, 10)
                            
                            TabView {
                                // Future automatic image adding
                                
//                                ForEach (1 ..< 2) { index in
//                                Image("duneP\(index)")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .padding(.horizontal, 8)
                                
                                Image(.duneP1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 8)
                                
                                Image(.duneP1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 8)
//                                }
                            }
                            .tabViewStyle(.page)
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            
                            Divider()
                                .overlay(.white)
                                .padding(.horizontal, 60)
                                .padding(.vertical, 5)
                            
                            VStack (spacing: 0) {
                                
                                Group {
                                    Text("2024")
                                    
                                    Text("Sci-fi")
                                    
                                    Text("2h 46m")
                                    
                                    Text("On netflix")
                                }
                                .font(.system(size: 20))
                                .padding(.bottom, 10)
                                .foregroundStyle(.white)
                                
                                Divider()
                                    .overlay(.white)
                                    .padding(.horizontal, 60)
                                    .padding(.vertical, 5)
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    print("Edit button was tapped")
                                } label: {
                                    VStack (spacing: 0) {
                                        Image(systemName: "ellipsis.circle")
                                            .font(.system(size: 44))
                                            .padding(.bottom, 3)
                                            .bold()
                                        Text("More")
                                            .font(.system(size: 18))
                                            .bold()
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                Spacer()
                                
                                Button {
                                    print("Edit button was tapped")
                                } label: {
                                    VStack (spacing: 0) {
                                        Image(systemName: "seal")
                                            .font(.system(size: 44))
                                            .padding(.bottom, 3)
                                            .bold()
                                        Text("To Watch")
                                            .font(.system(size: 18))
                                            .bold()
                                    }
                                }
                                .padding(.horizontal, 20)
                                .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            
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
