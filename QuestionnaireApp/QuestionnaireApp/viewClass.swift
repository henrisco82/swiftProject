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
    
    @IBOutlet weak var correct: UILabel!
    
    @IBOutlet weak var Option1: UIButton!
    
    @IBOutlet weak var Option2: UIButton!
    
    @IBOutlet weak var Option3: UIButton!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    var questionNumber = Int()
    
    var questions = [String]()
    var tempOption1 = [String]()
    var tempOption2 = [String]()
    var tempOption3 = [String]()
    var Options = [[String]]()
    
    @IBAction func nextQuestion(_ sender: UIButton) {
         //  viewDidLoad()
    }
    
    @IBAction func option1pressed(_ sender: UIButton) {
        if questionNumber == 0{
           // nextQuestion.isHidden = false
            correct.text = "correct"
        }else if questionNumber == 1{
            //nextQuestion.isHidden = false
            correct.text = "correct"
        }else if questionNumber == 2{
           // nextQuestion.isHidden = false
            correct.text = "correct"
        }
        
    }
    
    @IBAction func option2pressed(_ sender: UIButton) {
        if questionNumber == 0{
            //nextQuestion.isHidden = false
            correct.text = "correct"
        }else if questionNumber == 1{
            //nextQuestion.isHidden = false
            correct.text = "correct"
        }else if questionNumber == 2{
           // nextQuestion.isHidden = false
            correct.text = "correct"
        }
    }
    
  
    @IBAction func option3pressed(_ sender: UIButton) {
        if questionNumber == 0{
            //nextQuestion.isHidden = false
            correct.text = "correct"
        }else if questionNumber == 1{
            //nextQuestion.isHidden = false
            correct.text = "correct"
        }else if questionNumber == 2{
            //nextQuestion.isHidden = false
            correct.text = "correct"
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // newQuestion()
        
    }
    
    override func viewDidLoad() {
        questionNumber = Int(arc4random_uniform(3))
        nextQuestion.isHidden = true
        correct.text = ""
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
                          
                            self.tempOption1.append(op1 as! String)
                        }
                        
                        if let op2 = object["option2"] {
                            self.tempOption2.append(op2 as! String)
                        }
                        
                        
                        if let op3 = object["option3"] {
                            self.tempOption3.append(op3 as! String)
                        }
                        
                    }
                    
                }
                self.Options.append(self.tempOption1)
                self.Options.append(self.tempOption2)
                self.Options.append(self.tempOption3)
                
                
                
                switch self.questionNumber{
                case 0:
                    self.Label.text = self.questions[0]
                    self.Option1.setTitle(self.Options[0][0], for: .normal)
                    self.Option2.setTitle(self.Options[1][0], for: .normal)
                    self.Option3.setTitle(self.Options[2][0], for: .normal)
                    break
                case 1:
                    self.Label.text = self.questions[1]
                    self.Option1.setTitle(self.Options[0][1], for: .normal)
                    self.Option2.setTitle(self.Options[1][1], for: .normal)
                    self.Option3.setTitle(self.Options[2][1], for: .normal)
                    break
                case 2:
                    self.Label.text = self.questions[1]
                    self.Option1.setTitle(self.Options[0][2], for: .normal)
                    self.Option2.setTitle(self.Options[1][2], for: .normal)
                    self.Option3.setTitle(self.Options[2][2], for: .normal)
                    break
                default:
                    break
                }
                
            
                
                
               
            }
            
            
        }
        
        
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

