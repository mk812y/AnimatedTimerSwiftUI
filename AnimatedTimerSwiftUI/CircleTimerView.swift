//
//  CircleTimerView.swift
//  AnimatedTimerSwiftUI
//
//  Created by Михаил Куприянов on 11.10.23..
//

import SwiftUI

struct CircleTimerView: View {
    @Binding var progress: Double
    @Binding var duration: TimeInterval
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.08)
                .foregroundColor(.primary)
                .frame(width: 200, height: 200)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 15,
                                           lineCap: .round,
                                           lineJoin: .round))
                .rotationEffect(.degrees(270.0))
                .foregroundColor(.accentColor)
                .frame(width: 200, height: 200)
            Text(duration.format(using: [.minute, .second]))
//            Text("12310")
                .font(.title2)
                .bold()
                .foregroundColor(.secondary)
                .contentTransition(.numericText())
        }
    }
}

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}

#Preview {
    CircleTimerView(progress: .constant(0.4), duration: .constant(100))
}
