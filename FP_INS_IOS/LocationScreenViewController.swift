//
//  LocationScreenViewController.swift
//  FP_INS_IOS
//
//  Created by Sabin Regmi on 18/05/2022.
//

import UIKit
import MapKit

class LocationScreenViewController: UIViewController, CLLocationManagerDelegate {
    var locationData: Location? = nil

    @IBOutlet weak var locationTitle: UILabel!
    
    @IBOutlet weak var locationDesc: UITextView!
    
    @IBOutlet weak var locationMapView: MKMapView!
    
    @IBOutlet weak var pageSliderCollectionView: UICollectionView!
    
    @IBOutlet weak var locationImagesPageController: UIPageControl!
    
    
    var location:Location?
    
    var timer:Timer?
    
    var currentCellIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageSliderCollectionView.dataSource = self
        pageSliderCollectionView.delegate = self
        
        locationTitle.text = location?.locationTitle
//        locationImage.image = UIImage(named: (location?.locationImages[0])!)
        locationDesc.text = location?.locationDescription
        
        displayLocation(latitude: location!.locationLat, longitude: location!.locationLong, title: location!.locationTitle, subtitle: "Here")
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNextImage), userInfo: nil, repeats: true)
        
        locationImagesPageController.numberOfPages = (location?.locationImages.count)!;
        
        
    }
    
        @objc func slideToNextImage(){
            if currentCellIndex < (location?.locationImages.count)!-1{
                currentCellIndex = currentCellIndex + 1;
            }else{
                currentCellIndex = 0;
            }
            
            locationImagesPageController.currentPage = currentCellIndex;
            
            pageSliderCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        }
    
    //MARK: - display user location method
        func displayLocation(latitude: CLLocationDegrees,
                             longitude: CLLocationDegrees,
                             title: String,
                             subtitle: String) {
            // 2nd step - define span
            let latDelta: CLLocationDegrees = 0.05
            let lngDelta: CLLocationDegrees = 0.05
            
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
            // 3rd step is to define the location
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            // 4th step is to define the region
            let region = MKCoordinateRegion(center: location, span: span)
            
            // 5th step is to set the region for the map
            locationMapView.setRegion(region, animated: true)
            
            // 6th step is to define annotation
            let annotation = MKPointAnnotation()
            annotation.title = title
            annotation.subtitle = subtitle
            annotation.coordinate = location
            locationMapView.addAnnotation(annotation)
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LocationScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (location?.locationImages.count)!;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "pageScrollCell", for: indexPath) as! PageSliderCollectionViewCell
        cell.locationImage.image = UIImage(named: (location?.locationImages[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageSliderCollectionView.frame.width, height: pageSliderCollectionView.frame.height)
    }
    
    
    
}
