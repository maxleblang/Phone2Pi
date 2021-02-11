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
    var mqttTopic: String = "p2p" //channel that app is publishing to
    //Slider
    @IBOutlet weak var S1Slider: UISlider!
    @IBOutlet weak var S2Slider: UISlider!
    //Slider text
    @IBOutlet weak var S1ValText: UILabel!
    @IBOutlet weak var S2ValText: UILabel!
    //Button send values (Default to empty)
    var B1Val: String = ""
    var B2Val: String = ""
    var B3Val: String = ""
    var B4Val: String = ""
    //Text Field
    @IBOutlet weak var T1Field: UITextField!
    //MQTT info labels
    @IBOutlet weak var hostnameText: UILabel!
    
    override func viewDidLoad() {
        //connecting to pi with MQTT
        mqttClient = CocoaMQTT(clientID: "P2PApp", host: hostname, port: UInt16(port)!)
        let connected: Bool = mqttClient.connect()
        print(connected)
        hostnameText.text = hostname
        super.viewDidLoad()
    }
    
    //Back to home Button
    @IBAction func homeSegueButton(_ sender: UIButton) {
        //performSegue(withIdentifier: "homeSegue", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    //Sliders
    @IBAction func S1Slider(_ sender: UISlider) {
        //update text
        let val: Float = round(sender.value)
        S1ValText.text = String(val)
        //send value
        mqttClient.publish(mqttTopic, withString: "S1:"+String(val))
    }
    @IBAction func S2Slider(_ sender: UISlider) {
        //update text
        let val: Float = round(sender.value)
        S2ValText.text = String(val)
        //send value
        mqttClient.publish(mqttTopic, withString: "S2:"+String(val))
    }
    //Buttons
    @IBAction func B1Button(_ sender: UIButton) {
        print(B1Val)
        //send value
        mqttClient.publish(mqttTopic, withString: "B1:"+B1Val)
    }
    @IBAction func B2Button(_ sender: UIButton) {
        print(B2Val)
        //send value
        mqttClient.publish(mqttTopic, withString: "B2:"+B2Val)
    }
    @IBAction func B3Button(_ sender: UIButton) {
        print(B3Val)
        //send value
        mqttClient.publish(mqttTopic, withString: "B3:"+B3Val)
    }
    @IBAction func B4Button(_ sender: UIButton) {
        print(B4Val)
        //send value
        mqttClient.publish(mqttTopic, withString: "B4:"+B4Val)
    }
    //Text Field
    @IBAction func T1SendButton(_ sender: UIButton) {
        let Fieldtext: String = T1Field.text ?? "" //defualt to empty
        print(Fieldtext)
        //send value
        mqttClient.publish(mqttTopic, withString: "T1:"+Fieldtext)
        //reset text field
        T1Field.text = ""
    }
    //close T1 with return key
    @IBAction func T1Done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}
