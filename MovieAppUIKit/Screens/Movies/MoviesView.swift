//
//  ViewController.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 23.02.2023.
//

import UIKit

class MoviesView: UIViewController {
    
    private var collectionView: UICollectionView?
    
    let manager = MovieManager()
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupViews()
    }
    
    private func setupViews() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(
            width: (view.frame.size.width / 3) - 10,
            height: 200
        )
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        
        let group = DispatchGroup()
        
        group.enter()
        manager.fetchMovies { movies, error in
            if let movies = movies {
                self.movies = movies.movies
            } else {
                let alert = UIAlertController(title: error?.localizedDescription, message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "alert_ok_button", style: .cancel))
                self.present(alert, animated: true)
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
}

// MARK: UICollectionView DataSource


extension MoviesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell

        let movie = movies[indexPath.row]
        cell?.setup(movie: movie)

        return cell ?? UICollectionViewCell()
    }
}

extension MoviesView: UICollectionViewDelegate {
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = movies[indexPath.row]
        let detailsView = DetailsView(
            image: movie.image,
            movieTitle: movie.title,
            movieDescription: movie.description,
            rating: movie.rating,
            genres: movie.genres
        )
        
        detailsView.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "back_button".localized,
            style: .plain,
            target: self,
            action: #selector(dismissSelf)
        )
        
        detailsView.title = "details_title".localized
        detailsView.modalPresentationStyle = .fullScreen
        let navigationController = UINavigationController(rootViewController: detailsView)
        
        present(navigationController, animated: true)
    }
}
