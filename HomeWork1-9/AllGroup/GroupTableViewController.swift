//
//  GroupTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 7.04.22.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var groupsNames: [AllGroup] = [AllGroup(nameGroup: "Сonversation", photoGroup: "comment"),
                                   AllGroup(nameGroup: "Party", photoGroup: "champagne"),
                                   AllGroup(nameGroup: "NewYear", photoGroup: "fireworks"),
                                   AllGroup(nameGroup: "Work searches", photoGroup: "success"),
                                   AllGroup(nameGroup: "Memes🤡", photoGroup: "positive-review")
    ]

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
