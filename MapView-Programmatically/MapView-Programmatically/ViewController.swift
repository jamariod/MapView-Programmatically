//
//  ViewController.swift
//  MapView-Programmatically
//
//  Created by Jamario Davis on 9/22/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        //mapView will be set as the view of MapViewController
        view = mapView
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        //The topConstraint of the segmented control will be 8 points below the top of the safe area layout guide.
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        /*
         The primary advantage of using the margins is that the margins can change depending on the device type (iPad or iPhone) as well as the size of the device. Using the margins will help your layout look good on any device.
         */
        let margins = view.layoutMarginsGuide
        //The leading anchor of the segmented control will be equal to the leading anchor of its superview.
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        //The trailing anchor of the segmented control will be equal to the trailing anchor of its superview.
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        //Activate constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    //The @objc annotation is needed to expose this method to the Objective-C runtime
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}


