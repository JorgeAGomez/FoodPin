//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Jorge Gomez on 2015-06-17.
//  Copyright (c) 2015 Jorge Gomez. All rights reserved.

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var restaurantImageView : UIImageView!
    var restaurant:Restaurant!
    
    @IBOutlet var tableView : UITableView!

    override func viewWillAppear(animated: Bool) {
    //makes sure the bar navigation doesnt hide.
    super.viewWillAppear(animated)
    self.navigationController?.hidesBarsOnSwipe = false
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.tableView.backgroundColor = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 0.9)
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        title = self.restaurant.name

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section : Int ) -> Int {
        return 5
    }
    
    func tableView(tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailTableViewCell
        
        switch indexPath.row {
    
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 2:
            cell.fieldLabel.text = "Phone #"
            cell.valueLabel.text = restaurant.phone
        case 3:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 4:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I have been here" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    
}
