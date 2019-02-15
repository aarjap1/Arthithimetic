//
//  ViewController.swift
//  ArthimeticApp
//
//  Created by Piya,Aarjap Kumar on 2/14/19.
//  Copyright © 2019 Piya,Aarjap Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    @IBOutlet weak var activity: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var exerciseTime: UITextField!
    @IBOutlet weak var energy: UILabel!
    @IBOutlet weak var timeTo: UILabel!
    @IBAction func calculate(_ sender: Any) {
        if let activity1 = (activity.text),
            let weight1 = Double(weight.text!),
            let exerciseTime1 = Double(exerciseTime.text!){
           
            let energy1 = ExerciseCoach.energyConsumed(during: activity1, weight:  weight1, time: exerciseTime1)
            let timeTo1 = (ExerciseCoach.timetoLose1Pound(during: activity1, weight: weight1))
            energy.text = String(format: "%.1f cal", energy1)
            timeTo.text = String(format: "%.1f Minutes", timeTo1)
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        activity.text = ""
        weight.text = ""
        exerciseTime.text = ""
        energy.text = String(0.0)
        timeTo.text = String(0.0)
    }
}


struct ExerciseCoach {
    static let sports:[String:Double] = ["Bicycling":8.0,"Jumping rope":12.3,"Running-slow":9.8,"Running fast":23.0,"Tennis":8.0,"Swimming":5.8]
    
    static func energyConsumed(during:String, weight:Double, time:Double) -> Double{
        if let value = sports[during]{
            var calculation = 0.0
            calculation = ((value * 3.5 * weight/2.2) / 200.0) * time
            return calculation
        }
        return 0.0
    }
    
    static func timetoLose1Pound(during:String, weight :Double) -> Double{
        if let value = sports[during]{
            return (3500/((value*3.5*(weight)/2.2)/200))
        }
        return 0.0
    }
}


