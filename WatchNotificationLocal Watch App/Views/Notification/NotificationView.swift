//
//  NotificationView.swift
//  WatchNotificationCenter Watch App
//
//  Created by Kevin Marin on 26/7/23.
//

import SwiftUI

struct NotificationView: View {
    let message: String
    let image: Image
    
    var body: some View {
        ScrollView {
            Text(message)
                .font(.subheadline)
            
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(10.0)
        }
    }
}
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(
            message: "Giggle Time!",
            image: Image("cat\(Int.random(in: 1...3))")
        )
    }
}
