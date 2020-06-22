//
//  RequestManager.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/11/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

protocol IRequestManager: AnyObject {
    
    func execute<Parser: IRequestParser>(_ request: URLRequest, parser: Parser, completion: @escaping (Result<Parser.Model, Error>) -> Void)
}

final class RequestManager: IRequestManager {
    
    // Dependencies
    private let session: URLSession
    
    // MARK: - Initialization
    
    init(session: URLSession) {
        self.session = session
    }
    
    func execute<Parser: IRequestParser>(_ request: URLRequest, parser: Parser, completion: @escaping (Result<Parser.Model, Error>) -> Void) {
        let dataTask = session.dataTask(with: request) { data, _, error in
            
            if let data = data, let model = parser.parse(data) {
                completion(.success(model))
            } else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "sdfsdf", code: 0, userInfo: nil)))
                }
            }
        }
        
        dataTask.resume()
    }
}
