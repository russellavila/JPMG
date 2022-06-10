//
//  Session.swift
//  20220610-RussellAvila-NYCSchools
//
//  Created by Consultant on 6/9/22.
//

import Foundation

protocol Session {
    func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Session {
    
    func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
        
    }
    
}
