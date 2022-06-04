//
//  MyGroupTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class MyGroupTableViewController: UITableViewController {
   
    //MARK: - Outlets
    @IBOutlet weak var myGroupSearchBar: UISearchBar!
    
    //MARK: - Init
    var mySubscribedGroups = [AllGroup]()
    let groupsService = VkGroups()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myGroupSearchBar.delegate = self
        mySubscribedGroups = subscribedGroups
        groupsService.VkGroupsService()
    }
    
    //MARK: - Methods
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
        } else if editingStyle == .insert { }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGroup" {
            if let newGroupsVC = segue.destination as? GroupTableViewController {
                newGroupsVC.delegate = self
            }
        }
    }
}

//MARK: - Extension
extension MyGroupTableViewController: AllGroupsTableViewControllerDelegate {
    func userSubscribed(group: [AllGroup]) {
        tableView.reloadData()
    }
}

extension MyGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            mySubscribedGroups = subscribedGroups
            tableView.reloadData()
            return
        }
        
        mySubscribedGroups = subscribedGroups.filter { $0.nameGroup.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }
}
