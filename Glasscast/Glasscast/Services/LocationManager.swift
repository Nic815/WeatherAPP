//
//  LocationManager.swift
//  Glasscast
//
//  Created by NIKHIL on 20/01/26.
//

import CoreLocation
import Foundation
internal import Combine

@MainActor
final class LocationManager: NSObject, ObservableObject {

    private let manager = CLLocationManager()

    @Published var location: CLLocation?
    @Published var cityName: String?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let loc = locations.first else { return }
        location = loc

        // Reverse geocode to get city name
        Task {
            let geocoder = CLGeocoder()
            if let placemark = try? await geocoder.reverseGeocodeLocation(loc).first {
                cityName = placemark.locality
            }
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Location error:", error.localizedDescription)
    }
}
