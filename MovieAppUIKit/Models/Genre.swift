//
//  Genre.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 27.02.2023.
//

import Foundation

struct Genre {
    
    var id: Int
    
    var genre: String {
        switch id {
        case 28:
            return "movie_genre_action".localized
        case 12:
             return "movie_genre_adventure".localized
        case 16:
            return "movie_genre_animation".localized
        case 35:
            return "movie_genre_comedy".localized
        case 80:
            return "movie_genre_crime".localized
        case 99:
            return "movie_genre_documentary".localized
        case 18:
            return "movie_genre_drama".localized
        case 10751:
            return "movie_genre_family".localized
        case 14:
            return "movie_genre_fantasy".localized
        case 36:
            return "movie_genre_history".localized
        case 27:
            return "movie_genre_horror".localized
        case 10402:
            return "movie_genre_music".localized
        case 878:
            return "movie_genre_science_fiction".localized
        case 10770:
            return "movie_genre_tv_movie".localized
        case 53:
            return "movie_genre_thriller".localized
        case 10752:
            return "movie_genre_war".localized
        case 37:
            return  "movie_genre_western".localized
        default:
            return ""
        }
    }
}
