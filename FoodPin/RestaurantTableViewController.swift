//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Jorge Gomez on 2015-05-19.
//  Copyright (c) 2015 Jorge Gomez. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    var allRestaurants: [Restaurant] = [
    
    Restaurant(name: "80th and Ivy", location: "1127 17 Ave SW, Calgary, AB T2T 0B6", phone: "(403) 452-6905", type: "Restaurant", image: "80thandivy.jpeg", isVisited: false),
    Restaurant(name: "Abruzzo", location: "402 8 St SW, Calgary, AB T2P 0N3", phone: "(403) 237-5660", type: "Restaurant", image: "abruzzo.jpeg", isVisited: false),
    Restaurant(name: "Alloy", location: "220 42 Ave SE, Calgary, AB T2G 1Y3", phone: "(403) 287-9255", type: "Restaurant", image: "alloy.jpeg", isVisited: false),
    Restaurant(name: "Añejo", location: "2116 4 St SW, Calgary, AB T2S 1W7", phone: "(587) 353-2656", type: "Restaurant/Bar", image: "anejo.jpeg", isVisited: false),
    Restaurant(name: "Candela", location: "1919 4 St SW, Calgary, AB T2S 1W4", phone: "(403) 719-0049", type: "Lounge-bar", image: "candela.jpeg", isVisited: false),
    Restaurant(name: "Chop Steak House", location: "6605 Macleod Trail SW, Calgary, AB T2H 2V1", phone: "403-250-2043", type: "Restaurant", image: "chop.jpeg", isVisited: false),
    Restaurant(name: "Cilantro", location: "338 17 Ave SW, Calgary, AB T2S 0A3", phone: "(403) 229-1177", type: "Restaurant", image: "cilantro.jpeg", isVisited: false),
    Restaurant(name: "Da Guido", location: "2001 Centre Street N, Calgary, AB T2E 2S9", phone: "(403) 276-1365", type: "Restaurant", image: "Daguido.jpeg", isVisited: false),
    Restaurant(name: "Doble Zero", location: "1133, 6455 Macleod Trail SW", phone: "(403) 457-7677", type: "Restaurant", image: "doblezero.jpeg", isVisited: false),
    Restaurant(name: "El Gaucho", location: "5920 Macleod Trail SW #100, Calgary, AB T2H 0K2", phone: "(403) 454-9119", type: "Restaurant", image: "elgaucho.jpeg", isVisited: false),
    Restaurant(name: "Globe Fish", location: "6455 Macleod Trail SW #0130, Calgary, AB T2H 0K3", phone: "(403) 457-1500", type: "Restaurant", image: "globefish.jpeg", isVisited: false),
    Restaurant(name: "Japanese Village", location: "317 10 Ave SW, Calgary, AB T2R 0A5", phone: "(403) 262-2738", type: "Restaurant", image: "japanesevillage.jpeg", isVisited: false),
    Restaurant(name: "Lady Bug", location: "2132-10 Aspen Stone Blvd SW, Calgary, AB T3H 5Z2", phone: "(403) 249-5530", type: "Restaurant", image: "ladybug.jpeg", isVisited: false),
    Restaurant(name: "Market", location: "718 17 Ave SW, Calgary, AB T2S 0B7", phone: "(403) 474-4414", type: "Restaurant", image: "market.jpeg", isVisited: false),
    Restaurant(name: "Mercato", location: "873 85 St SW, Calgary, AB T3H 0J5", phone: "(403) 685-0460", type: "Restaurant", image: "mercato.jpeg", isVisited: false),
    Restaurant(name: "Model Milk", location: "308 17 Ave SW, Calgary, AB T2S 0A8", phone: "(403) 265-7343", type: "Restaurant", image: "modelmilk.jpeg", isVisited: false),
    Restaurant(name: "Notable", location: "4611 Bowness Rd NW, Calgary, AB T3B 0B2", phone: "(403) 288-4372", type: "Restaurant", image: "notable.jpeg", isVisited: false),
    Restaurant(name: "Ruth Chris", location: "Calgary Tower, 115 9 Ave SE, Calgary, AB T2G 0P5", phone: "(403) 246-3636", type: "Restaurant", image: "ruthchris.jpeg", isVisited: false),
    Restaurant(name: "Teatro", location: "200 8 Ave SE, Calgary, AB T2G 0K7", phone: "(403) 290-1012", type: "Restaurant", image: "teatro.jpeg", isVisited: false),
    Restaurant(name: "Una Pizza + Wine", location: "618 17 Ave SW, Calgary, AB T2S 0B4", phone: "(403) 453-1183", type: "Restaurant/Bar", image: "unapizza.jpeg", isVisited: false),
    Restaurant(name: "Vertigo", location: "115 9 Ave SE, Calgary, AB T2P 1K1", phone: "(403) 221-3707", type: "Restaurant", image: "vertigo.jpeg", isVisited: false),
    Restaurant(name: "Vin Room", location: "8561 8A Ave SW, Calgary, AB T3H 0V5", phone: "(587) 353-8812", type: "Restaurant", image: "vinroom.jpeg", isVisited: false)
    ]
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
}
    
    override func viewDidAppear(animated: Bool) {
    //makes sure the bar navigation hides when user scroll down
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allRestaurants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell_identifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        let restaurant = allRestaurants[indexPath.row]
        //get resrautants names from array and display them
        cell.nameLabel.text = restaurant.name
        
        //get image name from array and display each image
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
       
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 5
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        
        //Fork Icon
        cell.heartImageView.hidden = !restaurant.isVisited
        
        //cell.accessoryType = restaurantsVisited[indexPath.row] ? .Checkmark : .None
        return cell
    }

   /*
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
    */
    
    override func tableView( tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
        //removes item from array at indexPath.row
        self.allRestaurants.removeAtIndex(indexPath.row)
        
        //reload the tableView to show the updated table.
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath:NSIndexPath) -> [AnyObject] { let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title:"Share", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
    
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
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default,title: "Delete",handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
        // Delete the row from the data source
        self.allRestaurants.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        )
        
        deleteAction.backgroundColor = UIColor(red: 255.0/255.0, green: 60.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 160.00/255.0, blue: 72.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            if segue.identifier == "showRestaurantDetail" {
                if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as! DetailViewController
                    destinationController.restaurant = allRestaurants[indexPath.row]
                }
            }
        }
    
        @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue){
        
        
        }
    
}

