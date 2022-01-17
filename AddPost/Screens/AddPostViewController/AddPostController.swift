//
//  AddPostController.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import UIKit

class AddPostController: NSObject {
    // giving AddPostViewController to class
    weak var addPostViewController: AddPostViewController?
    // giving access to AddPostViewController
    init(addPostViewController: AddPostViewController) {
        self.addPostViewController = addPostViewController
    }
    // creating reference to manipulate views from ViewController
    var enterTextField: UITextField? {
        return addPostViewController?.enterTextField
    }
    var pickedImageView: UIImageView? {
        return addPostViewController?.pickedImageView
    }
    // Initializing post interactor
    private let addPostInteractor = AddPostIntercator()
    
    // adding action to button in AddPostViewController
    func saveButtonAction(timePosted: TimeInterval?, textPosted: String?, pickedImage: UIImage?) {
        guard let textPosted = textPosted,
              let timePosted = timePosted,
              let pickedImage = pickedImage
        else {return}
        // Calling method we defined in interactor to upload image and save data on server
        addPostInteractor.uploadAndSend(timePosted: timePosted, textPosted: textPosted, pickedImage: pickedImage)
        addPostViewController?.navigationController?.popViewController(animated: true)
    }
    
    func pickPhotoButtonAction() {
        let picker = UIImagePickerController()
        // can also select camera
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        addPostViewController?.present(picker, animated: true)
    }
    
    func viewDidLoad() {
        enterTextField?.delegate = self
    }
    // functions for imagePicker
    // Allows us to retire picker and set image to view when we done choosing
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        pickedImageView?.image = image
    }
    // Retires picker when we cancel without picking image
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
// Creating extensions to apply delegates we need for ViewController
extension AddPostController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
// Extensions for imageView Picker
// Note: Make sure Controller class has these extensions in order for picker to work
extension AddPostController: UIImagePickerControllerDelegate {
    
}
extension AddPostController: UINavigationControllerDelegate {
    
}
