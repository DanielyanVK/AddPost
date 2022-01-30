//
//  AddPostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class AddPostViewController: UIViewController, AddPostViewInput {
    
    @IBOutlet private weak var enterTextField: UITextField!
    @IBOutlet private weak var pickedImageView: UIImageView!
    
    // Accesing ViewController -> Presenter connection
    var output: AddPostViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterTextField.delegate = self
        output?.viewDidLoad()
    }
    
    @IBAction func pickPhotoButtonAction(_ sender: Any) {
        output?.pickPhotoButtonAction()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let timePosted = Date().timeIntervalSince1970
        let textPosted = enterTextField.text
        let pickedImage = pickedImageView.image
        // calling function from presenter
        output?.saveButtonAction(timePosted: timePosted, textPosted: textPosted, pickedImage: pickedImage)
    }
    
    func didPickImage(image: UIImage) {
        pickedImageView.image = image
    }
    
    func close() {
        navigationController?.popViewController(animated: true)
    }
    
    func show(picker: UIImagePickerController) {
        present(picker, animated: true, completion: nil)
    }
    
    
}

// Creating extensions to apply delegates we need for ViewController
extension AddPostViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
