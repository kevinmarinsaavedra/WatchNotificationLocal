//
//  NotificationController.swift
//  WatchNotificationCenter Watch App
//
//  Created by Kevin Marin on 26/7/23.
//

import WatchKit
import SwiftUI
import UserNotifications

final class NotificationController: WKUserNotificationHostingController<NotificationView> {

    var image: Image = Image(systemName: "pawprint.fill")
    var message: String = ""
    
    override class var isInteractive: Bool { false }
    override class var sashColor: Color? { Color.green }
    override class var titleColor: Color? { Color.purple }
    override class var subtitleColor: Color? { Color.orange }
    override class var wantsSashBlur: Bool { true }

    override var body: NotificationView {
        return NotificationView(message: message, image: image)
    }

    override func didReceive(_ notification: UNNotification) {
        let content = notification.request.content
        let num = content.userInfo["imageNumber"] as? Int ?? 1

        message = content.body
        image = Image("cat\(num)")
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
}
