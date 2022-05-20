//
//  LocationScreenViewController.swift
//  FP_INS_IOS
//
//  Created by Sabin Regmi on 18/05/2022.
//

import UIKit

class LocationScreenViewController: UIViewController {

    @IBOutlet weak var locationTitle: UILabel!
    
    var location:Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        locationTitle.text = locations[locationIndex!].locationTitle
//        print(location!.locationTitle)
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
