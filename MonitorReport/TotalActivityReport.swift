//
//  TotalActivityReport.swift
//  MonitorReport
//
//  Created by Pedro Somensi on 06/08/23.
//

import DeviceActivity
import SwiftUI

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("Atividades")
}

struct TotalActivityReport: DeviceActivityReportScene {
    
    // Define which context your scene will represent.
    let context: DeviceActivityReport.Context = .totalActivity
    
    // Define the custom configuration and the resulting view for this report.
    let content: (DeviceActivity) -> TotalActivityView
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> DeviceActivity {
        var res = ""
        var list: [AppReport] = []
        let totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })
        for await d in data {
            res += d.user.appleID!.debugDescription
            res += d.lastUpdatedDate.description
            for await a in d.activitySegments{
                res += a.totalActivityDuration.formatted()
                for await c in a.categories {
                    for await ap in c.applications {
                        let appName = (ap.application.localizedDisplayName ?? "nil")
                        let bundle = (ap.application.bundleIdentifier ?? "nil")
                        let duration = ap.totalActivityDuration
                        let app = AppReport(id: bundle, name: appName, duration: duration)
                        list.append(app)
                    }
                }
            }
        }
        
        return DeviceActivity(duration: totalActivityDuration, apps: list)
    }
    
}
