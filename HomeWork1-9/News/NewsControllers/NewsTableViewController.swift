//
//  NewsTableViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 22.04.22.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let myDataNews = news

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDataNews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsTableViewCell {
            
            let post = myDataNews[indexPath.row]
            cell.avatarGroupImage.image = UIImage(named: post.avatarGroupImage)
            cell.postImage.image = UIImage(named: post.postImage)
            cell.nameGroupNewsLabel.text = post.nameGroupNews
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
            }
}
