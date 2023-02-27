//
//  MovieDTO.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 23.02.2023.
//

import Foundation

struct MovieDTO: Decodable {
    let results: [Results]
}

struct Results: Decodable, Identifiable {
    
    let id: Int
    let image: String
    let title: String
    let description: String
    let rating: Float
    let genres: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case image = "backdrop_path"
        case title
        case description = "overview"
        case rating = "vote_average"
        case genres = "genre_ids"
    }
}

extension MovieDTO: DomainModelConvertible {
    func toDomainModel() -> Movies? {
        
        let movieDomainModel: [Movie] = results.compactMap({
            return $0.toDomainModel()
        })
        
        return Movies(movies: movieDomainModel)
    }
}

extension Results: DomainModelConvertible {
    func toDomainModel() -> Movie {
        
        return Movie(
            image: URL(string: "https://image.tmdb.org/t/p/w500\(image)"),
            title: title,
            description: description,
            rating: rating,
            genres: genres
        )
    }
}
