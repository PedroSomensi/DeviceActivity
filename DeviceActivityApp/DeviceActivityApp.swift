//
//  DeviceActivityAppApp.swift
//  DeviceActivityApp
//
//  Created by Pedro Somensi on 06/08/23.
//

import SwiftUI

@main
struct DeviceActivityApp: App {
    
    @State var showReports = false
    
    let requestAuthorization = RequestAuthorization()
    
    var body: some Scene {
        WindowGroup {
            
            VStack {
                if showReports {
                    ReportsView()
                } else {
                    Loading(text: "Consultando permissão...")
                }
            }.onAppear {
                
                Task {
                    showReports = await requestAuthorization.requestFamilyControls(for: .individual)
                    debugPrint("\(showReports)")
                }
                
            }
            
        }
    }
    
}
