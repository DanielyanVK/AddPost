//
//  AddPostConnections.swift
//  AddPost
//
//  Created by Vladislav on 30.01.2022.
//

import UIKit

// Defines what view will output to other elements of the model.
// In our example it defines how exactly we will implement some methods from view in our presenter so it's ViewController -> Presenter connection
protocol AddPostViewOutput {
    func viewDidLoad()
    func pickPhotoButtonAction()
    func saveButtonAction(timePosted: TimeInterval?, textPosted: String?, pickedImage: UIImage?)
}

// Presenter -> ViewController connection
protocol AddPostViewInput: AnyObject {
    func didPickImage(image: UIImage)
    func close()
    func show(picker: UIImagePickerController)
}

// Interactor -> Presenter connection
protocol AddPostInteractorInput {
    func uploadAndSend(timePosted: TimeInterval, textPosted: String, pickedImage: UIImage)
}
