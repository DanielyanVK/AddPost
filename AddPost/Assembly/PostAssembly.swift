//
//  PostAssembly.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import UIKit
import Swinject

// In Assembly classes we build our view controllers like a construcor
class PostAssembly {
    // first we create references to all componens that we'll need in init
    private let firestoreService: FirestoreService
    private let postDataProvidable: PostDataProvidable
    private let mainContainer: MainContainer
    private let addPostRouter: AddPostRouter
    
    init(firestoreService: FirestoreService, postDataProvidable: PostDataProvidable, mainContainer: MainContainer, addPostRouter: AddPostRouter) {
        self.firestoreService = firestoreService
        self.postDataProvidable = postDataProvidable
        self.mainContainer = mainContainer
        self.addPostRouter = addPostRouter
    }
    
    // method to assembly PostViewController.
    // here we initialize everything we need for it to function properly and return ViewController
    func assembly() -> PostViewController? {
        let vc = PostViewController()
        let presenter = PostPresenter()
        let interactor = PostInteractor(dataProvider: postDataProvidable)
        let dataSource = PostDataSource(dataProvider: postDataProvidable)
        let dataProvider = postDataProvidable
        let router = addPostRouter
        
    // assigning initialized values (this helps to create connections between elements)
    // 1. Dependencies for ViewController
        vc.presenter = presenter
    // 2. Dependencies for Presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.dataSource = dataSource
        presenter.dataProvider = dataProvider
        presenter.router = router
    // 3. Dependencies for Interactor
        interactor.firestoreService = firestoreService
        return vc
    }
}
