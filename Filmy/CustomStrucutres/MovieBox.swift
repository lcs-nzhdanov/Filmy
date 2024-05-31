//
//  MovieBox.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-31.
//

import SwiftUI

struct MovieBox: View {
    
    // Importing movie information
    @Bindable var movie: MovieDetails
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(width: 325, height: 550)
                .cornerRadius(40)
                .overlay {
                    VStack {
                        VStack (spacing: 0) {
                            Text(movie.name)
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
                        
                        Divider()
                            .overlay(.white)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 5)
                        
                        VStack (spacing: 0) {
                            
                            Group {
                                Text(DunePartTwo.year)
                                
                                Text("Sci-fi")
                                
                                Text(minutesToHours(lengthMinutes: 166))
                                
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
                                movie.isToWatch.toggle()
                                
                                
                            } label: {
                                VStack (spacing: 0) {
                                    Image(systemName: movie.isToWatch ? "seal.fill" : "seal")
                                        .font(.system(size: 44))
                                        .padding(.bottom, 3)
                                        .bold()
                                    Text(movie.isToWatch ? "In Library" : "To Watch")
                                        .font(.system(size: 18))
                                        .bold()
                                }
                            }
                            .padding(.horizontal, 20)
                            .foregroundStyle(movie.isToWatch ? .yellow : .white)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
        }
    }
}

#Preview {
    MovieBox(movie: DunePartTwo)
}
