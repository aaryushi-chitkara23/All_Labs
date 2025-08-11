//
//  ActivityViewController.swift
//  MoodMeal_ST1
//
//  Created by AARYUSHI on 07/08/25.
//

import UIKit

class ActivityViewController: UIViewController {
    
    
    
    @IBOutlet weak var forthButton: UIButton!
    @IBOutlet weak var forthLabel: UILabel!
    
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    
    
    
    var selectedMood: Mood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         if  let selectedMood = selectedMood {
            print(selectedMood)
             
        }
        
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI(){
        
        firstButton.setTitle(meals[0].activity.emoji, for: .normal)
        secondButton.setTitle(meals[1].activity.emoji, for: .normal)
        thirdButton.setTitle(meals[2].activity.emoji, for: .normal)
        forthButton.setTitle(meals[3].activity.emoji, for: .normal)
        
        firstLabel.text = meals[0].activity.name
        secondLabel.text = meals[1].activity.name
        thirdLabel.text = meals[2].activity.name
        forthLabel.text = meals[3].activity.name
        
//        firstButton.titleLabel?.text = "Happy"
        
    }
    
    @IBAction func activityButtonsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "activitySegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = "Suggested Meal"
        
        guard let destination = segue.destination as? resultViewController else { return }
        
        guard let button = sender as? UIButton else{
            return
        }
        
        switch button {
        case firstButton:
            destination.selectedactivity = meals[0].activity
        case secondButton:
            destination.selectedactivity = meals[1].activity
        case thirdButton:
            destination.selectedactivity = meals[2].activity
        case forthButton:
            destination.selectedactivity = meals[3].activity
        default:
            break
        }
        destination.selectedMood = selectedMood
        
    }
}
