//
//  NationalParksApp.swift
//  NationalParks
//
//  Created by Jon Hoffman on 8/3/23.
//

import SwiftUI

@main
struct NationalParksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(parameter: USState.florida)
        }
    }
}
