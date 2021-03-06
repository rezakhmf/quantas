//
//  AirportModelExt.swift
//  Qantas
//
//  Created by Reza Farahani on 14/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation

extension Airport{
    
    init?(json:[String:Any]) throws {
        guard let code = json["code"] as? String else {
            throw SerializationAirportError.missing("code")
        }
        guard let displayName = json["display_name"] as? String else {
            throw SerializationAirportError.missing("display_name")
        }
        guard let internationalAirport = json["international_airport"] as? Bool else {
            throw SerializationAirportError.missing("international_airport")
        }
        guard let regionalAirport = json["regional_airport"] as? Bool else {
            throw SerializationAirportError.missing("regional_airport")
        }
        guard let locationJson = json["location"] as? [String:Double] ,
            let latitude = locationJson["latitude"],
            let longitude = locationJson["latitude"] else {
                throw SerializationAirportError.missing("location")
        }
        //check not random geolocation
        let location = (latitude, longitude)
        guard case(-90...90, -180...180) = location else {
            throw SerializationAirportError.invalid("location", location)
        }
        guard let currencyCode = json["currency_code"] as? String else {
            throw SerializationAirportError.missing("currency_code")
        }
        guard let timeZone = json["timezone"] as? String else {
            throw SerializationAirportError.missing("timezone")
        }
        guard let country = json["country"] as? [String:String],
            let countryCode = country["countryCode"],
            let countryName = country["countryName"]
            else {
                throw SerializationAirportError.missing("country")
        }
        
        // Initialize airport properties
        self.code = code
        self.displayName = displayName
        self.internationalAirport = internationalAirport
        self.regionalAirport = regionalAirport
        self.location = (latitude, longitude)
        self.currencyCode = currencyCode
        self.timeZone = timeZone
        self.country = (countryCode, countryName)
    }
}
