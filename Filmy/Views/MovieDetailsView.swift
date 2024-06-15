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
    
    @Binding var libraryList: [MovieDetails]
    
    var statuses = ["Not Watched", "To Watch", "Watched", "Favourite"]
    
    var body: some View {
        ScrollView {
            VStack {                
                VStack (spacing: 0) {
                    Text(movie.title)
                        .font(.title)
                        .padding(.bottom, 10)
                        .bold()
                    
                    Divider()
                        .overlay(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 5)
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
                    .padding(.vertical, 10)
                
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Text("Status: ")
                            .bold()
                        
                        Menu {
                            ForEach(statuses, id: \.self) { status in
                                Button(action: {
                                    movie.status = status
                                    
                                    
                                    if movie.status != "Not Watched" {
                                        if !movie.isInLibrary {      // Check if movie is already there to avoid repetition
                                            
                                            movie.isInLibrary = true
                                            libraryList.append(movie)
                                            
                                            print("New status added, ", libraryList.count)
                                        }
                                    } else {
                                        if movie.isInLibrary {
                                            
                                            movie.isInLibrary = false
                                            libraryList.removeAll { currentMovie in
                                                currentMovie.id == movie.id
                                            }
                                            
                                            print("Movie just got removed", libraryList.count)
                                        }
                                    }
                                }) {
                                    HStack {
                                        Text(status)
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(5)
                                }
                            }
                        } label: {
                            HStack {
                                Text("\(movie.status)")
                                    .foregroundColor(colorForStatus(status: movie.status))
                                
                                // Need to create a border with a fixed size
                                
                            }
                            .padding()
                            .cornerRadius(8)
                            .padding(.trailing, 70)
                        }
                        
                        Spacer()
                    }
                    .font(.system(size: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)
                    
                    
                    Divider()
                        .overlay(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                    
                    
                    VStack (spacing: 0) {
                        
                        Group {
                            HStack {
                                Text("Date Released:")
                                    .bold()
                                Text(movie.date_released)
                                Spacer()
                            }
                            
                            HStack {
                                Text("Duration:")
                                    .bold()
                                Text(minutesToHours(lengthMinutes: movie.duration_m))
                                Spacer()
                            }
                            
                            HStack {
                                Text("Genres:")
                                    .bold()
                                Text(listToString(list: movie.genres))
                                Spacer()
                            }
                            
                            HStack {
                                Text("Actors:")
                                    .bold()
                                Text(listToString(list: movie.actorsInvolved))
                                Spacer()
                            }
                            
                            HStack {
                                Text("IMBD:")
                                    .bold()
                                
                                // Format to 1 decimal place
                                Text("\(String(format: "%.1f", movie.imbdRating))")
                                Spacer()
                            }
                        }
                        .font(.system(size: 20))
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                        
                        
                        Divider()
                            .overlay(.white)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 10)
                        
                        
                        VStack {
                            Text("Description")
                                .font(.system(size: 20))
                                .padding(.bottom, 10)
                                .bold()
                            
                            Text(movie.description)
                                .padding(.horizontal, 24)
                                .font(.system(size: 20))
                        }
                    }
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
    
    func colorForStatus(status: String) -> Color {
        switch status {
        case "Not Watched":
            return .gray
        case "To Watch":
            return .yellow
        case "Watched":
            return .green
        case "Favourite":
            return .pink
        default:
            return .gray
        }
    }
}
#Preview {
    MovieDetailsView(movie: DunePartTwo, libraryList: Binding.constant([]))
}
