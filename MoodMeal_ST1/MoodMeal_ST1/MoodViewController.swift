//
//  MoodViewController.swift
//  MoodMeal_ST1
//
//  Created by AARYUSHI on 07/08/25.
//

import UIKit

class MoodViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var forthButton: UIButton!
    @IBOutlet weak var forthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Mood"
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI(){
       
        firstButton.setTitle(meals[0].mood.emoji, for: .normal)
        secondButton.setTitle(meals[5].mood.emoji, for: .normal)
        thirdButton.setTitle(meals[9].mood.emoji, for: .normal)
        forthButton.setTitle(meals[13].mood.emoji, for: .normal)
        
        firstLabel.text = meals[0].mood.name
        secondLabel.text = meals[5].mood.name
        thirdLabel.text = meals[9].mood.name
        forthLabel.text = meals[13].mood.name
        
//        firstButton.titleLabel?.text = "Happy"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "MoodSegue", sender: sender)
            
            
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = "Select your activity level"
        guard let activityVC = segue.destination as? ActivityViewController else{
            return
        }
        guard let selectedButton = sender as? UIButton else{
            return
        }
        switch selectedButton {
        case firstButton:
            activityVC.selectedMood = meals[0].mood
        case secondButton:
            activityVC.selectedMood = meals[5].mood
        case thirdButton:
            activityVC.selectedMood = meals[9].mood
        case forthButton:
            activityVC.selectedMood = meals[13].mood
        default:
            break
        }
        
    }
}
