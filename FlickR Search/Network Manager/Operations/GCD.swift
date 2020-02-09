//
//  GCD.swift
//  FlickR Search
//
//  Created by Alex on 2/9/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation

class GCD {
    static func runAsync(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            completion()
        }
    }
    
    static func runOnMainThread(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
}
