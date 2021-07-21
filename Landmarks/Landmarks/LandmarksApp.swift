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
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
