//
//  TotalActivityView.swift
//  MonitorReport
//
//  Created by Pedro Somensi on 06/08/23.
//

import SwiftUI

struct TotalActivityView: View {
    
    var deviceActivity: DeviceActivity
    
    var body: some View {
        ActivitiesView(activities: deviceActivity)
    }
    
}
