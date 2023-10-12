//
//  main.swift
//  NPSTestAPI
//
//  Created by Jon Hoffman on 8/3/23.
//

import Foundation

print("Hello, World!")


if let url = URL(string: "https://developer.nps.gov/api/v1/alerts?parkCode=acad,dena") {
    var request = URLRequest(url: url)
    request.setValue("f7a56566-474c-4a05-ad8b-0f38a32cd8fc", forHTTPHeaderField: "X-Api-Key")
    let urlSession = URLSession.shared
print("1")
    urlSession.dataTask(with: request){ (data, response, error) in
            print("Here")
            print(response!)
            print(data!)
        }.resume()
            //  print(data)

} else {
    print("Error at URL creation")
}
