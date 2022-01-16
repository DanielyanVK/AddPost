//
//  AddPostViewController.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import Firebase

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak private var enterTextField: UITextField!
    @IBOutlet weak private var pickedImageView: UIImageView!
  
    // Assigning controller to ViewController
    private lazy var controller: AddPostController = AddPostController(addPostViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // basic delegate assignment
        enterTextField.delegate = self
    }
    
    // Note: Make sure ViewController class conforms to UIImagePickerControllerDelegate, UINavigationControllerDelegate
    // Assigning action for Pick Photo Button
    @IBAction func pickPhotoButtonAction(_ sender: Any) {
        let picker = UIImagePickerController()
        // can also select camera
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let timePosted = Date().timeIntervalSince1970
        let textPosted = enterTextField.text
        let pickedImage = pickedImageView.image
        // calling function from controller
        controller.saveButtonAction(timePosted: timePosted, textPosted: textPosted, pickedImage: pickedImage)
    }
    
    // Functions for Picker
    // User finished picking photo.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        pickedImageView.image = image
    }
    // Close picker when User cancels it
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
// Extension to resign keyboard with "return" button
extension AddPostViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
