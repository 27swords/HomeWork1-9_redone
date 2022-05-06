//
//  MyGroupTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class MyGroupTableViewController: UITableViewController {

    var mySubscribedGroups = [AllGroup]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySubscribedGroups = subscribedGroups
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySubscribedGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupList", for: indexPath) as? MyGroupTableViewCell
        let group = mySubscribedGroups[indexPath.row]
        
        cell?.myGroupLabel.text = group.nameGroup
        cell?.photosMyGroupImage.image = UIImage(named: group.photoGroup)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        mySubscribedGroups.swapAt(sourceIndexPath.item, destinationIndexPath.item)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.beginUpdates()
            
            let removedItem = mySubscribedGroups.remove(at: indexPath.row)
            
            unSubscribedGroups.append(removedItem)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        } else if editingStyle == .insert {
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddGroup" {
            if let newGroupsVC = segue.destination as? GroupTableViewController {
                newGroupsVC.delegate = self
            }
        }
    }
}

extension MyGroupTableViewController: AllGroupsTableViewControllerDelegate {
    func userSubscribed(group: [AllGroup]) {
        tableView.reloadData()
    }
}
