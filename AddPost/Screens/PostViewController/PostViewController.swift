//
//  PostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Calling Firestore Service Singleton
    let firestore = FirestoreService.shared
    // Empty variable to transfer data
    var dataSource = [PostModel]()
    // Outlets
    @IBOutlet weak private var postsTableView: UITableView!
    private let cellId = "PostCell"
    override func viewDidLoad() {
        super.viewDidLoad()
    // Calling method we defined in FireStoreService allows us to thack changes and update dataSource when smth happens
        firestore.listenUpdates {(posts) in
            self.dataSource = posts
            print(self.dataSource.count)
            self.postsTableView.reloadData()
        }
    // Table View default operations
        postsTableView.delegate = self
        
    // Register Cell's xib
        let cellXib = UINib(nibName: cellId, bundle: .main)
        postsTableView.register(cellXib, forCellReuseIdentifier: cellId)
        postsTableView.dataSource = self
    }
    // Move to screen where we add data to post
    @IBAction func plusButtonAction(_ sender: Any) {
        let nextViewController = AddPostViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Sets height of Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;//Choose your custom row height
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

