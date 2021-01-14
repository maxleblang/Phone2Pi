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
    
    override func viewDidLoad() {
        //connecting to pi with MQTT
        mqttClient = CocoaMQTT(clientID: "P2PApp", host: hostname, port: UInt16(port)!)
        let connected: Bool = mqttClient.connect()
        print(connected)

        super.viewDidLoad()
        
    }
    
    @IBAction func buttonDown(_ sender: UIButton) {
        mqttClient.publish("p2p", withString: "Hello World")
    }
    
    //Unwind segue back to home
    @IBAction func homeSegueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "homeSegue", sender: nil)
    }
    
}
