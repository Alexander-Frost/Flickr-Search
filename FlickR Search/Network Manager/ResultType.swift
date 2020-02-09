//
//  ResultType.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation

enum Result <T>{
    case Success(T)
    case Failure(String)
    case Error(String)
}
