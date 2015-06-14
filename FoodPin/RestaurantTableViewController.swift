//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Jorge Gomez on 2015-05-19.
//  Copyright (c) 2015 Jorge Gomez. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    /*var restaurants = ["Model Milk" ,"Una Pizza + Wine","Da guido","Boun Giorno","Mercato","Chop","Globe Fish","La Chaumiere","El Gaucho","Lady Bug","Doble Zero","Alloy","Japanase Village","Vin Room","80th & Ivy","Ruth Cris","Vertigo","Market","Cilantro","Abruzzo","Ill centro","Teatro","Candela","Anejo","Divino","River Cafe","Galla","Anju","Raw Bar","Ox and Angela","Barcelona tavern","Monki","Blue star dinner","Corbeaux","Bocce","Posto Pizza","Bonterra","The Coup","Rodney","Miku Restaurant","Holy Gril","Gohan Sushi","Parc","Suzzette bistro","Yellow door bistro"]*/
    
    var restaurantsNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "ForKee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurant_images = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg","petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg","haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg","grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg","confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
   
     var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
     var restaurantsVisited = [Bool] (count: 21, repeatedValue: false)
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantsNames.count
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell_identifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier, forIndexPath: indexPath) as! CustomTableViewCell

        //get resrautants names from array and display them
        cell.nameLabel.text = restaurantsNames[indexPath.row]
        
        //get image name from array and display each image
        cell.thumbnailImageView.image = UIImage(named: restaurant_images[indexPath.row])
        
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        //Fork Icon
        cell.heartImageView.hidden = !self.restaurantsVisited[indexPath.row]
        
        //cell.accessoryType = restaurantsVisited[indexPath.row] ? .Checkmark : .None
        return cell
    }
    
    //recognize when user taps the iphone screen
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //Creates the menu for actions
        let optionMenu = UIAlertController(title: nil,  message: "What do you want to do?", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
        
        //Display Option Menu
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        //Call Action
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style:UIAlertActionStyle.Default, handler:{ (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        })
        //Display Call Button
        optionMenu.addAction(callAction)
        
        if restaurantsVisited[indexPath.row] {
        //Ive not been here 
        let IveNotBeenHereAction = UIAlertAction(title: "Ive not been here", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
           
            //object cell as CustomViewCell To be able to use the Icon.
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            //cell?.accessoryType = .None
            self.restaurantsVisited[indexPath.row] = false
            cell.heartImageView.hidden = !self.restaurantsVisited[indexPath.row]
        })
        optionMenu.addAction(IveNotBeenHereAction)
        }
        else {
        //Ive been here Action
        let IveBeenHereAction = UIAlertAction(title: "I've been here", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            //cell?.accessoryType = .Checkmark
            self.restaurantsVisited[indexPath.row] = true
            cell.heartImageView.hidden = !self.restaurantsVisited[indexPath.row]
        })
        //Display Ive been here Button
        optionMenu.addAction(IveBeenHereAction)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        }
    }
    
    override func tableView( tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
        //removes item from array at indexPath.row
        self.restaurantsNames.removeAtIndex(indexPath.row)
        self.restaurantLocations.removeAtIndex(indexPath.row)
        self.restaurant_images.removeAtIndex(indexPath.row)
        self.restaurantTypes.removeAtIndex(indexPath.row)
        self.restaurantsVisited.removeAtIndex(indexPath.row)
        
        //reload the tableView to show the updated table.
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath:NSIndexPath) -> [AnyObject] { var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title:"Share", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
    
        let shareMenu = UIAlertController(title: nil, message: "Share using",preferredStyle: .ActionSheet)
        let twitterAction = UIAlertAction(title: "Twitter", style:UIAlertActionStyle.Default, handler: nil)
        let facebookAction = UIAlertAction(title: "Facebook", style:UIAlertActionStyle.Default, handler: nil)
        let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default,handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel,handler: nil)
        
        shareMenu.addAction(twitterAction)
        shareMenu.addAction(facebookAction)
        shareMenu.addAction(emailAction)
        shareMenu.addAction(cancelAction)
        self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        )
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default,title: "Delete",handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
        // Delete the row from the data source
        self.restaurantsNames.removeAtIndex(indexPath.row)
        self.restaurantLocations.removeAtIndex(indexPath.row)
        self.restaurantTypes.removeAtIndex(indexPath.row)
        self.restaurantsVisited.removeAtIndex(indexPath.row)
        self.restaurant_images.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        )
        
        deleteAction.backgroundColor = UIColor(red: 255.0/255.0, green: 60.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 160.00/255.0, blue: 72.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
        
        
        
    }
}

