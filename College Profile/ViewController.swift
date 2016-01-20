//
//  ViewController.swift
//  College Profile
//
//  Created by mkelly2 on 1/20/16.
//  Copyright © 2016 mkelly2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities: [Colleges] = []

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }


}

