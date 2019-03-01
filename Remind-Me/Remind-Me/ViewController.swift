//
//  ViewController.swift
//  Remind-Me
//
//  Created by Isaiah X Smith on 2/28/19.
//  Copyright © 2019 Isaiah X Smith. All rights reserved.
//

import UIKit

class ViewController: UITableViewController  {

    
    var reminder = [Reminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addReminder(_ sender: UIBarButtonItem) {
        let alert = UIAlertController.init(title: "New Reminder", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Reminder" //placeholder is just placeholder text
            
        }
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction.init(title: "Save", style: .default, handler: { (_) in
            guard let reminderText = alert.textFields?.first?.text,
                !reminderText.isEmpty else {
                return
        }
            
            self.reminder.append(Reminder(text: reminderText, completed: false))
            self.tableView.reloadData()
            
        }))
        
            present(alert, animated: true, completion:nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reminder = self.reminder[indexPath.item]
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = reminder.text
        
        if reminder.completed {
            cell.accessoryType = .checkmark //An accessoryType is like a checkmark or custom image that'll show up when the cell is completed
            cell.textLabel?.alpha = 0.5 //alpha represents brightness
        } else{
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0 //1.0 is the highest setting for alpha
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reminder.count //returns the number of items in the array.
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        reminder[indexPath.item].toggleCompleted()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

