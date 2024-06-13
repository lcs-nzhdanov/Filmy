import SwiftUI

struct MovieBox: View {
    // MARK: Stored Properties
    
    // Importing movie information
    @Binding var movie: MovieDetails
    
    @State private var offset = CGSize.zero

    
    @Binding var moviesList: [MovieDetails]
    
    @Binding var libraryList: [MovieDetails]
    
    @Binding var didLike: [MovieDetails]
    @Binding var didNotLike: [MovieDetails]
    
    // MARK: Clarify Meaning
    var removal: (() -> Void)? = nil
    
    // MARK: Computed properties
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 325, height: 550)
                    .cornerRadius(40)
                    .overlay {
                        VStack {
                            VStack (spacing: 0) {
                                Text(movie.title)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding(.bottom, 10)
                                    .bold()
                                
                                Divider()
                                    .overlay(Color.white)
                                    .padding(.horizontal, 60)
                            }
                            .padding(.top, 25)
                            .padding(.bottom, 10)
                            
                            Image("duneP1") // Use the image name directly
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 8)
                            
                            Divider()
                                .overlay(Color.white)
                                .padding(.horizontal, 60)
                                .padding(.vertical, 5)
                            
                            VStack (spacing: 0) {
                                Group {
                                    Text(movie.title)
                                    
                                    Text(listToString(list: movie.actorsInvolved))
                                    
                                    Text(minutesToHours(lengthMinutes: movie.duration_m))
                                    
                                    Text("On Netflix")
                                    
                                    if didLike.count > 0 {
                                        Text("hi\(didLike[0].title)")
                                    }
                                }
                                .font(.system(size: 20))
                                .padding(.bottom, 10)
                                .foregroundColor(.white)
                                
                                Divider()
                                    .overlay(Color.white)
                                    .padding(.horizontal, 60)
                                    .padding(.vertical, 5)
                            }
                            
                            HStack {
                                Spacer()
                                
                                NavigationLink(destination: MovieDetailsView(movie: movie)) {
                                    VStack(spacing: 0) {
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
                                    movie.isInLibrary.toggle()
                                    dump(movie.isInLibrary)
                                    
                                    if movie.isInLibrary {
                                        libraryList.append(movie)
                                    } else {
                                        libraryList.removeAll { currentMovie in
                                            currentMovie.id == movie.id
                                        }
                                    }
                                    
                                    dump(libraryList.count)
                                    
                                } label: {
                                    VStack (spacing: 0) {
                                        Image(systemName: movie.isInLibrary ? "seal.fill" : "seal")
                                            .font(.system(size: 44))
                                            .padding(.bottom, 3)
                                            .bold()
                                        Text(movie.isInLibrary ? "In Library" : "To Watch")
                                            .font(.system(size: 18))
                                            .bold()
                                    }
                                }
                                .padding(.horizontal, 20)
                                .foregroundColor(movie.isInLibrary ? .yellow : .white)
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                    }
                
            }
            // How much card rotates when dragged
            .rotationEffect(.degrees(offset.width / 5.0))
            
            // How much card moves when dragged
            .offset(x: offset.width * 3)
            
            // How much card's opacity changes when dragged
            .opacity(2 - Double(abs(offset.width / 30)))
            
            // Dragging
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        
                    }
                    .onEnded { _ in
                        if abs(offset.width) >= 75 {
                            
                            // Check on which side did movie go to determine the like
                            if offset.width > 0 {
                                
                                // Add to the didLike array
                                if !didLike.contains(where: { currentMovie in
                                    currentMovie.id == movie.id
                                }) {
                                    didLike.append(movie)
                                }
                                movie.userLiked = true
                                
                            } else if offset.width < 0 {
                                
                                // Add to the didNotLike array
                                if !didNotLike.contains(where: { currentMovie in
                                    currentMovie.id == movie.id
                                }) {
                                    didNotLike.append(movie)
                                }
                                
                                movie.userLiked = false
                            }
                            
                            // remove movie
                            removal?()
                        } else {
                            offset = .zero
                        }
                    }
            )
        }
    }
}

#Preview {
    MovieBox(
        movie: Binding.constant(DunePartTwo),
        moviesList:  Binding.constant([]),
        libraryList:  Binding.constant([]),
        didLike:  Binding.constant([]),
        didNotLike:  Binding.constant([])
    )
}
// I just clear the array here, no wonder it will be empty
// How do I bind corretly, so the data actually transfers??
