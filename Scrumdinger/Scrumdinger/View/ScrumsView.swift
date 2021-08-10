//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 강수진 on 2021/08/08.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: Text(scrum.title)) {
                    CardView(scrum: scrum)
                        .listRowBackground(scrum.color)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrum")
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus")
        })
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
