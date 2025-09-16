//
//  emojiTableViewController.swift
//  emojiTableViewPractice
//
//  Created by AARYUSHI on 21/08/25.
//

import UIKit

class emojiTableViewController: UITableViewController {

    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> addEditTableViewController? {
        guard let indexPath = sender as? IndexPath else {
            return addEditTableViewController(coder: coder, emoji: nil)
        }
        return addEditTableViewController(coder: coder , emoji: emojis[indexPath.row])
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.leftBarButtonItem = self.editButtonItem
//
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(emojis[indexPath.row].symbol) - \(emojis[indexPath.row].name)"
        content.secondaryText = "\(emojis[indexPath.row].description)"
        
        cell.contentConfiguration = content
        // Configure the cell...
        cell.showsReorderControl = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: indexPath)
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
     
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    // Override to support rearranging the table view.
    //reordering
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(removedEmoji, at: to.row)
    }
    @IBAction func unwindToEmojiList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" , let addEditVC = segue.source as? addEditTableViewController , let emoji = addEditVC.emoji else { return}
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else{
            emojis.append(emoji)
            let indexPath = IndexPath(row: emojis.count-1 , section: 0 )
            tableView.insertRows(at: [indexPath], with: .fade)
            return
        }
        emojis[selectedIndexPath.row] = emoji
        tableView.reloadRows(at: [selectedIndexPath], with: .fade)
    }

    
    
    
    
    
}
