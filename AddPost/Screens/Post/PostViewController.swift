//
//  PostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    // Assigning controller to ViewController
    private lazy var controller: PostController = PostController(postViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.viewDidLoad()
    }
    // Move to screen where we add data to post
    @IBAction func plusButtonAction(_ sender: Any) {
        controller.plusButtonAction()
    }
}

