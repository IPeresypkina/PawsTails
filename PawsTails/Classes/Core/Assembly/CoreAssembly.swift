//
//  CoreAssembly.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/11/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

final class CoreAssembly {
    
    func requesManager() -> IRequestManager {
        return RequestManager(session: .shared)
    }
}
