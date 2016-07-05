//
//  FirstViewController.swift
//  To Do List
//
//  Created by 이승희 on 2016. 3. 8..
//  Copyright © 2016년 이승희. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    

    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if it exist
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
            
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }
    
    
}

