//
//  arrochaApp.swift
//  arrocha
//
//  Created by ifpb on 12/06/23.
//

import SwiftUI

@main
struct ArrochaApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(arrochaVM: ArrochaViewModel())
        }
    }
}
