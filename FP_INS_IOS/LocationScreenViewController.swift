//
//  LocationScreenViewController.swift
//  FP_INS_IOS
//
//  Created by Sabin Regmi on 18/05/2022.
//

import UIKit

class LocationScreenViewController: UIViewController {
    var locationData: Location? = nil

    @IBOutlet weak var locationTitle: UILabel!
    
    var location:Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("location is",location)
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
