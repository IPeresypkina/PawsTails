//
//  Pet.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 4/25/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

class Pet: NSObject {
    var id: Int?
    var userId: User
    var species: String
    var name: String
    var gender: String
    var breed: String
    var photoId: Int
    var specialSigns: String
    
    init(userId: User, species: String, name: String, gender: String, breed: String, photoId: Int, specialSigns: String) {
        self.userId = userId
        self.species = species
        self.name = name
        self.gender = gender
        self.breed = breed
        self.photoId = photoId
        self.specialSigns = specialSigns
    }
}
