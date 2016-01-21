//
//  DetailViewController.swift
//  College Profile
//
//  Created by mkelly2 on 1/21/16.
//  Copyright © 2016 mkelly2. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    
    var colleges: Colleges!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = colleges.name
        locationTextField.text = colleges.location
        numberOfStudentsTextField.text = String(colleges.numberOfStudents)
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        colleges.numberOfStudents = Int(numberOfStudentsTextField.text!)!
        colleges.name = nameTextField.text!
        colleges.location = locationTextField.text!
    }

}
