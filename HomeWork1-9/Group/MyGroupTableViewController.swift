//
//  MyGroupTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class MyGroupTableViewController: UITableViewController {
    
    var mySubscribedGroups: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mySubscribedGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myListCell = tableView.dequeueReusableCell(withIdentifier: "MyGroupList", for: indexPath) as? MyGroupTableViewCell
        
        let myGroup = mySubscribedGroups[indexPath.item]
    
        myListCell?.myGroupLabel.text = myGroup
        myListCell?.photosMyGroupImage.image = UIImage(named: myGroup)
        
        return myListCell ?? UITableViewCell()
    }
    
    // Subscription method
    @IBAction func addGroup(segue: UIStoryboardSegue) {

        if segue.identifier == "addGroup" {
            guard let allGroupController = segue.source as? GroupTableViewController else { return }

            if let indexPath = allGroupController.tableView.indexPathForSelectedRow {

                let group = allGroupController.groupsNames[indexPath.item]

                if !mySubscribedGroups.contains(group.nameGroup) {

                    mySubscribedGroups.append(group.nameGroup)

                    tableView.reloadData()
                }
            }
        }
    }
    
    // Unsubscribe method
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            mySubscribedGroups.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
