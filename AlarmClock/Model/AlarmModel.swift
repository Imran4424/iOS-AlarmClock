//
//  AlarmModel.swift
//  AlarmClock
//
//  Created by Shah Md Imran Hossain on 19/4/25.
//

import Combine
import Foundation
import UserNotifications

enum RepeatDay: Int {
    case sunday = 0
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    
    var fullName: String {
        switch self {
        case .sunday:
            return "Sunday"
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        }
    }
    
    var shortName: String {
        switch self {
        case .sunday:
            return "Sun"
        case .monday:
            return "Mon"
        case .tuesday:
            return "Tue"
        case .wednesday:
            return "Wed"
        case .thursday:
            return "Thu"
        case .friday:
            return "Fri"
        case .saturday:
            return "Sat"
        }
    }
}

struct Alarm: Identifiable, Equatable {
    enum RepeatType {
        case once
        case daily
        case weekdays
    }
    
    let id = UUID()
    var time: Date
    var label: String
    var isEnabled: Bool
    var isSnoozed: Bool
    var repeatType: RepeatType
    
    init(time: Date, label: String, isEnabled: Bool, isSnoozed: Bool, repeatType: RepeatType) {
        self.time = time
        self.label = label
        self.isEnabled = isEnabled
        self.isSnoozed = isSnoozed
        self.repeatType = repeatType
    }
    
    // formatting helpers
    var timeString: String {
        let df = DateFormatter(); df.dateFormat = "hh:mm"
        return df.string(from: time)
    }
    
    var amPmString: String {
        let df = DateFormatter(); df.dateFormat = "a"
        return df.string(from: time).lowercased()
    }
    
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
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        // set up a timer to update the current time every second
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.now = Date()
            }
            .store(in: &cancellables)
        
        // request notification permission
        requestNotificationPermission()
    }
    
    private func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification permission: \(error)")
            }
            
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
    }
}
