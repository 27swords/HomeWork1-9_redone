//
//  GroupTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

//MARK: - Protocol
protocol AllGroupsTableViewControllerDelegate {
    func userSubscribed(group: [AllGroup])
}

class GroupTableViewController: UITableViewController {
    
    //MARK: - outlets
    @IBOutlet weak var allGroupsSearchBar: UISearchBar!
    
    //MARK: - init
    var allSubscribedGroups = [AllGroup]()
    var delegate: AllGroupsTableViewControllerDelegate?
    let searchGroupService = VkSearchGroups()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroupsSearchBar.delegate = self
        searchGroupService.VkSearchGroupsService(searchText: "")
    }
    
    //MARK: - Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unSubscribedGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as? GroupCellTableViewCell
        let unSubscribedGroup = unSubscribedGroups[indexPath.row]
        
        cell?.phorosAllGroupImage.image = UIImage(named: unSubscribedGroup.photoGroup)
        cell?.groupNameLabel.text = unSubscribedGroup.nameGroup
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let subscribeAction = UISwipeActionsConfiguration(actions: [UIContextualAction(
            style: .normal,
            title: "Subscribe",
            handler: { _, _, block in
            
            tableView.beginUpdates()
            
            let subscribedGroup = unSubscribedGroups.remove(at: indexPath.item)
            subscribedGroups.append(subscribedGroup)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            self.delegate?.userSubscribed(group: subscribedGroups)
            
            tableView.endUpdates()
            
            block(true)})])
        
        return subscribeAction
    }
    
}

//MARK: - Extension
extension GroupTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            allSubscribedGroups = unSubscribedGroups
            tableView.reloadData()
            return
        }
        
        allSubscribedGroups = unSubscribedGroups.filter { $0.nameGroup.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }
}
