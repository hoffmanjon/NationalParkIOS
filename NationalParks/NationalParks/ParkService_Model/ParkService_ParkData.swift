//
//  ParkService_ParkData.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/7/23.
//

import Foundation

/*
 The structures in the file are used to decode the data returned from the
 Parks call for the ParkService API
*/

struct Activity: Decodable, Hashable, Identifiable  {
    let id: String
    let name: String
}

struct Address: Decodable, Hashable  {
    let postalCode: String
    let city: String
    let stateCode: String
    let countryCode: String
    let provinceTerritoryCode: String
    let line1: String
    let type: String
    let line2: String
    let line3: String
}

struct PhoneNumber: Decodable, Hashable  {
    let phoneNumber: String
    let description: String
    let `extension`: String
    let type: String
}

struct EmailAddress: Decodable, Hashable  {
    let emailAddress: String
    let description: String
}

struct Contacts:Decodable, Hashable {
    let phoneNumbers: [PhoneNumber]
    let emailAddresses: [EmailAddress]
}

struct EntranceFee: Decodable, Hashable  {
    let cost: String
    let description: String
    let title: String
}

struct EntrancePass: Decodable, Hashable {
    let cost: String
    let description: String
    let title: String
}

struct ParkImage: Decodable, Hashable {
    let credit: String
    let altText: String
    let title: String
    let caption: String
    let url: String
}

struct Hours: Decodable, Hashable {
    let sunday: String?
    let monday: String?
    let tuesday: String?
    let wednesday: String?
    let thursday: String?
    let friday: String?
    let saturday: String?
}

struct Exception: Decodable, Hashable {
    let name: String
    let startDate: String
    let endDate: String
    let exceptionHours: Hours?
}

struct OperatingHours: Decodable, Hashable {
    let name: String
    let description: String
    let standardHours: Hours
    let exceptions: [Exception]?
}

struct Topic: Decodable, Hashable {
    let id: String
    let name: String
}

struct Park: Decodable, Identifiable, Hashable {
    let id: String
    let activities: [Activity]
    let addresses: [Address]
    let contacts: Contacts
    let description: String
    let designation: String
    let directionsInfo: String
    let directionsUrl: String
    let entranceFees: [EntranceFee]
    let entrancePasses: [EntrancePass]
    let fullName: String
    let images: [ParkImage]
    let latLong: String
    let latitude: String
    let longitude: String
    let name: String
    let operatingHours: [OperatingHours]
    let parkCode: String
    let states: String
    let topics: [Topic]
    let url: String
    let weatherInfo: String
}

struct Parks: Decodable, Hashable {
    let total: String
    let limit: String
    let start: String
    let data: [Park]
}
