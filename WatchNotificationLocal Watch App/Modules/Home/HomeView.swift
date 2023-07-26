//
//  HomeView.swift
//  WatchNotificationCenter Watch App
//
//  Created by Kevin Marin on 25/7/23.
//

import SwiftUI
import UserNotifications

struct HomeView: View {
        
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack
        {
            Text("Status: \(homeViewModel.status)")
            
            Group {
                Button( homeViewModel.isGranted ? "Permission granted" : "Request permission") {
                    homeViewModel.requestNotificationPermission()
                }
                .tint( homeViewModel.isGranted ? .cyan : .accentColor)
                
                Button("Schedule Notification") {
                    homeViewModel.scheduleNotification()
                }
                .tint(.accentColor)
            }
            .fontWeight(.regular)
            .font(.system(size: 15.0))
            .buttonStyle(.borderedProminent)
        }
        .onAppear {
            homeViewModel.getNotificationPermissionStatus()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
