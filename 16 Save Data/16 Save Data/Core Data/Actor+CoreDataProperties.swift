//
//  Actor+CoreDataProperties.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//
//

import Foundation
import CoreData


extension Actor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Actor> {
        return NSFetchRequest<Actor>(entityName: "Actor")
    }

    @NSManaged public var name: String?
    @NSManaged public var movie: Movie?

}
