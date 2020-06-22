//
//  UserService.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/11/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

protocol IUserService {
    
    func loadUser(userId: String, completion: @escaping (Result<User, Error>) -> Void)
}

final class UserService: IUserService {
    
    // Dependencies
    private let requestManager: IRequestManager
    
    // MARK: - Initialization
    
    init(requesManager: IRequestManager) {
        self.requestManager = requestManager
    }
    
    // MARK: - IUserService

    func loadUser(userId: String, completion: @escaping (Result<User, Error>) -> Void) {
        let request = URLRequest(url: <#T##URL#>)
        let parser = UserParser()
        requestManager.execute(request, parser: parser, completion: completion)
    }
}
