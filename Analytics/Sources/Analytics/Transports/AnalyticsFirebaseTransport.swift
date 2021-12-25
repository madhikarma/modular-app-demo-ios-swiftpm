//
//  AnalyticsFirebaseTransport.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import FirebaseAnalytics
import Foundation

public class AnalyticsFirebaseTransport: AnalyticsTransporting {
    public required init() {}

    // MARK: - Track

    public func trackUserEvent(_ event: AnalyticsUserEvent) {
        print(#function)
        let name = formattedUserEventName(event: event)
        FirebaseAnalytics.Analytics.logEvent(name, parameters: event.properties)
    }

    public func trackScreenViewEvent(_ event: AnalyticsScreenViewEvent) {
        print(#function)
        let name = formattedScreenViewEventName(event: event)
        FirebaseAnalytics.Analytics.logEvent(name, parameters: event.properties)
    }

    // MARK: - Formatting

    private func formattedUserEventName(event: AnalyticsEvent) -> String {
        "\(event.name) \(event.category)"
    }

    private func formattedScreenViewEventName(event: AnalyticsEvent) -> String {
        "\(event.name) \(event.category)"
    }
}
