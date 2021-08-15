//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 강수진 on 2021/08/05.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
