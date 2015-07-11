//
//  Student.swift
//  StudentStatus
//
//  Created by Colin Moseley on 7/4/15.
//  Copyright © 2015 Colin Moseley. All rights reserved.
//

import UIKit

class Student: NSObject {
    
    var name:String = ""
    var status:Int = 0
    
    func initWithName(newName:String, newStatus:Int) {
        name = newName
        status = newStatus
    }
    
/*    func name() -> String {
        return _name
    }
    
    func status() -> Int {
        return _status
    }
*/
    func info() -> (name:String, status:Int) {
        return (name, status)
    }

}
