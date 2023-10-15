//
//  TimerWidgetLiveActivity.swift
//  TimerWidget
//
//  Created by Михаил Куприянов on 15.10.23..
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TimerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TimerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttributes.self) { context in
            LiveActivityView(state: context.state)
                .activitySystemActionForegroundColor(Color.primary)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    //TODO: 2. Expanded leading
                }
                DynamicIslandExpandedRegion(.center) {
                    //TODO: 2. Expanded center
                }
                DynamicIslandExpandedRegion(.trailing) {
                    //TODO: 2. Expanded trailing
                }
            } compactLeading: {
                //TODO: 3. Compact leading
            } compactTrailing: {
                //TODO: 4. Compact trailing
            } minimal: {
                //TODO: 5. Compact minimal
            }
        }
    }
}

extension TimerWidgetAttributes {
    fileprivate static var preview: TimerWidgetAttributes {
        TimerWidgetAttributes(name: "World")
    }
}

extension TimerWidgetAttributes.ContentState {
    fileprivate static var smiley: TimerWidgetAttributes.ContentState {
        TimerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TimerWidgetAttributes.ContentState {
         TimerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TimerWidgetAttributes.preview) {
   TimerWidgetLiveActivity()
} contentStates: {
    TimerWidgetAttributes.ContentState.smiley
    TimerWidgetAttributes.ContentState.starEyes
}
