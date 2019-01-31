//
//  Work.swift
//  31 ObjC
//
//  Created by Johan Wigmo on 2019-01-31.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

@objc
class Work: NSObject {
    
    @objc let name: String

    @objc init(name: String) {
        self.name = name
        super.init()
    }
    
}
