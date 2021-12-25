//
//  AnalyticsTracker.swift
//
//
//  Created by Shagun Madhikarmi on 25/12/2021.
//

import Foundation

public class AnalyticsTracker: AnalyticsTracking {
    private let transports: [AnalyticsTransporting]

    public init() {
        transports = [AnalyticsFirebaseTransport()]
    }

    public init(transports: [AnalyticsTransporting]) {
        self.transports = transports
    }

    public func trackScreenViewEvent(_ event: AnalyticsScreenViewEvent) {
        print(#function)
        for transport in transports {
            transport.trackScreenViewEvent(event)
        }
    }

    public func trackUserEvent(_ event: AnalyticsUserEvent) {
        print(#function)
        for transport in transports {
            transport.trackUserEvent(event)
        }
    }
}
