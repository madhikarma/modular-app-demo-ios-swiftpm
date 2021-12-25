//
//  AnalyticsEvent.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import Foundation

public protocol AnalyticsEvent {
    var name: AnalyticsEventName { get }
    var category: AnalyticsEventCategory { get }
    var properties: [String: Any]? { get }
}
