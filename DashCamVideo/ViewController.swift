//
//  ViewController.swift
//  DashCamVideo
//
//  Created by Jake Fumar on 3/31/19.
//  Copyright © 2019 Jake Fumar. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var RecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func RecordAction(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            
            print("Camera Available")
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            imagePicker.showsCameraControls = true
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        
        else {
            
            ("Camera Unavailable")
        }
        
    }
}

