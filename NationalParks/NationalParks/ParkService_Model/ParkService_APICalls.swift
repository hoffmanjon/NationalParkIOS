//
//  ParkService_APICalls.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/4/23.
//

import Foundation

var activityDirectionary = [String:String]()

enum ParksQueryItems: String {
    case parkCode = "parkCode"
    case stateCode = "stateCode"
}

let activitiesToDisplay = ["7C37B79B-D02D-49EB-9020-3DB8299B748A": "Backcountry Hiking",
                       "C2801992-F34D-4974-A0F2-80FF04309EE4": "Saltwater Swimming",
                       "C5C5971C-E325-4CEB-8C81-EE49A881DF17": "RV Camping",
                       "299CB934-88DC-474F-A33D-E43E29A149C2": "Mountain Biking",
                       "8D778629-F603-4C50-A121-6F4BB2FE2C4B": "Road Biking",
                       "42FD78B9-2B90-4AA9-BC43-F10E9FEA8B5A": "Hands-On",
                       "13A57703-BB1A-41A2-94B8-53B692EB7238": "Astronomy",
                       "F353A9ED-4A08-456E-8DEC-E61974D0FEB6": "Kayaking",
                       "0B685688-3405-4E2A-ABBA-E3069492EC50": "Wildlife Watching",
                       "BFF8C027-7C8F-480B-A5F8-CD8CE490BFBA": "Hiking",
                       "7CE6E935-F839-4FEC-A63E-052B1DEF39D2": "Biking",
                       "3EBF7EAC-68FC-4754-B6A4-0C38A1583D45": "Snorkeling",
                       "B3EF12AF-D951-419E-BD3C-6B36CBCC1E16": "Stand Up Paddleboarding",
                       "A59947B7-3376-49B4-AD02-C0423E08C5F7": "Camping",
                       "587BB2D3-EC35-41B2-B3F7-A39E2B088AEE": "Swimming",
                       "D37A0003-8317-4F04-8FB0-4CF0A272E195": "Stargazing",
                       "25FB188F-5AAD-459A-9092-28A9801709FF": "Freshwater Fishing",
                       "09DF0950-D319-4557-A57E-04CD2F63FF42": "Arts and Culture",
                       "4A58AF13-E8FB-4530-B41A-97DF0B0C77B7": "Backcountry Camping",
                       "17411C8D-5769-4D0F-ABD1-52ED03840C18": "Saltwater Fishing",
                       "5A2C91D1-50EC-4B24-8BED-A2E11A1892DF": "Birdwatching",
                       "21DB3AFC-8AAC-4665-BC1F-7198C0685983": "Canoeing",
                       "4D224BCA-C127-408B-AC75-A51563C42411": "Paddling",
                       "5A241412-0CFB-497A-9B5F-0AB8C03CDE72": "Boat Tour",
                       "907E8125-15E4-483C-8EAD-B9FA1E85C6F8": "Canoe or Kayak Camping",
                       "45261C0A-00D8-4C27-A1F8-029F933A0D34": "Front-Country Hiking",
                       "A510F02B-8938-4679-A4F9-76580BCAE9C7": "Boat Tour",
                       "C6D3230A-2CEA-4AFE-BFF3-DC1E2C2C4BB4": "Picnicking",
                       "25559F45-F162-4B8B-BEC2-B341034A2AF4": "Hunting"
]

func getParks(key: String? = nil, withValue value: String? = nil) async -> Parks? {
    guard var urlBuilder = URLComponents(string: createAPIURL(api: .parks)) else {
        return nil
    }
    if let key = key, let value = value {
        urlBuilder.queryItems = [
            URLQueryItem(name: key, value: value)
        ]
    }
    
    guard let url = urlBuilder.url, let data = await callParkService(urlRequest: URLRequest(url: url)) else {
        return nil
    }

    do {
        let parks: Parks = try JSONDecoder().decode(Parks.self, from: data)
        for park in parks.data {
            for activitiy in park.activities {
                activityDirectionary[activitiy.id] = activitiy.name
            }
            print(park.fullName)
        }
        for (id,name) in activityDirectionary {
            print("\"\(id)\": \"\(name)\",")
        }
        return parks
    }
    catch {
        debugPrint("Error decoding \(url): \(String(describing: error))")
        return nil
    }
}

func callParkService(urlRequest: URLRequest) async -> Data? {
    var urlRequest = urlRequest
    urlRequest.setValue(apiKeyValue, forHTTPHeaderField: apiKey)
    let urlSession = URLSession.shared
    do {
        let (data, _) = try await urlSession.data(for:urlRequest)
        print("Received: " + String(data: data, encoding: .utf8)!)
        return data
    }
    catch {
        debugPrint("Error loading \(urlRequest): \(String(describing: error))")
        return nil
    }
}
