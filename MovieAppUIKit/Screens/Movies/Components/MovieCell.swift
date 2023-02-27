//
//  MovieCell.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 25.02.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static var identifier = "movie_cell_identifier".localized
    let moviesView = MoviesView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder_error".localized)
    }
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(movie: Movie) {
        if let url = movie.image {
            movieImage.load(url: url)
        }
        movieLabel.text = movie.title
     }
    
    func addViews() {
        addSubview(movieImage)
        addSubview(movieLabel)
        
        movieImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        movieLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        movieLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        movieLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
