//
//  TimerViewController.swift
//  Super Vision
//
//  Created by kanchan yadav on 5/20/17.
//  Copyright © 2017 kanchan yadav. All rights reserved.
//

import UIKit

enum TimerState {
    case start
    case resume
    case repeate
}

class TimerViewController: UIViewController {

    @IBOutlet weak var timerView: CircleView!
    
    @IBOutlet weak var exerciseTitle: UILabel!
    var timerState : TimerState = .start
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.addCircleView()
//        timerView.animateCircle(duration:60)
    }
    
    
    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    private func addCircleView() {
        //let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
        let circleWidth = CGFloat(250)
        let circleHeight = circleWidth
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        let circleX = (screenWidth-circleWidth)/2
        let circleY = (screenHeight-circleHeight)/2
        // Create a new CircleView
        let circleView = CircleView(frame: CGRect(x: circleX, y: circleY, width: circleWidth, height: circleHeight))
        
        view.addSubview(circleView)
        
        // Animate the drawing of the circle over the course of 1 second
        circleView.animateCircle(duration:60 )
       
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        timerView.animateCircle(duration:10)
        
    }
    
    @objc private func taskEnded(){
        
    }
    
   
}
