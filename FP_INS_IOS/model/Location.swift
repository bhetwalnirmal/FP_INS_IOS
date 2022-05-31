//
//  Location.swift
//  FP_INS_IOS
//
//  Created by Sabin Regmi on 18/05/2022.
//

import Foundation
import UIKit

// defining our location struct
struct Location {
    let locationTitle: String
    let locationLat: Double
    let locationLong: Double
    let locationDescription: String
    let locationImages: [UIImage]
    let locationVideo: String
    
    public func getTitle () -> String {
        return locationTitle
    }
}




