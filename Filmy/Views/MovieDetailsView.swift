//
//  MovieDetailsView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-11.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: Stored Properties
    @Bindable var movie: MovieDetails
    
    var body: some View {
        ScrollView {
            VStack {
                
                VStack (spacing: 0) {
                    Text(movie.title)
                        .font(.title)
                        .padding(.bottom, 10)
                        .bold()
                    
                    Divider()
                        .padding(.horizontal, 60)
                }
                .padding(.top, 25)
                .padding(.bottom, 10)
                
                TabView {
                    // Future automatic image adding
                    
                    //                            ForEach (1 ..< 2) { index in
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
                    //                            }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(minHeight: 300)
                
                Divider()
                    .overlay(.white)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 5)
                
                VStack (spacing: 0) {
                    
                    Group {
                        Text(movie.title)
                        
                        Text(listToString(list: movie.actorsInvolved))
                        
                        Text(minutesToHours(lengthMinutes: movie.duration_m))
                        
                        Text(listToString(list: movie.platformsToWatch))
                        
                        Text(movie.title)
                        
                        Text(listToString(list: movie.actorsInvolved))
                        
                        Text(minutesToHours(lengthMinutes: movie.duration_m))
                        
                        Text(listToString(list: movie.platformsToWatch))
                        
                        Text(movie.title)
                        
                        Text(listToString(list: movie.actorsInvolved))
                        
                        Text(minutesToHours(lengthMinutes: movie.duration_m))
                        
                        Text(listToString(list: movie.platformsToWatch))
                    }
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                }
                
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    MovieDetailsView(movie: DunePartTwo)
}
