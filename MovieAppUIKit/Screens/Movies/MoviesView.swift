//
//  ViewController.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 23.02.2023.
//

import UIKit

class MoviesView: UIViewController {
    
    private var collectionView: UICollectionView?
    
    let viewModel = MoviesViewModel()

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
        
        viewModel.getMovies(view: collectionView)
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        if let error = viewModel.error {
            let alert = UIAlertController(title: error.localizedDescription, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "alert_ok_button", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}

// MARK: UICollectionView DataSource


extension MoviesView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell

        let movie = viewModel.movies[indexPath.row]
        cell?.setup(movie: movie)

        return cell ?? UICollectionViewCell()
    }
}

// MARK: UICollectionView Delegate

extension MoviesView: UICollectionViewDelegate {
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = viewModel.movies[indexPath.row]
        lazy var detailsView = DetailsView(
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
