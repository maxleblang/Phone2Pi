//
//  ViewController.swift
//  Phone2Pi
//
//  Created by Max Leblang on 1/5/21.
//

import UIKit

class HomeViewController: UIViewController {
    //UI variables
    @IBOutlet weak var hostnameText: UITextField!
    @IBOutlet weak var portText: UITextField!
    @IBOutlet weak var emptyFieldText: UILabel!
    //MQTT variables
    var hostname: String = ""
    var port: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectButton(_ sender: UIButton) {
        hostname = hostnameText.text!
        port = portText.text!
        //check if hostname or port are empty
        if(hostname == "" || port == ""){
            emptyFieldText.text = "Please enter a valid hostname and port"
        }
        else{
            //move to MainViewController
            performSegue(withIdentifier: "menuSegue", sender: nil)
        }
    }
    
    //send user to the README with instructions on the Phone2Pi github
    @IBAction func helpButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://github.com/mleblan67/Phone2Pi/blob/main/README.md")! as URL, options: [:], completionHandler: nil)
    }
    
    
    //Prepare hostname and port data to send over to MainViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainVC = segue.destination as! MainViewController
        mainVC.hostname = hostname
        mainVC.port = port
    }
    
    //close keyaboard with return key
    @IBAction func hostnameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func portDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    
    
    
   
}

