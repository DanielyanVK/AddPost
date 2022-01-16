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
        
    }
}

extension AddPostController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
