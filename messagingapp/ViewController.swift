//
//  ViewController.swift
//  messagingapp
//
//  Created by Nick Reichard on 4/30/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    var ref: FIRDatabaseReference?
    var databaseHandle: FIRDatabaseHandle?
    
    var postData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchDataFromFirebase()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") else { return UITableViewCell() }
        cell.textLabel?.text = postData[indexPath.row]
        
        return cell
    }
    
    func fetchDataFromFirebase() {
        
        ref = FIRDatabase.database().reference()
        
        // Retrieve the posts and listen for changes
        ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            // Code to execute when a child is added under "Posts"
            // Take the value from the snapshot and add it to the post data array
            // Try to convert the value of the data to a string
            let post = snapshot.value as? String
            
            if let actualPost = post {
                // Append the data to our postData array
                self.postData.append(actualPost)
                self.tableView.reloadData()
            }
        })
    }
}

