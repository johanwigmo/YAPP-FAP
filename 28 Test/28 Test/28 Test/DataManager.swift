//
//  DataManager.swift
//  28 Test
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import Foundation

class DataManager {
    
    private var data: [String] = []
    
    var dataCount: Int { return data.count }
    
    func add(text: String) {
        guard !data.contains(where: { $0.lowercased() == text.lowercased() }) else { return }
        data.append(text)
    }
    
    func text(for index: Int) -> String {
        return data[index]
    }
    
}
