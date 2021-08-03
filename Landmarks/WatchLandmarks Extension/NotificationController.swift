//
//  NotificationController.swift
//  WatchLandmarks Extension
//
//  Created by 강수진 on 2021/08/03.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView>  {
    //These properties store values about an incoming notification.
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    //Use this key to extract the landmark index from the notification.
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        
        // After calling this method, the system invalidates the controller’s body property, which updates your navigation view. The system then displays the notification on Apple Watch.
        let modelData = ModelData()

        let notificationData =
            notification.request.content.userInfo as? [String: Any]

        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]

        title = alert?["title"] as? String
        message = alert?["body"] as? String

        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
