//
//  Music_App_StreamingApp.swift
//  Music App Streaming
//
//  Created by Omar Leal on 11/1/22.
//

import SwiftUI
import FirebaseCore

@main
struct Music_App_StreamingApp: App {
    let dataCopy = DataManager()
    init() {
        FirebaseApp.configure()
        dataCopy.loadAlbums()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: dataCopy)
        }
    }
}
