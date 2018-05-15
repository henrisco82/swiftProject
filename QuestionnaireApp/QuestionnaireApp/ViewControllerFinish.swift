//
//  ViewControllerFinish.swift
//  QuestionnaireApp
//
//  Created by Student on 2018. 05. 15..
//  Copyright © 2018. macos. All rights reserved.
//

import UIKit
import Parse



class ViewControllerFinish: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    var firstname: String = ""
    var lastname: String = ""
    var dateOfBirth: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "Response")
        query.findObjectsInBackground { (objects, error) -> Void in
            if error == nil {
                // There were no errors in the fetch
                if let returnedObjects = objects {
                    // var text = ""
                    // Objects Array is not nil
                    // loop through the array to get each object
                    for object in returnedObjects {
                        // print(object["question"] as! String)
                        self.firstname = object["firstname"] as! String
                        self.lastname = object["lastname"] as! String
                        self.dateOfBirth = object["dateOfBirth"] as! String
                        self.label1.text = self.firstname
                        self.label2.text = self.lastname
                        self.label3.text = self.dateOfBirth
                      
                        
                    }
                    
                }
           
                
            }
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
