//
//  LocationViewController.swift
//  FP_INS_IOS
//
//  Created by Ishara Abeykoon on 2022-05-19.
//

import Foundation
import UIKit
import MapKit

class LocationViewController: UIViewController {
 
    @IBOutlet weak var location_name: UILabel!
    @IBOutlet weak var location_image: UIImageView!
    @IBOutlet weak var subimage: UIImageView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pagecontroller: UIPageControl!
    
    @IBAction func pagecontroller(_ sender: Any) {
    }
    
    @IBOutlet var map: [MKMapView]!
    
}

