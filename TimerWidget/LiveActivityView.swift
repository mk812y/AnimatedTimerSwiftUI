//
//  LiveActivityView.swift
//  TimerWidgetExtension
//
//  Created by Михаил Куприянов on 15.10.23..
//

import SwiftUI

struct LiveActivityView: View {
    let state: TimerAttributes.ContentState

    var body: some View {
        HStack {
            Button {
                //TODO: End the activity
            } label: {
                Label("Stop", systemImage: "stop.circle")
                    .font(.body.bold())
            }
            .foregroundColor(Color.white)
            .background(.primary)
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.vertical, 8)
            .transition(.identity)

            Spacer()

            HStack(alignment: .center, spacing: 16) {
                WidgetCircleTimerView(
                    progress: state.progress,
                    duration: state.duration
                )

                Text(state.duration)
                    .font(.largeTitle.monospacedDigit())
                    .minimumScaleFactor(0.8)
                    .contentTransition(.numericText())
            }
        }
        .id(state)
        .padding()
        .foregroundColor(Color.accentColor)
    }
}
