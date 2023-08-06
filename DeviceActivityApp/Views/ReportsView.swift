//
//  ReportsView.swift
//  DeviceActivityApp
//
//  Created by Pedro Somensi on 06/08/23.
//

import SwiftUI

struct ReportsView: View {
    
    var body: some View {
        ZStack {
            Loading(text: "carregando...",
                    scale: 1)
            DeviceActivityReporterAdapter()
        }
    }
    
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        
        ReportsView()
    }
}
