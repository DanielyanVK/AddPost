//
//  PostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Outlets
    @IBOutlet weak private var postsTableView: UITableView!
    private let cellId = "PostCell"
    // Empty variable to transfer data
    var dataSource = [PostModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Table View default operations
        postsTableView.delegate = self
        postsTableView.dataSource = self
        
    // Register Cell's xib
        let cellXib = UINib(nibName: cellId, bundle: .main)
        postsTableView.register(cellXib, forCellReuseIdentifier: cellId)
    }
    // Move to screen where we add data to post
    @IBAction func plusButtonAction(_ sender: Any) {
        let nextViewController = AddPostViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Amount of rows based on amount of data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // Displays information added from dataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = dataSource[indexPath.row]
        if let cell = postsTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? PostCell {
            // Using method we created in Post cell
            cell.update(with: cellModel)
        }
        return UITableViewCell()
    }
}
