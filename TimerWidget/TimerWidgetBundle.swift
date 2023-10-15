//
//  TimerWidgetBundle.swift
//  TimerWidget
//
//  Created by Михаил Куприянов on 15.10.23..
//

import WidgetKit
import SwiftUI

@main
struct TimerWidgetBundle: WidgetBundle {
    var body: some Widget {
        TimerWidget()
        TimerWidgetLiveActivity()
    }
}
