//
//  addEditTableViewController.swift
//  emojiTableViewPractice
//
//  Created by AARYUSHI on 21/08/25.
//

import UIKit

class addEditTableViewController: UITableViewController {
   
    
    @IBOutlet weak var symbolTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    @IBOutlet weak var usageTextField: UITextField!
    
    
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    
    var emoji: Emoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveButton.isEnabled = false
        if let emoji = emoji{
            updateUI(emoji: emoji)
        }
        updateButtonState()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let emoji = Emoji(symbol: symbolTextField.text ?? "", name: nameTextField.text ?? "", description: descriptionTextField.text ?? "", usage: usageTextField.text ?? "")
        
            performSegue(withIdentifier:
                            "saveSegue", sender: sender)
        
    }
    
    @IBAction func textFieldUpdated(_ sender: Any) {
        updateButtonState()
    }
    
    func updateButtonState(){
        guard symbolTextField.text != "" && nameTextField.text != "" && descriptionTextField.text != "" && usageTextField.text != ""  else
        {
            SaveButton.isEnabled = false
            return
        }
        SaveButton.isEnabled = true
    }
    
    

    // MARK: - Table view data source
    
    init?(coder: NSCoder , emoji : Emoji?){
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func updateUI(emoji: Emoji){
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        
    }
    
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: indexPath)
    }
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
