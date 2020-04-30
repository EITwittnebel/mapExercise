//
//  ViewController.swift
//  mapAssignment
//
//  Created by Field Employee on 4/27/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import LocalAuthentication

class MapViewController: UIViewController {
  @IBOutlet weak var mapView: MKMapView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    setupAnnos()
    setCamera()
  }
  
  func setupAnnos() {
    for item in locations {
      setupAnno(item)
    }
  }
  
  func setCamera() {
    mapView.camera.centerCoordinate = CLLocationCoordinate2D(latitude: 50, longitude: 5)
    mapView.camera.altitude = 6000000
  }
  
  func setupAnno(_ location: InterestingLocation) {
    let annotation = MKPointAnnotation()
    annotation.title = location.name
    annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordLat, longitude: location.coordLong)
    mapView.addAnnotation(annotation)
  }

}

extension MapViewController : MKMapViewDelegate {

  @objc func detailButtonPress(sender: UIButton) {
    let detail = storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
   
    let placeName = sender.title(for: .normal)!
    for item in locations {
      if item.name == placeName {
        detail.locationData = item
      }
    }
    present(detail, animated: true, completion: nil)
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "Placemark"
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
    
    if annotationView == nil {
      annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      annotationView?.canShowCallout = true
      let detailButton = UIButton(type: .detailDisclosure)
      detailButton.setTitle(annotation.title ?? "", for: .normal)
      detailButton.addTarget(self, action: #selector(detailButtonPress(sender:)), for: .touchDown)
      annotationView?.rightCalloutAccessoryView = detailButton
    } else {
      annotationView?.annotation = annotation
    }
    
    return annotationView
  }
  
}
