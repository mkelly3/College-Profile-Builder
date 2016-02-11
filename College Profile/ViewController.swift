//
//  ViewController.swift
//  College Profile
//
//  Created by mkelly2 on 1/20/16.
//  Copyright © 2016 mkelly2. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var college : [Colleges] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        college.append(Colleges(name: "Michigan State", location: "Michigan", numberOfStudents: 30000, Website: "https://msu.edu", image: UIImage(named: "MichiganState")!))
        college.append(Colleges(name: "University Of Ottawa", location: "Ottawa, Canada", numberOfStudents: 40000, Website: "https://www.uottawa.ca/en", image: UIImage(named: "ottawa")!))
        college.append(Colleges(name: "University of Illinois", location: "Illinois", numberOfStudents: 25000, Website: "http://illinois.edu", image: UIImage(named: "UofI")!))
        college.append(Colleges(name: "College of Charleston", location: "South Carolina", numberOfStudents: 12000, Website: "http://www.cofc.edu", image: UIImage(named: "Charleston")!))
        }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = college[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            college.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let colleges = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(colleges, atIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.colleges = college[index!]
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
    
           let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"
            }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let cityTextField = alert.textFields![0] as UITextField
            self.college.append(Colleges(name: cityTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
      
        }
    
    @IBAction func onEditButtonTapped(sender: UIBarButtonItem) {
        if sender.tag == 0
        {
            tableView.editing = true
            sender.tag = 1
        }
        else
        {
            tableView.editing = false
            sender.tag = 0
        }
    }
}


