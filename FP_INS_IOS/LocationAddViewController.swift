//
//  LocationAddViewController.swift
//  FP_INS_IOS
//
//  Created by Ishara Abeykoon on 2022-05-27.
//
import UIKit

class LocationAddViewController: UIViewController {
    
    // Coredata controller access
    var coreDataController = CoreDataController()
    let pickerController = UIImagePickerController()
    
    @IBOutlet weak var txtLocationName: UITextField!
    @IBOutlet weak var txtCoOrdinate: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBAction func btnAddImage(_ sender: Any) {
        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func btnAddVideo(_ sender: Any) {
    }
    @IBAction func btnSave(_ sender: Any) {
        //extract data from fields
        let locationObj: Location = Location(
            locationTitle: "Mt.Everest", locationLat: 27.9881, locationLong: 86.9250, locationDescription: "Mount Everest is Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation of 8,848.86 m was most recently established in 2020 by the Chinese and Nepali authorities.", locationImages: ["everest.jpg", "everest.jpg"], locationVideo: ""
        )
        
        coreDataController.addNewLocation(locationData: locationObj)
        
        performSegue(withIdentifier: "unwindToHomeFromAdd", sender: self)
          
        
    }
    @IBAction func btnNavHome(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHomeFromAdd", sender: self)
    }
}
