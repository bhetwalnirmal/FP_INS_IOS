//
//  LocationAddViewController.swift
//  FP_INS_IOS
//
//  Created by Ishara Abeykoon on 2022-05-27.
//
import UIKit
import PhotosUI
class LocationAddViewController: UIViewController, PHPickerViewControllerDelegate {
    
    // Coredata controller access
    var coreDataController = CoreDataController()
    let pickerController = UIImagePickerController()
    
    var videoSavedURL: String = ""
    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var txtLocationName: UITextField!
    @IBOutlet weak var txtCoOrdinate: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblSelectedVideo: UILabel!
    @IBAction func btnAddImage(_ sender: Any) {
        showImagePicker()
    }
    @IBAction func btnAddVideo(_ sender: Any) {
        showVideoPicker()
    }
    

    private func showVideoPicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .videos
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    private func showImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 3
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    private func updateVideoUploadFile(fileName: String){
        self.lblSelectedVideo.text = fileName + " was added"
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)
            guard !results.isEmpty else { return }
        let imageViews = [ self.img1,  self.img2,  self.img3]

        for (index,result) in results.enumerated() {
            let provider = result.itemProvider
            if provider.canLoadObject(ofClass: UIImage.self) {
                 provider.loadObject(ofClass: UIImage.self) { (image, error) in
                     DispatchQueue.main.async {
                         if let image = image as? UIImage {
                             imageViews[index]!.image = image
                         }
                     }
                }
             }
            provider.loadFileRepresentation(forTypeIdentifier: "public.movie") { url, error in
                            guard error == nil else{
                                print("error in video picker")
                                return
                            }
                            // receiving the video-local-URL / filepath
                            guard let url = url else {
                                print("error 2 in video picker")
                                return
                            }
                            // create a new filename
                            let fileName = "\(Int(Date().timeIntervalSince1970)).\(url.pathExtension)"
                            self.updateVideoUploadFile(fileName:fileName)
                            // create new URL
                            let newUrl = URL(fileURLWithPath: NSTemporaryDirectory() + fileName)
                            // copy item to APP Storage
                            self.videoSavedURL = newUrl.absoluteString
                            try? FileManager.default.copyItem(at: url, to: newUrl)
                            //self.parent.videoURL = newUrl.absoluteString
                        }
            
            
        }
        
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        //extract data from fields
        let valLocationTitle: String = txtLocationName.text!
        let valLocationLat: Double = Double(txtCoOrdinate.text!)!
        let valLocationLong: Double = Double(txtCoOrdinate.text!)!
        let valLocationDescription: String = txtDescription.text!
        
        
        // TODO: Run Some validations here
        let locationObj: Location = Location(
            locationTitle: valLocationTitle, locationLat: valLocationLat, locationLong: valLocationLong, locationDescription: valLocationDescription, locationImages: ["everest.jpg", "everest.jpg"], locationVideo: ""
        )
        
        coreDataController.addNewLocation(locationData: locationObj)
        performSegue(withIdentifier: "unwindToHomeFromAdd", sender: self)
          
        
    }
    @IBAction func btnNavHome(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHomeFromAdd", sender: self)
    }
}
