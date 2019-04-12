//
//  SuperHero.swift
//  SuperHeros_Laureates
//
//  Created by Student on 4/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Superhero:Codable{
    var squadName : String
    var homeTown : String
    var formed : Int
    var secretBase : String
    var active : Bool
    var members : [Members]
}

class Members:Codable{
    var name:String
    var age:Int
    var secretIdentity:String
    var powers:[String]
}
