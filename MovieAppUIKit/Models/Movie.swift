//
//  Movie.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 23.02.2023.
//

import Foundation

struct Movies {
    
    let movies: [Movie]
}

struct Movie {
    
    let image: URL?
    let title: String
    let description: String
    let rating: Float
    let genres: [Int]
}
