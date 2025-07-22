//
//  ViewController.swift
//  Login
//
//  Created by AARYUSHI on 18/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    @IBAction func unwindlandingPage(_ unwindSegue: UIStoryboardSegue) {
//        
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        segue.destination.navigationItem.title = usernameTextField.text
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                guard let sender = sender as? UIButton else { return }

                if sender == forgotPasswordButton {
                    segue.destination.navigationItem.title = "Forgot Password"
                } else if sender == forgotUserNameButton {
                    segue.destination.navigationItem.title = "Forgot Username"
                } else {
                    segue.destination.navigationItem.title = usernameTextField.text
                }
            }
    
    @IBAction func forgotUsernameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "BackToLandingPage", sender: sender)
        
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "BackToLandingPage", sender: sender)
        
    }
    
    
}

