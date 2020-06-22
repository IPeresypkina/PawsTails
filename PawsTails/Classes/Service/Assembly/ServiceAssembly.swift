//
//  ServiceAssembly.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/11/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

final class ServiceAssembly {
    
    static let shared = ServiceAssembly()
    
    private let coreAssembly = CoreAssembly()
    
    func userService() -> IUserService {
        return UserService(requesManager: coreAssembly.requesManager())
    }

}
