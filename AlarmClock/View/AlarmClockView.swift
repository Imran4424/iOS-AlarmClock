//
//  AlarmClockView.swift
//  AlarmClock
//
//  Created by Shah Md Imran Hossain on 19/4/25.
//

import SwiftUI

struct AlarmView: View {
    @EnvironmentObject var alarmModel: AlarmModel
    @Binding var alarm: Alarm
    
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct AlarmClockView: View {
    @EnvironmentObject var alarmModel: AlarmModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(alarmModel.alarms) { alarm in
                    
                }
            }
        }
    }
}

#Preview {
    AlarmClockView()
}
