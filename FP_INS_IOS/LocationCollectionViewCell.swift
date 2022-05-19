//
//  LocationCollectionViewCell.swift
//  FP_INS_IOS
//
//  Created by Sabin Regmi on 18/05/2022.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationImageView: UIImageView!
    
    @IBOutlet weak var locationTitleLabel: UILabel!
    
    func setup(with location: Location) {
        locationImageView.image = UIImage(named: location.locationImages[0])
        locationTitleLabel.text = location.locationTitle
    }
}
