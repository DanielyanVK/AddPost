//
//  AddPostAssembly.swift
//  AddPost
//
//  Created by Vladislav on 23.01.2022.
//
import UIKit
import Swinject

class AddPostAssembly {
   
    private let fireStoreService: FirestoreService
    private let fireStorageService: FireStorageService
    
    init(fireStoreService: FirestoreService, fireStorageService: FireStorageService) {
        self.fireStoreService = fireStoreService
        self.fireStorageService = fireStorageService
    }
 
    
    func assembly() -> AddPostViewController? {
      let vc = AddPostViewController()
      let presenter = AddPostPresenter()
      let interactor = AddPostIntercator(firestoreService: fireStoreService, fireStroageService: fireStorageService)
      

      vc.presenter = presenter
      presenter.view = vc
      presenter.interactor = interactor
      
      return vc
    }
}
