//
//  ContentView.swift
//  AlarmClock
//
//  Created by Shah Md Imran Hossain on 19/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Text("Alarm")
                    .tabItem {
                        Image(systemName: "alarm")
                        Text("Alarm")
                    }
                
                Text("Clock")
                    .tabItem {
                        Image(systemName: "clock")
                        Text("Clock")
                    }
                
                Text("Stop Watch")
                    .tabItem {
                        Image(systemName: "stopwatch")
                        Text("StopWatch")
                    }
                
                Text("Timer")
                    .tabItem {
                        Image(systemName: "timer")
                        Text("Timer")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
