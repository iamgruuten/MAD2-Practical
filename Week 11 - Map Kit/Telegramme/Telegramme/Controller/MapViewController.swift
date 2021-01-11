//
//  MapViewController.swift
//  Telegramme
//
//  Created by Apple on 7/1/21.
//
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let regionRadius:CLLocationDistance = 250
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    
    let locationManager: CLLocationManager = {
        $0.requestWhenInUseAuthorization();
        $0.desiredAccuracy = kCLLocationAccuracyBest;
        $0.startUpdatingLocation();
        $0.startUpdatingHeading();
        return $0
        
    }(CLLocationManager())
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        var annotations = [MKAnnotation]()

        var annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: 1.333149, longitude:103.774893)
        annotation.coordinate = centerCoordinate
        annotation.title = "Ngee Ann Polytechnic"
        annotations.append(annotation)
        
        locationManager.delegate = locationDelegate;
        
        locationDelegate.locationCallback = {
            location in self.latestLocation = location
            let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
            
            let long = String(format: "Lat: %3.8f", location.coordinate.longitude)
            
            print("\(lat), \(long)")
            
        }
        
        
        let currentLocation = locationManager.location;
        let currentCoordinate = CLLocationCoordinate2D(latitude: currentLocation!.coordinate.latitude, longitude:currentLocation!.coordinate.longitude)
        
        annotation = MKPointAnnotation()

        annotation.coordinate = currentCoordinate
        annotation.title = "ME"
        annotations.append(annotation)
        
        mapView.addAnnotations(annotations)

        
    }
    
    func centerMapOnLocation(location:CLLocation){
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius
        )
        
        mapView.setRegion(coordinateRegion, animated: true);
    }
}
