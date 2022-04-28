//
//  FriendsTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

struct SectionFriend {
    let character: Character
    var friend: [Friend]
}

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet weak var friendsSearchBar: UISearchBar!
    
    var displayFriends = [Friend]()
    
    var sectionFriend: [SectionFriend] {
        var result: [SectionFriend] = []
        
        for friend in displayFriends {
            guard let character = friend.name.first else {
                continue
            }
            
            if let friendIndex = result.firstIndex(where: { $0.character == character }) {
                result[friendIndex].friend.append(friend)
            
            } else {
               
                let sectionFriend = SectionFriend(character: character, friend: [friend])
                result.append(sectionFriend)
            }
        }
        return result
    }
    
    //MARK: - Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsSearchBar.delegate = self
        displayFriends = allFriends
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionFriend.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionFriend[section].friend.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell
        let sectionFriend = sectionFriend[indexPath.section]
        let friend = sectionFriend.friend[indexPath.row]
        
        cell?.nameFriendsLabel.text = "\(friend.name)"
        cell?.friendsImage?.image = UIImage(named: friend.avatar.namePhoto)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionFriend[section].character)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let photosVC = segue.destination as? FriendsCollectionViewController
        else {
            return
        }
        
        let sectionFriend = sectionFriend[indexPath.section]
        let friend = sectionFriend.friend[indexPath.row]
        
        if let friendIndex = allFriends.firstIndex(where: { $0.name == friend.name }) {
            photosVC.frinedsIndex = friendIndex
        }
        
        photosVC.frinedsIndex = indexPath.row
        photosVC.title = friend.name
    }
}

// MARK: - extension

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            displayFriends = allFriends
            tableView.reloadData()
            return
        }
        
        displayFriends = allFriends.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }
}
