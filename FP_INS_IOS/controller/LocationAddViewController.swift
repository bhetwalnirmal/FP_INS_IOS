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
    @IBOutlet weak var btnAddVideo: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    // values stored in images and videos
    var valImageArr: [UIImage] = []
    var valImageDataArr: [Data] = []
    var valVideoPath: String = ""
    @IBAction func btnAddImage(_ sender: Any) {
        showImagePicker()
    }
    @IBAction func btnAddVideo(_ sender: Any) {
       
        showVideoPicker()
    }
    override func viewDidLoad() {
        txtDescription.layer.borderWidth = 1.0
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
        self.lblSelectedVideo.text = "✅" + fileName + " was added"
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
                             self.valImageArr.append(image)
                         }
                     }
                }
             }
            
            if(!provider.canLoadObject(ofClass: UIImage.self)){
                self.btnAddVideo.setTitle("In Process...", for: .normal)
                self.btnAddVideo.isEnabled = false
                self.btnSave.isEnabled = false
                self.btnSave.isHidden = true
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
                
                            
                
                            let myVideoData = NSData(contentsOf: url)!
                            // create a new filename
                            let fileName = "\(Int(Date().timeIntervalSince1970)).\(url.pathExtension)"
                            
                            //Here we are writing the data to the Document Directory for use later on.
                            let docPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                            let documentsDirectory: AnyObject = docPaths[0] as AnyObject
                            let docDataPath = documentsDirectory.appendingPathComponent(fileName) as String
                           
                
                            try? myVideoData.write(to: URL(fileURLWithPath: docDataPath), options: [])
                
                            self.videoSavedURL = fileName
                            print("video added")
                            self.updateVideoUploadFile(fileName: self.videoSavedURL)
                            self.btnAddVideo.setTitle("Video Uploaded", for: .normal)
                            self.btnAddVideo.isEnabled = false
                            self.btnSave.isEnabled = true
                            self.btnSave.isHidden = false
                        }

        }
        
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        //extract data from fields
        let valLocationTitle: String = txtLocationName.text!
        let valLocationLat: Double = Double(txtCoOrdinate.text!.split(separator: ",")[0])!
        let valLocationLong: Double = Double(txtCoOrdinate.text!.split(separator: ",")[1])!
        let valLocationDescription: String = txtDescription.text!
        
        
        // TODO: Run Some validations here
        let locationObj: Location = Location(
            locationTitle: valLocationTitle, locationLat: valLocationLat, locationLong: valLocationLong, locationDescription: valLocationDescription, locationImages: self.valImageArr, locationVideo: self.videoSavedURL
        )
        
        coreDataController.addNewLocation(locationData: locationObj)
        performSegue(withIdentifier: "unwindToHomeFromAdd", sender: self)
          
        
    }
    @IBAction func btnNavHome(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHomeFromAdd", sender: self)
    }
}
