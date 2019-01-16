//
//  Movie+CoreDataProperties.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var name: String?
    @NSManaged public var year: String?
    @NSManaged public var actors: NSOrderedSet?

}

// MARK: Generated accessors for actors
extension Movie {

    @objc(insertObject:inActorsAtIndex:)
    @NSManaged public func insertIntoActors(_ value: Actor, at idx: Int)

    @objc(removeObjectFromActorsAtIndex:)
    @NSManaged public func removeFromActors(at idx: Int)

    @objc(insertActors:atIndexes:)
    @NSManaged public func insertIntoActors(_ values: [Actor], at indexes: NSIndexSet)

    @objc(removeActorsAtIndexes:)
    @NSManaged public func removeFromActors(at indexes: NSIndexSet)

    @objc(replaceObjectInActorsAtIndex:withObject:)
    @NSManaged public func replaceActors(at idx: Int, with value: Actor)

    @objc(replaceActorsAtIndexes:withActors:)
    @NSManaged public func replaceActors(at indexes: NSIndexSet, with values: [Actor])

    @objc(addActorsObject:)
    @NSManaged public func addToActors(_ value: Actor)

    @objc(removeActorsObject:)
    @NSManaged public func removeFromActors(_ value: Actor)

    @objc(addActors:)
    @NSManaged public func addToActors(_ values: NSOrderedSet)

    @objc(removeActors:)
    @NSManaged public func removeFromActors(_ values: NSOrderedSet)

}
