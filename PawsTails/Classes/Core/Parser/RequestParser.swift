//
//  RequestParser.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/11/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

protocol IRequestParser {
    associatedtype Model
    
    func parse(_ data: Data) -> Model
}
