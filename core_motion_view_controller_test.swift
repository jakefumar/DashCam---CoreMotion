//
//  ViewController.swift
//  Test_CoreMotion
//
//  Created by Jake Fumar on 2/12/19.
//  Copyright © 2019 Jake Fumar. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //These data fields are for the x,y,and z axis for the accelerometer
    @IBOutlet weak var xAcceleration: UITextField!
    @IBOutlet weak var yAcceleration: UITextField!
    @IBOutlet weak var zAcceleration: UITextField!
    
    //create object so that we can manage the motion data from acceleromter
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myAccelerometer()
    }
    
    
    func myAccelerometer(){
        
        motion.accelerometerUpdateInterval = 0.25
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                
                self.xAcceleration.text = "x: \(Float(x))"
                self.yAcceleration.text = "y: \(Float(y))"
                self.zAcceleration.text = "z: \(Float(x))"
            }
        }
    }
    
}


extension Double{
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self + divisor).rounded()/divisor
        
    }
    
    
}






