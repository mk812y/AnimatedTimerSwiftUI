//
//  ContentView.swift
//  AnimatedTimerSwiftUI
//
//  Created by Михаил Куприянов on 11.10.23..
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            ButtonView()
        }
        .padding()
    }
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

#Preview {
    ContentView()
}

struct ButtonView: View {
    @State var isTimerRunning = false
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("Start")
                Image(systemName: "stopwatch")
            }
            .timerButtonStyle(isValid: !isTimerRunning)
            Button {
                
            } label: {
                Text("Stop")
                Image(systemName: "stop.circle")
            }
            .timerButtonStyle(isValid: isTimerRunning)
        }
    }
}
