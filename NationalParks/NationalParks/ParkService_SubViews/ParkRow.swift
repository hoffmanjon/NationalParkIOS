//
//  ParkRow.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/9/23.
//

import SwiftUI
import CachedAsyncImage

struct ParkRow: View {
    
    @State var park: Park
    
    var body: some View {
        //Creating a horizontal stack to layout the view
        HStack {

            if let strParkImageURL = park.images.first?.url {
                //loading in the image of park asynchronously
                CachedAsyncImage(url: URL(string: strParkImageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 60, height: 60)
                .padding(.trailing, 40)
                
            } else  {//If there is no photo load default image
                Image(systemName: "photo").padding()
            }
            //Display the name of the cocktail
            Text(park.fullName)
        }
    }
}

/*
struct ParkRow_Previews: PreviewProvider {
    static var previews: some View {
        ParkRow()
    }
}
*/
