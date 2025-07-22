//
//  ViewController.swift
//  Two Buttons
//
//  Created by AARYUSHI on 16/07/25.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var labelField: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func setTextButton(_ sender: UIButton) {
        let input = textField.text
        labelField.text = input
    }
    @IBAction func clearTextButton(_ sender: UIButton) {
        labelField.text = ""
    }
}

