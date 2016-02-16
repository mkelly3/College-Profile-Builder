//
//  DetailViewController.swift
//  College Profile
//
//  Created by mkelly2 on 1/21/16.
//  Copyright © 2016 mkelly2. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var colleges: Colleges!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        nameTextField.text = colleges.name
        locationTextField.text = colleges.location
        numberOfStudentsTextField.text = String(colleges.numberOfStudents)
        websiteTextField.text = colleges.website
        myImage.image = colleges.image
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImage.image = selectedImage
        }
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        colleges.numberOfStudents = Int(numberOfStudentsTextField.text!)!
        colleges.name = nameTextField.text!
        colleges.location = locationTextField.text!
        colleges.website = websiteTextField.text!
        colleges.image = myImage.image
    }

    @IBAction func goToWebsite(sender: AnyObject) {
        let url = NSURL(string: websiteTextField.text!)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onLibraryButtonTapped(sender: AnyObject)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func onMapButtonTapped(sender: AnyObject)
    {
        if locationTextField.text?.characters.count != 0 {
            colleges.location = locationTextField.text!
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
    }
}
