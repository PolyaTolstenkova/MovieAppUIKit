//
//  DataManager.swift
//  MovieAppUIKit
//
//  Created by Полина Толстенкова on 23.02.2023.
//

import Foundation
import Alamofire

class DataManager<T: Decodable> {
    
    func fetchData(
        url: String,
        completion: @escaping (T?, Error?) -> Void
    ) {
        AF.request(url, parameters: nil, headers: nil)
        .validate(statusCode: 200 ..< 300)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
