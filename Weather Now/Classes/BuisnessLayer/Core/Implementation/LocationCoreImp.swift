//
//  LocationCoreImp.swift
//  Weather Now
//
//  Created by Alexander Eskin on 24.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import CoreLocation
import Foundation

class LocationCoreImp: NSObject, LocationCore {
    var locationManager = CLLocationManager()
    var locationHandler: ((Result<CoordinatesModel, LocationCoreError>) -> Void)?
    
    override init() {
        super.init()
        config()
    }
    
    func getLocation(completion: @escaping (Result<CoordinatesModel, LocationCoreError>) -> Void) {
        locationHandler = completion
        stopMonitoring()
        startMonitoring()
    }
    
    private func config() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = true
    }
    
    private func startMonitoring() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.requestLocation()
    }
    
    private func stopMonitoring() {
        locationManager.stopMonitoringSignificantLocationChanges()
    }
}

extension LocationCoreImp: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let handler = locationHandler else {
            return
        }
        guard let location = locations.first else {
            handler(.failure(.notFound))
            return
        }
        
        let coordinates = CoordinatesModel(
            latitude: String(location.coordinate.latitude),
            longitude: String(location.coordinate.longitude)
        )
        
        handler(.success(coordinates))
        
        locationHandler = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            locationHandler?(.failure(.denied))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let handler = locationHandler {
            handler(.failure(.failed))
        }
    }
}
