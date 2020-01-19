//
//  UserInformation.swift
//  SignUp
//
//  Created by seungbong on 2020/01/18.
//  Copyright © 2020 한승희. All rights reserved.
//

import Foundation

class UserInformation{
    
    static let UserShared: UserInformation = UserInformation()
    
    var id: String = ""
    var password: String = ""
    var birthDay: String = ""
    var introduction: String = ""
    var phoneNumber: String = ""
    //var Profile: URL?
}
