//
//  UserParser.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/11/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

final class UserParser: IRequestParser {
    
    func parse(_ data: Data) -> User {

        let json = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
        let id = json["id"] as! String

        return User(id: id,
                    firstName: <#T##String#>,
                    secondName: <#T##String#>,
                    patronymic: <#T##String#>,
                    avatar: <#T##String#>,
                    phone: <#T##String#>,
//                    email: <#T##String#>,
                    accessToken: <#T##String#>,
                    authKey: <#T##String#>,
                    status: <#T##Int#>,
                    password_hash: <#T##String#>)
    }
}
