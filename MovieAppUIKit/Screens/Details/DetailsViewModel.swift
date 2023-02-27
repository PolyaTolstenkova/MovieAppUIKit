//
//  DetailsViewModel.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 27.02.2023.
//

import Foundation

class DetailsViewModel {
    
    func getGenres(genres: [Int]) -> String {
        var genresString: String = ""
        for id in genres {
            let genreModel = Genre(id: id)
            
            if genres.firstIndex(of: id) == genres.count - 1 {
                genresString += genreModel.genre
            } else {
                genresString += "\(genreModel.genre), "
            }
        }
        return genresString
    }
}
