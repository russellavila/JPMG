//
//  NetworkManager.swift
//  20220610-RussellAvila-NYCSchools
//
//  Created by Consultant on 6/9/22.
//

import Foundation

protocol DataFetcher {
    func fetchModel<T: Decodable>(url: URL?, completion: @escaping (Result<T, Error>) -> Void)
    func fetchData(url: URL?, completion: @escaping (Result<Data, Error>) -> Void)
}

//NetworkManager takes a url and do the fetching from the json.
class NetworkManager {
    
    let session: Session
    
    init(session: Session = URLSession.shared) {
        self.session = session
    }
    
}

extension NetworkManager: DataFetcher {
    
    //Generic Model
    func fetchModel<T: Decodable>(url: URL?, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        self.session.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(NetworkError.decodeError(error.localizedDescription)))
            }
            
        }

    }
    
    //Data explicit
    func fetchData(url: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        self.session.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
            completion(.success(data))
            
        }
        
    }
    
}
