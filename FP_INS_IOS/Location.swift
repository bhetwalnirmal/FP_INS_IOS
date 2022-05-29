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
    let locationImages: [String]
    
    // todo: We might need to change the datatype of video once we see how we gonna store and handle video file
    let locationVideo: String
    
    public func getTitle () -> String {
        return locationTitle
    }
}

// todo: We need to add few locations



