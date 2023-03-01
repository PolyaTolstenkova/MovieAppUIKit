//
//  MoviesViewModel.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 01.03.2023.
//

import Foundation
import UIKit

class MoviesViewModel {
    
    var movies: [Movie] = []
    var error: Error?
    
    private let movieManager = MovieManager()
    
    func getMovies(view: UICollectionView) {
        movieManager.fetchMovies { movies, error in
            if let movies = movies {
                self.movies = movies.movies
            } else {
                self.error = error
            }
            view.reloadData()
        }
    }
}
