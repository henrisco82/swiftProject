//
//  viewClass.swift
//  QuestionnaireApp
//
//  Created by Student on 2018. 05. 04..
//  Copyright © 2018. macos. All rights reserved.
//

import Foundation
import Parse
import UIKit


class ViewClass: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Option1: UIButton!
    
    @IBOutlet weak var Option2: UIButton!
    
    @IBOutlet weak var Option3: UIButton!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    var questionNumber = Int()
    
    var currentQuestion = 0
    var rightAnswerPlacement = 0
    var questions = [String]()
    var tempOption1 = [String]()
    var tempOption2 = [String]()
    var tempOption3 = [String]()
    var Options = [[String]]()
    
    


    
    override func viewDidAppear(_ animated: Bool) {
        
        // newQuestion()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let query = PFQuery(className: "Questionnaire")
        query.findObjectsInBackground { (objects, error) -> Void in
            if error == nil {
                // There were no errors in the fetch
                if let returnedObjects = objects {
                    // var text = ""
                    // Objects Array is not nil
                    // loop through the array to get each object
                    for object in returnedObjects {
                        // print(object["question"] as! String)
                        self.questions.append(object["question"] as! String)
                        if let op1 = object["option1"] {
                            self.Option1.setTitle(op1 as? String, for: .normal)
                            self.tempOption1.append(op1 as! String)
                        }
                        
                        if let op2 = object["option2"] {
                            self.Option2.setTitle(op2 as? String, for: .normal)
                            self.tempOption2.append(op2 as! String)
                        }
                        
                        
                        if let op3 = object["option3"] {
                            self.Option3.setTitle(op3 as? String, for: .normal)
                            self.tempOption3.append(op3 as! String)
                        }
                        
                    }
                    
                    
                    
                }
                self.Options.append(self.tempOption1)
                self.Options.append(self.tempOption2)
                self.Options.append(self.tempOption3)
                print(self.Options)
                self.Label.text = self.questions[0]
                
               
            }
            
            
        }
        
        switch questionNumber{
            case 0:
                break
            case 1:
                break
            case 2:
                break
            default:
                break
        }
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

