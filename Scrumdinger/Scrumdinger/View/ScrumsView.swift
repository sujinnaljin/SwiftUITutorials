//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 강수진 on 2021/08/08.
//

import SwiftUI

struct ScrumsView: View {
    let scurms: [DailyScrum]
    var body: some View {
        List {
            ForEach(scurms, id: \.title) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scurms: DailyScrum.data)
    }
}
