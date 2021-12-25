//
//  AnalyticsTracking.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import Foundation

public protocol AnalyticsTracking {
    func trackScreenViewEvent(_ event: AnalyticsScreenViewEvent)
    func trackUserEvent(_ event: AnalyticsUserEvent)
}
