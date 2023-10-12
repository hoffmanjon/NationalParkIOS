//
//  ContentView.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    
    //The parameter to use for the api call
    @State var parameter: USState
    @State var parks: [Park] = [Park]()
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack{
                    Text("State: ")
                    
                    Picker("",selection: $parameter) {
                        ForEach(USState.allCases, id: \.self) {
                            Text($0.rawValue).font(.title)
                        }
                    }
                    .pickerStyle(.menu)
                    .onReceive(
                        [self.parameter].publisher.first()) { (value) in
                            retrieveParks()
                        }
                }
                
                List(parks) { park in
                    HStack {
                        //     ParkRow(park: park)
                        NavigationLink(destination: ParkDetails(park: park)) {
                            
                            ParkRow(park: park)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
        }
    }
    
    //This function retrieves the list of parks, based on the api call and parameter for the call.
    private func retrieveParks() {
        print("here: " + parameter.rawValue)
        Task {
            if let parks = await getParks(key: ParksQueryItems.stateCode.rawValue, withValue:parameter.rawValue) {
                self.parks = parks.data
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(parameter: USState.florida)
    }
}
