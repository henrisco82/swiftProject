//
//  ViewController.swift
//  QuestionnaireApp
//
//  Created by Student on 2018. 05. 04..
//  Copyright © 2018. macos. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController {
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    
    
    @IBAction func storeData(_ sender: UIButton) {
        
        let Response = PFObject(className: "Response")
        Response["firstname"] = firstname.text
        Response["lastname"] = lastname.text
        Response["dateOfBirth"] = dateOfBirth.text
        Response.saveInBackground {
            (success: Bool, error: Error?) in
            if(success) {
                print("Object has been saved.")
            
            } else {
                print("There was an error...")
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let finish = segue.destination as! ViewClass
        finish.firstname = firstname.text!
        finish.lastname = lastname.text!
        finish.dateOfBirth = dateOfBirth.text!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

