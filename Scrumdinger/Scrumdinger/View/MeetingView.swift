//
//  ContentView.swift
//  Scrumdinger
//
//  Created by 강수진 on 2021/08/05.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                ProgressView(value: 5, total: 15)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Seconds Elapsed")
                        Label("300", systemImage: "hourglass.bottomhalf.fill")
                    }
                    .font(.caption)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Seconds Remaining")
                        Label("600", systemImage: "hourglass.tophalf.fill")
                    }
                    .font(.caption)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Time remaining"))
                .accessibilityValue(Text("10 minutes"))
                
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
            }
           
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
