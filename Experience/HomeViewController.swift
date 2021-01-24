//
//  HomeViewController.swift
//  Experience
//
//  Created by MM
//

import Foundation
import UIKit
import MapKit
import CoreLocation


class HomeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dateSetting: UIDatePicker!
    
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var budgetSlider: UISlider!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 18000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        
//      call annotations function and put in annotationsLocations
        createAnnotations(locations: annotationLocations2)
    }
    
//  Budget Slider
    @IBAction func sliderChange(_ sender: UISlider) {
        
        let sliderValue = (budgetSlider.value * 100).rounded()/100
        budgetLabel.text = String("$ \(sliderValue)")
    }
    
    
    //    Annotation locations default
    let annotationLocations = [
        ["title": "NY Botannical Garden", "latitude": 40.86334815996547,"longitude": -73.87971686577607],
        ["title": "Bronx Zoo", "latitude": 40.851459752719634,"longitude": -73.87728163045831],
        ["title": "Fort Tryon", "latitude": 40.862107184433995,"longitude": -73.93307959831552],
        ["title": "The Little Red Lighthouse", "latitude": 40.85064914711157,"longitude": -73.94695435107849],
        ["title": "CCNY", "latitude": 40.819414283004996,"longitude": -73.9498943586227]
    ]
    
    //    Annotation locations option 2
    let annotationLocations2 = [
        ["title": "Grand Central", "latitude": 40.75274547975853,"longitude": -73.97719814211887],
        ["title": "Bryant Park", "latitude": 40.75401341638318,"longitude": -73.983407201027],
        ["title": "Times Square", "latitude": 40.75598084817383,"longitude": -73.98638947346113],
        ["title": "Hudson Yards", "latitude": 40.75514921291823,"longitude": -74.00076935031002],
        ["title": "Chelsea Piers", "latitude": 40.74852856162892,"longitude": -74.00840129251715]
    ]
//    Create annotation
    func createAnnotations(locations: [[String: Any]]){
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            mapView.addAnnotation(annotations)
        }
    }
    
//    Check for authentication
    func setupLocationManager() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }

    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }


    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
}

//extension HomeViewController: CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true)
//    }
//
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAuthorization()
//    }
//}
