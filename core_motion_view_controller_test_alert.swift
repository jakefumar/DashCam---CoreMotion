
/*  Created by Jake Fumar, Dennis Lin on 2/12/19.
 //  Copyright © 2019 Jake Fumar. All rights reserved.
 */
import UserNotifications
import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //These data fields are for the x,y,and z axis for the accelerometer
    @IBOutlet weak var xAcceleration: UITextField!
    @IBOutlet weak var yAcceleration: UITextField!
    @IBOutlet weak var zAcceleration: UITextField!
    @IBOutlet weak var magAcceleration: UITextField!
    
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
                let totalMag = calculateMagnitude (no1:Float (x), no2: Float (y),no3: Float (z))
                
                self.xAcceleration.text = "x: \(Float(x))"
                self.yAcceleration.text = "y: \(Float(y))"
                self.zAcceleration.text = "z: \(Float(z))"
                
                self.magAcceleration.text = "Total Magnitude: \(Float(totalMag))"
                
                if (Float(totalMag) > 3.00){
                let alert = UIAlertController (title: "Sudden acceleration detected", message: "Are you in an accident?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                }
            }
        }
    }
    
}

func calculateMagnitude (no1: Float, no2: Float, no3: Float) -> Float {
    let a = no1
    let b = no2
    let c = no3
    var data: Float = 0.00
    
    data = ((a*a) + (b*b) + (c*c)).squareRoot()
    return data
}



extension Double{
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self + divisor).rounded()/divisor
        
    }
    
    
}






