//
//  FriendsTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 12.04.22.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friends: [Friend] = [
    
        Friend(name: "Mark", avatar: "Friend (2)", photos: ["Friend (2)"]),
        Friend(name: "Alice", avatar: "Friend (1)", photos: ["Friend (1)"]),
        Friend(name: "Liza", avatar: "Friend (3)", photos: ["Friend (3)"]),
        Friend(name: "Adam", avatar: "Friend (4)", photos: ["Friend (4)"]),
        Friend(name: "Max", avatar: "Friend (5)", photos: ["Friend (5)"]),
        Friend(name: "Alex", avatar: "student", photos: ["student"])
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsTableViewCell
        let friend = friends[indexPath.row]
        
        cell?.friendsImage.image = UIImage(named: friend.avatar)
        cell?.nameFriendsLabel.text = friend.name
        
        return cell ?? UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? FriendsTableViewCell,
              let index = tableView.indexPath(for: cell)?.row,
              let photoVC = segue.destination as? FriendsCollectionViewController else { return }
        
        let friend = friends[index]
        
        photoVC.friendsPhotos = friend.photos
    }
}
