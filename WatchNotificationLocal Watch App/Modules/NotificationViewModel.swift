//
//  HomeViewModel.swift
//  WatchNotificationCenter Watch App
//
//  Created by Kevin Marin on 26/7/23.
//

import Combine
import SwiftUI
import UserNotifications

final class NotificationViewModel: ObservableObject {

    @Published var status = ""
    @Published var isGranted = false
    
    func getNotificationPermissionStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] (settings) in
            switch settings.authorizationStatus {
            case .authorized:
                self?.status = "Authorized"
                self?.isGranted = true
            case .denied:
                self?.status = "Denied"
                self?.isGranted = false
                
            case .notDetermined:
                self?.status = "Not determined"
                self?.isGranted = false
                
            case .provisional:
                self?.status = "Provisional"
                self?.isGranted = true
                
            @unknown default:
                self?.status = "Unknown"
                self?.isGranted = false
            }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { [weak self] (success, error) in
            if success {
                withAnimation(.linear(duration: 1)) {
                    self?.isGranted = true
                }
            } else if let _ = error {
                self?.isGranted = false
            }
            self?.getNotificationPermissionStatus()
        }
    }
    
    
    func scheduleNotification() {
        let timeInterval: Double = 3

        let content = UNMutableNotificationContent()
        content.title = "Drink some water!"
        content.subtitle = "you have \(timeInterval) sec"
        content.sound = .default
        content.categoryIdentifier = "myCategory"
       
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "water", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("scheduled successfully")
            }
        }
    }
}
