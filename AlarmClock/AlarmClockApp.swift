//
//  AlarmClockApp.swift
//  AlarmClock
//
//  Created by Shah Md Imran Hossain on 19/4/25.
//

import SwiftUI

@main
struct AlarmClockApp: App {
    // MARK: - Since, we are doing background fetching. Initializing here
    @StateObject var alarmModel = AlarmModel()
    
    // MARK: - Scene Phase
    @Environment(\.scenePhase) var scenePhase
    
    // MARK: - storing last time stamp
    @State var lastActiveTimeStamp: Date = Date()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(alarmModel)
        }
        .onChange(of: scenePhase) { oldValue, newValue in
            if newValue == .background {
                lastActiveTimeStamp = Date()
            } else if newValue == .active {
                let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
            }
        }
    }
}
