//
//  ContentView.swift
//  AnimatedTimerSwiftUI
//
//  Created by Михаил Куприянов on 11.10.23..
//

import SwiftUI

struct ContentView: View {
    @State var isTimerRunning = false
    @State var startTime = Date()
    //The interval difference between total and remaining duration.
    @State var interval = TimeInterval()
    //The actual total duration.
    @State var totalDuration: TimeInterval = 2 * 60
    //The remaining duration.
    @State var duration: TimeInterval = 2 * 60
    //Timer progress.
    @State var progress = 1.0
    //Timer which publish update every one second.
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            if isTimerRunning {
                CircleTimerView(progress: $progress, duration: $duration)
            }
            Spacer()
            HStack {
                Button {
                    startTime = Date()
                    startTimer()
                } label: {
                    Text("Start")
                    Image(systemName: "stopwatch")
                }
                .timerButtonStyle(isValid: !isTimerRunning)
                Button {
                    stopTimer()
                } label: {
                    Text("Stop")
                    Image(systemName: "stop.circle")
                }
                .timerButtonStyle(isValid: isTimerRunning)
            }
        }
        .padding()
        .onReceive(timer) { time in
            if (isTimerRunning) {
                interval = Date().timeIntervalSince(startTime)
                duration = totalDuration - interval
                progress = (duration/totalDuration)
            }
        }
    }
    func startTimer() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        isTimerRunning.toggle()
    }
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        resetTimer()
        isTimerRunning.toggle()
    }
    // Call the following function after
    // self.timer.upstream.connect().cancel() in stopTimer() function.
    func resetTimer() {
        totalDuration = 120
        duration = 120
        progress = 1.0
    }
}
    
#Preview {
    ContentView()
}

extension View {
    func timerButtonStyle (isValid: Bool = true) -> some View {
        self
            .font(.title2)
            .padding()
            .background(Color.accentColor.opacity(isValid ? 1.0 : 0.2))
            .foregroundColor(.primary)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
