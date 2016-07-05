//
//  SecondViewController.swift
//  To Do List
//
//  Created by 이승희 on 2016. 3. 8..
//  Copyright © 2016년 이승희. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var item: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(item.text!)
        
        item.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        item.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        item.resignFirstResponder()
        
        return true
        
    }
}

