//
//  CoreDataController.swift
//  FP_INS_IOS
//
//  Created by Ishara Abeykoon on 2022-05-28.
//

import UIKit
import CoreData

class CoreDataController{
    var locations: [NSManagedObject] = []
    func addNewLocation(locationData: Location){
        guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
           return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
          let entity =
            NSEntityDescription.entity(forEntityName: "DataLocation",
                                       in: managedContext)!
          
          let location = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
          
         
        location.setValue(locationData.locationTitle, forKeyPath: "locationTitle")
        location.setValue(locationData.locationLat, forKeyPath: "locationLat")
        location.setValue(locationData.locationLong, forKeyPath: "locationLong")
        location.setValue(locationData.locationDescription, forKeyPath: "locationDescription")
        location.setValue(locationData.locationImages, forKeyPath: "locationImages")
        location.setValue(locationData.locationVideo, forKeyPath: "locationVideo")
          
         
          do {
            try managedContext.save()
            locations.append(location)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }
    
    func getAllLocations() -> [NSManagedObject]{
        var locations: [NSManagedObject] = [NSManagedObject]()
        
       
         guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
             return locations
         }
         
         let managedContext =
           appDelegate.persistentContainer.viewContext
         
         
         let fetchRequest =
           NSFetchRequest<NSManagedObject>(entityName: "DataLocation")
         
         
         do {
           locations = try managedContext.fetch(fetchRequest)
             print(locations)
         } catch let error as NSError {
           print("Could not fetch. \(error), \(error.userInfo)")
         }
        return locations
    }
}
