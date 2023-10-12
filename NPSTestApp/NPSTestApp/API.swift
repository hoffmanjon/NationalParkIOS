//
//  API.swift
//  NPSTestApp
//
//  Created by Jon Hoffman on 8/3/23.
//

import Foundation

func testAPI() {
    
   // var urlBuilder = URLComponents(string: "https://developer.nps.gov/api/v1/alerts")
    var urlBuilder = URLComponents(string: "https://developer.nps.gov/api/v1/parks")
    urlBuilder?.queryItems = [
         //  URLQueryItem(name: "parkCode", value: "acad,dena")
        URLQueryItem(name: "stateCode", value: "FL")
       ]

       if let url = urlBuilder?.url  {
    
  //  if let url = URL(string: "https://developer.nps.gov/api/v1/alerts?parkCode=acad,dena") {
        var request = URLRequest(url: url)
        request.setValue("bCEu7mxMH8ZQf65LEbtGMuzyg6ibiIj1iUMexfLF", forHTTPHeaderField: "X-Api-Key")
        let urlSession = URLSession.shared
    print("1")
        urlSession.dataTask(with: request){ (data, response, error) in
                print("Here")
                print(response!)
                print("Data:")
            print(String(data: data!, encoding: .utf8))
            }.resume()
                //  print(data)

    } else {
        print("Error at URL creation")
    }
}
