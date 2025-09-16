//
//  FoodTableTableViewController.swift
//  MealTracker
//
//  Created by AARYUSHI on 18/08/25.
//

import UIKit

class FoodTableTableViewController: UITableViewController {
    var meals: [Meal] {
        var breakfast = Meal(name:"BREAKFAST",food: [food1,food2,food3])
        var lunch = Meal(name:"LUNCH",food: [food5, food6,food7])
        var dinner = Meal(name:"DINNER",food: [food8,food9,food10])
        return [breakfast,lunch,dinner]
    }
    
        var food1 = Food(name:"Bread",description: "white bread")
        var food2 = Food(name:"Eggs",description: "white eggs")
        var food3 = Food(name:"Milk",description: "white milk")
    var food5 = Food(name: "Rice" , description: "white rice")
    var food6 = Food(name: "Chicken" , description: "kadhai chicken")
    var food7 = Food(name: "Paneer" , description: "paneer cheese")
    
    var food8 = Food(name: "Pasta" , description: "spaghetti pasta")
    var food9 = Food(name: "Burger" , description: "red tomato sauce burger")
    var food10 = Food(name: "Pizza" , description: "cheese pizza")
//        return [food1,food2,food3]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = meals[indexPath.section].food[indexPath.row].name
        content.secondaryText = meals[indexPath.section].food[indexPath.row].description
        cell.contentConfiguration = content

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

   

}
