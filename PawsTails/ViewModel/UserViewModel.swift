//
//  UserViewModel.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/7/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit.UIImage

class UserViewModel {
  
    private let user: User
  
    init(user: User) {
        self.user = user
    }
  
    var authKey: String {
        return user.authKey
    }
    
    var fio: String {
        return "\(user.secondName) \(user.firstName) \(user.patronymic)"
    }
    
    var email: String {
        return user.email
    }
    
    var phone: String {
        return user.phone
    }
  
}
