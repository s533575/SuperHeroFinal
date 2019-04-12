//
//  Laureates.swift
//  SuperHeros_Laureates
//
//  Created by Student on 4/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Laureate : Codable{
    var id:String?
    var firstname:String?
    var surname:String?
    var born:String?
    var died:String?
    var bornCountry:String?
    var bornCountryCode:String?
    var bornCity:String?
    var diedCountry:String?
    var diedCountryCode:String?
    var diedCity:String?
    var gender:String?
    var prizes:[Prizes]?
    
    init(id:String?,firstname:String?,surname:String?,born:String?,died:String?)
    {
        self.firstname = firstname
        self.surname = surname
        self.born = born
        self.died = died
        self.id = id
        self.bornCountry = ""
        self.bornCountryCode=""
        self.bornCity = ""
        self.diedCountry = ""
        self.diedCountryCode = ""
        self.diedCity = ""
        self.gender = ""
        self.prizes = []
    }
}
class Prizes:Codable{
    var year:String
    var category:String
    var share:String
    var motivation:String
    var affiliations:[Affiliation]
}

class Affiliation:Codable{
    var name:String
    var city:String
    var Country:String
}
