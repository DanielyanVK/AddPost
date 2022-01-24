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
    
    // Assigning presenter to ViewController
    var presenter: AddPostPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func pickPhotoButtonAction(_ sender: Any) {
        presenter?.pickPhotoButtonAction()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let timePosted = Date().timeIntervalSince1970
        let textPosted = enterTextField.text
        let pickedImage = pickedImageView.image
        // calling function from presenter
        presenter?.saveButtonAction(timePosted: timePosted, textPosted: textPosted, pickedImage: pickedImage)
    }
}
