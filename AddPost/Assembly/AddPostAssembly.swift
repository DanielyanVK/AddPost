//
//  AddPostAssembly.swift
//  AddPost
//
//  Created by Vladislav on 23.01.2022.
//
import UIKit
import Swinject

// Same assembly process I've described in PostAssembly
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
        
        vc.output = presenter
        presenter.view = vc
        presenter.interactor = interactor
        
        return vc
    }
}
