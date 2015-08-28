//
//  UsersModel.swift
//  Reception
//
//  Created by Hiroshi Kimura on 8/27/15.
//  Copyright © 2015 eureka. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreStore

final class UsersModel: BaseModel {
    
    func getUsers(completion: ((result: ModelResult<[User]>) -> Void)) {
        
        Dispatcher.getUser { (result) -> Void in
            switch result {
            case .Success(let json):
                
                JEDump(json)
                completion(result: .Success([]))
            case .Failure(let data, let errorType):
                
                completion(result: .Failure(.SomethingError))
            }
        }
    }
}