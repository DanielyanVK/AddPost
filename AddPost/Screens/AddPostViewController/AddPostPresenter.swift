//
//  AddPostController.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import UIKit

class AddPostPresenter: NSObject {
    // referencing dependencies (for more info look at PostPresenter)
    weak var view: AddPostViewController?
    var interactor: AddPostIntercator?
    
    // creating var to manipulate textfield within this class
    var enterTextField: UITextField? {
        return view?.enterTextField
    }
    var pickedImageView: UIImageView? {
        return view?.pickedImageView
    }
    
    // adding action to button in AddPostViewController
    func saveButtonAction(timePosted: TimeInterval?, textPosted: String?, pickedImage: UIImage?) {
        guard let textPosted = textPosted,
              let timePosted = timePosted,
              let pickedImage = pickedImage
        else {return}
        // Calling method we defined in interactor to upload image and save data on server
        interactor?.uploadAndSend(timePosted: timePosted, textPosted: textPosted, pickedImage: pickedImage)
        view?.navigationController?.popViewController(animated: true)
    }
    
    func pickPhotoButtonAction() {
        let picker = UIImagePickerController()
        // can also select camera
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        view?.present(picker, animated: true)
    }
    
    func viewDidLoad() {
        enterTextField?.delegate = self
    }
    // methods for imagePicker
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
extension AddPostPresenter: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
// Extensions for imageView Picker
// Note: Make sure Controller class has these extensions in order for picker to work
extension AddPostPresenter: UIImagePickerControllerDelegate {
    
}
extension AddPostPresenter: UINavigationControllerDelegate {
    
}
