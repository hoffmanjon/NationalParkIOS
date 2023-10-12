//
//  ParkDetails.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/9/23.
//

import SwiftUI
import CachedAsyncImage

struct ParkDetails: View {
    
    @State var park: Park
    @State private var showingActivitiesPopover = false
    
    var body: some View {
        VStack {
            Text(park.fullName).font(.title)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(park.images, id: \.self) { image in
                        CachedAsyncImage(url: URL(string: image.url)) { phase in
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
                        Divider()
                    }
                    
                }
                .frame(height: 200)
            }
            Text(park.description)
                .font(.system(size: 14.0))
                .padding(10)
            HStack {
                Button("Activities") {
                    showingActivitiesPopover = true
                }
                .popover(isPresented: $showingActivitiesPopover) {
                    Text("Activities")
                        .font(.title2)
                        .bold()
                    List(park.activities) { activity in
                        if activitiesToDisplay.keys.contains(activity.id) {
                            HStack {
                                Text(activity.name)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                
            }
        }
    }
}

/*struct ParkDetails_Previews: PreviewProvider {
 static var previews: some View {
 ParkDetails()
 }
 } */

