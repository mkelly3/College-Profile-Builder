//
//  Colleges.swift
//  College Profile
//
//  Created by mkelly2 on 1/20/16.
//  Copyright © 2016 mkelly2. All rights reserved.
//

import UIKit

class Colleges: NSObject {
    
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var website = ""

    convenience init(name: String, location: String, numberOfStudents: Int, website: String, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.image = image
        self.website = website
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }


}
