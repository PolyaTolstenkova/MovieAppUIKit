//
//  DetailsView.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 27.02.2023.
//

import UIKit

class DetailsView: UIViewController {
    
    let viewModel  = DetailsViewModel()
    
    init(image: URL?, movieTitle: String, movieDescription: String, rating: Float, genres: [Int]) {
        
        if let image = image {
            movieImage.load(url: image)
        }
        movieTitleLabel.text = movieTitle
        movieDescriptionLabel.text = movieDescription
        movieRating.text = "\(rating)"
        movieGenres.text = viewModel.getGenres(genres: genres)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder_error".localized)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }

    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieRating: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieGenres: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupViews() {
        view.addSubview(movieImage)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieDescriptionLabel)
        view.addSubview(movieRating)
        view.addSubview(movieGenres)
        
        movieImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        movieTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 310).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        movieTitleLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        movieTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        movieTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        
        movieDescriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        movieDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        movieDescriptionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        movieDescriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        movieRating.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        movieRating.heightAnchor.constraint(equalToConstant: 50).isActive = true
        movieRating.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        movieGenres.topAnchor.constraint(equalTo: view.topAnchor, constant: 550).isActive = true
        movieGenres.heightAnchor.constraint(equalToConstant: 50).isActive = true
        movieGenres.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    }
}
