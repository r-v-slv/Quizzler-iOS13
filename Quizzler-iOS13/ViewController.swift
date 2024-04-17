//
//  ViewController.swift
//  Quizzler iOS13
//
//  Created by Veaceslav ROTARI on 16/04/2024.
//  Copyright © 2024 Eclipse S.A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var getItButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var proggressBar: UIProgressView!
    @IBOutlet weak var finalResults: UILabel!
    
    
    var quizQuestions = [
        QuizQuestionStructure(q:"The Earth is flat.", a: true),
        QuizQuestionStructure(q:"Mount Everest is the tallest mountain on Earth.", a: true),
        QuizQuestionStructure(q:"Water boils at 100 degrees Fahrenheit.", a: false),
        QuizQuestionStructure(q:"The Great Wall of China is visible from space.", a: true),
        QuizQuestionStructure(q:"Mars is larger than Earth.", a: true),
        QuizQuestionStructure(q:"Dolphins are fish.", a: false),
        QuizQuestionStructure(q:"The human body has 206 bones.", a: true),
        QuizQuestionStructure(q:"A tomato is a fruit.", a: true),
        QuizQuestionStructure(q:"The capital of France is Berlin.", a: false),
        QuizQuestionStructure(q: "Albert Einstein discovered gravity.", a: false)
    ]
    
    

    var correctAnswerCount = 0
    var quizQuestionNumber = 0
    var trueOrFalse = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIQuestions()
        getItButton.isHidden = true
        finalResults.isHidden = true
        
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizQuestionNumber < (quizQuestions.count - 1) {
            updateUIQuestions()
            
            
            if sender.currentTitle == "True" {
                trueOrFalse = true
            }
            else{
                trueOrFalse = false
            }
            
            
            if trueOrFalse == quizQuestions[quizQuestionNumber].answer{
                questionLabel.text = "Correct!"
                getItButton.isHidden = false
                trueButton.isHidden = true
                falseButton.isHidden = true
                correctAnswerCount += 1
                proggressBar.progress += 0.1
                questionLabel.textColor = UIColor.green
                finalResults.isHidden = true
            }
            else{
                questionLabel.text = "Wrong!"
                getItButton.isHidden = false
                trueButton.isHidden = true
                falseButton.isHidden = true
                proggressBar.progress += 0.1
                questionLabel.textColor = UIColor.red
                finalResults.isHidden = true
            }
            quizQuestionNumber += 1
            print(quizQuestionNumber)
        }
        else
        {
            let userAnswer = trueOrFalse
            
            if userAnswer == quizQuestions[quizQuestionNumber].answer{
                correctAnswerCount += 1
                proggressBar.progress += 0.1
                questionLabel.text = "Correct!\n\n\n"
                questionLabel.textColor = UIColor.green
                finalResults.isHidden = false
                finalResults.text = "FINISH\n" + String(correctAnswerCount*10) + "% correct answers"
                getItButton.isHidden = false
                trueButton.isHidden = true
                falseButton.isHidden = true

            }
            else
            {
                proggressBar.progress += 0.1
                questionLabel.text = "Wrong!\n\n\n"
                questionLabel.textColor = UIColor.red
                finalResults.isHidden = false
                finalResults.text = "FINISH\n" + String(correctAnswerCount*10) + "% correct answers"
                getItButton.isHidden = false
                trueButton.isHidden = true
                falseButton.isHidden = true
                
            }



            proggressBar.progress = Float(quizQuestions.count)
            proggressBar.progress = 0
            correctAnswerCount = 0
            quizQuestionNumber = 0
            self.questionLabel.isHidden = false
            
//            questionLabel.textColor = UIColor.clear
        }


    }
    
    
    @IBAction func getItButtonPressed(_ sender: UIButton) {
        
        if quizQuestionNumber < (quizQuestions.count) {
            questionLabel.text = quizQuestions[quizQuestionNumber].question
            trueButton.isHidden = false
            falseButton.isHidden = false
            getItButton.isHidden = true
            questionLabel.textColor = UIColor.white
            finalResults.isHidden = true
        }
        else
        {
            questionLabel.text = quizQuestions[quizQuestionNumber].question
            trueButton.isHidden = true
            falseButton.isHidden = true
            getItButton.isHidden = true
            questionLabel.textColor = UIColor.white
            finalResults.isHidden = true
        }
    }
    
    
    func updateUIQuestions(){
        questionLabel.text = quizQuestions[quizQuestionNumber].question
        getItButton.isHidden = true
        questionLabel.textColor = UIColor.white
        
    }
}

