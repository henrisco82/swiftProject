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
    @IBOutlet weak var Option3: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var correct: UILabel!
    
    
    
    
    @IBOutlet weak var Next: UIButton!

    
    
    var questionNumber = 0
     var s = 0
    
    var questions = [String]()
    var answers = [String]()
    var tempOption1 = [String]()
    var tempOption2 = [String]()
    var tempOption3 = [String]()
    var Options = [[String]]()
    
   
   
    @IBAction func option1checked(_ sender: UIButton) {
        let ans = sender.currentTitle
        print(questionNumber)
        print(answers[questionNumber])
        if ans == answers[questionNumber]{
            s = s + 1
            score.text = String(s)
            correct.text = "correct"
        }else{
            correct.text = "incorrect"
        }
        if questionNumber == 0{
            Next.isHidden = false
            
        }else if questionNumber == 1{
            Next.isHidden = false
        
        }else if questionNumber == 2{
            Next.isHidden = false
     
        }else if questionNumber == 3{
            Next.isHidden = false
        }
    }
    
    @IBAction func option2checked(_ sender: UIButton) {
        let ans = sender.currentTitle
        print(questionNumber)
        print(answers[questionNumber])
        if ans == answers[questionNumber]{
            s = s + 1
            score.text = String(s)
            correct.text = "correct"
        }else{
            correct.text = "incorrect"
        }
        if questionNumber == 0{
           Next.isHidden = false
           
        }else if questionNumber == 1{
            Next.isHidden = false
            
          
        }else if questionNumber == 2{
            Next.isHidden = false
        
        }
        else if questionNumber == 3{
            Next.isHidden = false
            
        }
    }
    
    @IBAction func option3checked(_ sender: UIButton) {
        let ans = sender.currentTitle
        print(questionNumber)
        print(answers[questionNumber])
        if ans == answers[questionNumber]{
            s = s + 1
            score.text = String(s)
            correct.text = "correct"
        }else{
            correct.text = "incorrect"
        }
        if questionNumber == 0{
           Next.isHidden = false
            
            
        }else if questionNumber == 1{
           Next.isHidden = false
        }else if questionNumber == 2{
            Next.isHidden = false
        }else if questionNumber == 3{
            Next.isHidden = false
            
        }
    }
    
    @IBAction func NextQuestion(_ sender: UIButton) {
         Next.isHidden = true
        
        self.questionNumber = self.questionNumber + 1
        if(self.questionNumber == questions.count){
              performSegue(withIdentifier: "finish", sender: self)
        }else{
            self.Label.text = self.questions[self.questionNumber]
            self.Option1.setTitle(self.Options[0][self.questionNumber], for: .normal)
            self.Option2.setTitle(self.Options[1][self.questionNumber], for: .normal)
            self.Option3.setTitle(self.Options[2][self.questionNumber], for: .normal)
        }
        
        if(self.questionNumber == questions.count-1){
            //  sender.setTitle("Finish", for: .normal)
            Next.setTitle("Finish", for: .normal)
        }
       
   
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //NextQuestion()
        
    }
    
    override func viewDidLoad() {
       // questionNumber = Int(arc4random_uniform(3))
        Next.isHidden = true
        correct.text = ""
        score.text = ""
        
        
       
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
                        self.answers.append(object["answer"] as! String)
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
                
            
                self.Label.text = self.questions[0]
                self.Option1.setTitle(self.Options[0][0], for: .normal)
                self.Option2.setTitle(self.Options[1][0], for: .normal)
                self.Option3.setTitle(self.Options[2][0], for: .normal)
   

           }
    
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
                
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


