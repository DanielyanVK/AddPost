//
//  PostAssembly.swift
//  AddPost
//
//  Created by Vladislav on 21.01.2022.
//

import UIKit
import Swinject

class PostAssembly {
   
    private let firestoreService: FirestoreService
    private let postDataProvidable: PostDataProvidable
    private let mainContainer: MainContainer
    private let postRoutable: PostRoutable
    
    init(firestoreService: FirestoreService, postDataProvidable: PostDataProvidable, mainContainer: MainContainer, postRoutable: PostRoutable) {
        self.firestoreService = firestoreService
        self.postDataProvidable = postDataProvidable
        self.mainContainer = mainContainer
        self.postRoutable = postRoutable
    }
 
    
    func assembly() -> PostViewController? {
      let vc = PostViewController()
      let presenter = PostPresenter()
      let interactor = PostInteractor(dataProvider: postDataProvidable)
      let dataSource = PostDataSource(dataProvider: postDataProvidable)
      let dataProvider = postDataProvidable
      let router = postRoutable

      vc.presenter = presenter
      presenter.view = vc
      presenter.interactor = interactor
      presenter.dataSource = dataSource
      presenter.dataProvider = dataProvider
      presenter.router = router
      // need to provide router for presenter

      interactor.firestoreService = firestoreService
      return vc
    }
}
