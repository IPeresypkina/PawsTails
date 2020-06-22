//
//  APIUrlPart.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 4/4/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation

let mainPath:String = "http://127.0.0.1:50003"

let apiSignup = mainPath + "/api/user/signup"
let apiLoginup = mainPath + "/api/user/loginup"
let apiLogout = mainPath + "/api/user/logout"
let apiRequestPasswordReset = mainPath + "/api/user/request-password-reset"
let apiResetPassword = mainPath + "/api/user/reset-password?token="
let apiGetUser = mainPath + "/api/user/"
