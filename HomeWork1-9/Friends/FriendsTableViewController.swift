//
//  FriendsTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

struct GroupedFriend {
    let character: Character
    var groups: [Friend]
}

class FriendsTableViewController: UITableViewController {
    
    var friendsList = Friend.friends
    
    var groupedFriends: [GroupedFriend] {
        var result = [GroupedFriend]()
        
        for friends in friendsList {
            guard let character = friends.name.first else {
                continue
            }
            
            if let groupedIndex = result.firstIndex(where: { $0.character == character }) {
                result[groupedIndex].groups.append(friends)
            } else {
                
                let groupedFriend = GroupedFriend(character: character, groups: [friends])
                result.append(groupedFriend)
            }
        }
        
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedFriends.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupedFriend = groupedFriends[section]
        return groupedFriend.groups.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupedFriend = groupedFriends[section]
        return String(groupedFriend.character)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell
        let groupedFriend = groupedFriends[indexPath.section]
        let friend = groupedFriend.groups[indexPath.row]
        
        cell?.friendsImage.image = UIImage(named: friend.avatar)
        cell?.nameFriendsLabel.text = friend.name
        
        return cell ?? UITableViewCell()
    }
    
    // Adding an avatar to a user profile
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let cell = sender as? FriendsTableViewCell,
              let index = tableView.indexPath(for: cell)?.row,
              let photoVC = segue.destination as? FriendsCollectionViewController else { return }

        let friend = friendsList[index]

        photoVC.friendsPhotos = friend.photos
    }
}
