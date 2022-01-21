//
//  PostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    // Assigning presenter to ViewController
    private lazy var presenter: PostPresenter = PostPresenter(postViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    // Move to screen where we add data to post
    @IBAction func plusButtonAction(_ sender: Any) {
        presenter.plusButtonAction()
    }
}

