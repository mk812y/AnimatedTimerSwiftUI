//
//  TimerAttributes.swift
//  AnimatedTimerSwiftUI
//
//  Created by Михаил Куприянов on 15.10.23..
//

import ActivityKit

struct TimerAttributes: ActivityAttributes {
    public typealias TimeTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var duration: String
        var progress: Double
    }
    
    var name: String
}
