//
//  AnalyticsUserEvent.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import Foundation

public struct AnalyticsUserEvent: AnalyticsEvent {
    public let name: AnalyticsEventName
    public let category: AnalyticsEventCategory
    public let properties: [String: Any]?

    public init(name: AnalyticsEventName, category: AnalyticsEventCategory, properties: [String: Any]?) {
        self.name = name
        self.category = category
        self.properties = properties
    }
}
