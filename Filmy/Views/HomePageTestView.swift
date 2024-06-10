//
//  HomePageTestView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-09.
//

import SwiftUI

struct HomePageTestView: View {
   // @State private var movies = Array<MovieDetails>(repeating: DunePartTwo, count: 10)
    
    var body: some View {
        
        ZStack {
            ForEach(0..<moviesList.count, id:\.self) { index in
                MovieBox(movie: moviesList[index]) {
                    withAnimation {
                        removeMovie(at: index)
                    }
                }
            }
        }
    }
    
    func removeMovie(at index: Int) {
        moviesList.remove(at: index)
    }
}

#Preview {
    HomePageTestView()
}
