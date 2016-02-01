//
//  DetailViewController.swift
//  College Profile
//
//  Created by mkelly2 on 1/21/16.
//  Copyright © 2016 mkelly2. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var colleges: Colleges!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = colleges.name
        locationTextField.text = colleges.location
        numberOfStudentsTextField.text = String(colleges.numberOfStudents)
        myImage.image = colleges.image

        nameTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        numberOfStudentsTextField.resignFirstResponder()
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        colleges.numberOfStudents = Int(numberOfStudentsTextField.text!)!
        colleges.name = nameTextField.text!
        colleges.location = locationTextField.text!

    }

    @IBAction func goToWebsite(sender: AnyObject) {
        let url = NSURL(string: websiteTextField.text!)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
}
