//
//  ParkService_API.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/3/23.
//

import Foundation

/*
 This dile contains constants, functions and enumerations that are used to
 build the URL and the header values for the Park Service API
 The webservice API document can be found here:  https://www.nps.gov/subjects/developer/api-documentation.htm#/
 
 */


//Constants
let baseURL = "https://developer.nps.gov/api/v1/"
let apiKeyValue = "bCEu7mxMH8ZQf65LEbtGMuzyg6ibiIj1iUMexfLF"
let apiKey = "X-Api-Key"

//Create the API URL
func createAPIURL(api: ParkServiceApi) -> String {
    return baseURL + api.rawValue
}

//All API Services
enum ParkServiceApi: String {
    case activities = "activities"
    case activitiesPark = "activities/parks"
    case alerts = "alerts"
    case amenities = "amenities"
    case amenitiesParksPlace = "amenities/parksplaces"
    case amenitiesParksisitorCenters = "amenities/parksvisitorcenters"
    case articles = "articles"
    case campgrounds = "campgrounds"
    case events = "events"
    case feesPasses = "feespasses"
    case lessonPlans = "lessonplans"
    case mapdataBoundaries = "mapdata/parkboundaries/"
    case multimediaAudio = "multimedia/audio"
    case multimediaGalleries = "multimedia/galleries"
    case multimediaGalleriesAssets = "multimedia/galleries/assets"
    case multimediaVideo = "multimedia/videos"
    case newsReleases = "newsreleases"
    case parkingLots = "parkinglots"
    case parks = "parks"
    case passportStampLocations = "pasportstamplocations"
    case people = "people"
    case places = "places"
    case roadEvents = "roadevents"
    case thingsToDo = "thingstodo"
    case topics = "topics"
    case topicsParks = "topics/parks"
    case tours = "tours"
    case visitorCenters = "visitorcenters"
    case webcams = "webcams"
}

//Used when we need to provice a state abbreviation.
enum USState: String, CaseIterable {
    case alabama = "AL"
    case alaska = "AK"
    case arizona = "AZ"
    case arkansas = "AR"
    case california = "CA"
    case colorado = "CO"
    case connecticut = "CT"
    case delaware = "DE"
    case florida = "FL"
    case georgia = "GA"
    case hawaii = "HI"
    case idaho = "ID"
    case illinois = "IL"
    case indiana = "IN"
    case iowa = "IA"
    case kansas = "KS"
    case kentucky = "KY"
    case louisiana = "LA"
    case maine = "ME"
    case maryland = "MD"
    case massachusetts = "MA"
    case michigan = "MI"
    case minnesota = "MN"
    case mississippi = "MS"
    case missouri = "MO"
    case montana = "MT"
    case nebraska = "NE"
    case nevada = "NV"
    case newHampshire = "NH"
    case newJersey = "NJ"
    case newMexico = "NM"
    case newYork = "NY"
    case northCarolina = "NC"
    case northDakota = "ND"
    case ohio = "OH"
    case oklahoma = "OK"
    case oregon = "OR"
    case pennsylvania = "PA"
    case rhodeIsland = "RI"
    case southCarolina = "SC"
    case southDakota = "SD"
    case tennessee = "TN"
    case texas = "TX"
    case utah = "UT"
    case vermont = "VT"
    case virginia = "VI"
    case washington = "WA"
    case westVirginia = "WV"
    case wisconsin = "WI"
    case wyoming = "WY"
}
