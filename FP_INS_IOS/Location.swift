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
let locations: [Location] = [
    Location(locationTitle: "Mt.Everest", locationLat: 27.9881, locationLong: 86.9250, locationDescription: "Mount Everest is Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation of 8,848.86 m was most recently established in 2020 by the Chinese and Nepali authorities.", locationImages: ["everest.jpg", "everest.jpg"], locationVideo: ""),
    Location(locationTitle: "Annapurna", locationLat: 27.9881, locationLong: 86.9250, locationDescription: "Mount Everest is Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation of 8,848.86 m was most recently established in 2020 by the Chinese and Nepali authorities.", locationImages: ["everest.jpg"], locationVideo: ""),
    Location(locationTitle: "Makalu", locationLat: 27.9881, locationLong: 86.9250, locationDescription: "Mount Everest is Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation of 8,848.86 m was most recently established in 2020 by the Chinese and Nepali authorities.", locationImages: ["everest.jpg"], locationVideo: ""),
    Location(locationTitle: "Mount Lotse", locationLat: 27.9881, locationLong: 86.9250, locationDescription: "Mount Everest is Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation of 8,848.86 m was most recently established in 2020 by the Chinese and Nepali authorities.", locationImages: ["everest.jpg"], locationVideo: ""),
    Location(locationTitle: "Mount Machhapuchhre", locationLat: 27.9881, locationLong: 86.9250, locationDescription: "Mount Everest is Earth's highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point. Its elevation of 8,848.86 m was most recently established in 2020 by the Chinese and Nepali authorities.", locationImages: ["everest.jpg"], locationVideo: "")    
]


