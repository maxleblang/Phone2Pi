//
//  OptionsViewController.swift
//  Phone2Pi
//
//  Created by Max Leblang on 1/20/21.
//

import UIKit

class OptionsViewController: UIViewController {
    //Slider max and mins
    @IBOutlet weak var S1Max: UITextField!
    @IBOutlet weak var S1Min: UITextField!
    @IBOutlet weak var S2Max: UITextField!
    @IBOutlet weak var S2Min: UITextField!
    //Button vals
    @IBOutlet weak var B1Val: UITextField!
    @IBOutlet weak var B2Val: UITextField!
    @IBOutlet weak var B3Val: UITextField!
    @IBOutlet weak var B4Val: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if let mainVC = presentingViewController as? MainViewController {
            //Push all data from this VC to MainViewController
            //check to make sure all pushed values are input by the user, if not, don't change them
            //update S1
            if(S1Max.text != ""){
                mainVC.S1Slider.maximumValue = Float(S1Max.text ?? "100")! //default max to 100
            }
            if(S1Min.text != ""){
                mainVC.S1Slider.minimumValue = Float(S1Min.text ?? "0")! //defualt min to 0
            }
            //update S2
            if(S2Max.text != ""){
                mainVC.S2Slider.maximumValue = Float(S2Max.text ?? "100")! //default max to 100
            }
            if(S2Min.text != ""){
                mainVC.S2Slider.minimumValue = Float(S2Min.text ?? "0")! //defualt min to 0
            }
            //update Buttons
            if(B1Val.text != ""){
                mainVC.B1Val = B1Val.text ?? "" //defualt to empty
            }
            if(B2Val.text != ""){
                mainVC.B2Val = B2Val.text ?? "" //defualt to empty
            }
            if(B3Val.text != ""){
                mainVC.B3Val = B3Val.text ?? "" //defualt to empty
            }
            if(B4Val.text != ""){
                mainVC.B4Val = B4Val.text ?? "" //defualt to empty
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
    
}
