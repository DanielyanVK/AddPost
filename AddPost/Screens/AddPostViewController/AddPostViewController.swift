//
//  AddPostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet weak var pickedImageView: UIImageView!
    
    // Assigning controller to ViewController
    private lazy var controller: AddPostController = AddPostController(addPostViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.viewDidLoad()
    }
    
    @IBAction func pickPhotoButtonAction(_ sender: Any) {
        controller.pickPhotoButtonAction()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let timePosted = Date().timeIntervalSince1970
        let textPosted = enterTextField.text
        let pickedImage = pickedImageView.image
        // calling function from controller
        controller.saveButtonAction(timePosted: timePosted, textPosted: textPosted, pickedImage: pickedImage)
    }
}
