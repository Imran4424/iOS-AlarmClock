//
//  AlarmModel.swift
//  AlarmClock
//
//  Created by Shah Md Imran Hossain on 19/4/25.
//

import Foundation

struct Alarm: Identifiable, Equatable {
    enum RepeatType {
        case once
        case daily
        case weekdays
    }
    
    let id = UUID()
    var time: Date
    var isEnabled: Bool
    var repeatType: RepeatType
    
    
    var repeatString: String {
        switch repeatType {
        case .once:
            return "Once"
        case .daily:
            return "Daily"
        case .weekdays:
            return "Mon-Fri"
        }
    }
}

final class AlarmModel: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    // just set is private(set) to prevent external modification
    // but get is public to allow external reading
    @Published private(set) var now: Date = Date()
}
