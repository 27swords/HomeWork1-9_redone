//
//  GroupTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    let groupsNames = AllGroup.groupsNames

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let groupCell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as? GroupCellTableViewCell
        let group = groupsNames[indexPath.row]

        groupCell?.phorosAllGroupImage.image = UIImage(named: group.photoGroup)
        groupCell?.groupNameLabel.text = group.nameGroup

        return groupCell ?? UITableViewCell()
    }
}
