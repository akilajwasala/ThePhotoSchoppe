//
//  MapViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapViewAndMarker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    fileprivate func setMapViewAndMarker() {
        let lat = 30.395414
        let lon = -97.753739
        
        //Set the marker and focus on it
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let artwork = Artwork(title: DummyTexts.AppName, subtitle: DummyTexts.LocationSubtitle, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
        mapView.addAnnotation(artwork)
        self.mapView.addAnnotation(artwork)
        self.mapView.setRegion(artwork.region, animated: true)
    }
}

extension MapViewController : MKMapViewDelegate {
    
    //Highlight and show description when click on a marker
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            annotation.animatesWhenAdded = true
            annotation.titleVisibility = .adaptive
            annotation.subtitleVisibility = .adaptive
            return annotation
        }
        return nil
    }
}

//Can use seperate class files
class Artwork: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
    
    var region : MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}
