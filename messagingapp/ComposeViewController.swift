//
//  ComposeViewController.swift
//  messagingapp
//
//  Created by Nick Reichard on 4/30/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var ref: FIRDatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()

    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        postDataToFireBase()
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func trashButtonTapped(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func postDataToFireBase() {
        
        // TODO: Post the data to firebase
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        
    }

}
