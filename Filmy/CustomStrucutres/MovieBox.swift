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
    
    @State private var offset = CGSize.zero
    
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)

                .frame(width: 325, height: 550)
                .cornerRadius(40)
                .overlay {
                    VStack {
                        VStack (spacing: 0) {
                            Text(movie.title)
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
                                Text(movie.title)
                                
                                Text(listToString(list: movie.actorsInvolved))
                                
                                Text(minutesToHours(lengthMinutes: movie.duration_m))
                                
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
        //How much card rotates when dragges
        .rotationEffect(.degrees(offset.width / 5.0))
        
        // How much card moves when dragged
        .offset(x: offset.width * 3)
        
        // How much card's opacity changes when dragged
        .opacity(2 - Double(abs(offset.width / 50)))
        
        // Dragging
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) >= 100 {
                        // remove movie
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
    }
}

#Preview {
    MovieBox(movie: DunePartTwo)
}
