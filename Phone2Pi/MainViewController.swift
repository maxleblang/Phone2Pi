//
//  MenuViewController.swift
//  Phone2Pi
//
//  Created by Max Leblang on 1/5/21.
//

import UIKit
import CocoaMQTT

class MainViewController: UIViewController {
    //variables recieved from HomeViewController
    var hostname: String = ""
    var port: String = ""
    //MQTT variables
    var mqttClient: CocoaMQTT!
    //UI Variables
    @IBOutlet weak var S1ValText: UILabel!
    @IBOutlet weak var S2ValText: UILabel!
    @IBOutlet weak var T1Field: UITextField!
    
    
    override func viewDidLoad() {
        //connecting to pi with MQTT
        mqttClient = CocoaMQTT(clientID: "P2PApp", host: hostname, port: UInt16(port)!)
        let connected: Bool = mqttClient.connect()
        print(connected)

        super.viewDidLoad()
        
    }
    
    //Back to home Button
    @IBAction func homeSegueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "homeSegue", sender: nil)
    }
    //Sliders
    @IBAction func S1Slider(_ sender: UISlider) {
        //update text
        let val: Float = round(sender.value)
        S1ValText.text = String(val)
        //send value
    }
    @IBAction func S2Slider(_ sender: UISlider) {
        //update text
        let val: Float = round(sender.value)
        S2ValText.text = String(val)
        //send value
    }
    //Buttons
    @IBAction func B1Button(_ sender: UIButton) {
        //send value
    }
    @IBAction func B2Button(_ sender: UIButton) {
        //send value
    }
    @IBAction func B3Button(_ sender: UIButton) {
        //send value
    }
    @IBAction func B4Button(_ sender: UIButton) {
        //send value
    }
    //Text Field
    @IBAction func T1SendButton(_ sender: UIButton) {
        //send value
        T1Field.text = ""
    }
    
    
    
    
    
}
