//
//  SwiftUIPdfApp.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 21/02/2021.
//

import SwiftUI

@main struct SwiftUIPdfApp: App {
    
    var body: some Scene {
        WindowGroup {
            MenuView()
            .environmentObject(ContentViewModel())
            //ContentView()
            
        }
      
    }
}
