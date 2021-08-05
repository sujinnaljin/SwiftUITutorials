//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 강수진 on 2021/07/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    //@StateObject 를 사용하여 지정된 속성에 대한 모델 object를 앱 life cycle 동안 한 번만 초기화. 이는 앱 인스턴스에서 속성을 사용하는 경우뿐만 아니라 뷰에서도 사용할 경우 해당
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        let mainWindow = WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if os(macOS)
        mainWindow
            .commands {
                LandmarkCommands()
            }
        #else
        mainWindow
        #endif
        
        #if os(watchOS)
        //지정된 category의 remote 또는 local 알림을 수신하는 경우에 나타나는 scene. 그래서 payload 에서 알림 쏠 때 category 명 맞춰서 쏨
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
