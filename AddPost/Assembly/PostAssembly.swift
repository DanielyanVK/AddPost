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
    
    init(firestoreService: FirestoreService, postDataProvidable: PostDataProvidable) {
        self.firestoreService = firestoreService
        self.postDataProvidable = postDataProvidable
    }
 
    
    func assembly() -> PostViewController? {
      let vc = PostViewController()
      let presenter = PostPresenter()
      let interactor = PostInteractor(dataProvider: postDataProvidable)
      let dataSource = PostDataSource(dataProvider: postDataProvidable)
      let dataProvider = postDataProvidable

      vc.presenter = presenter
      presenter.view = vc
      presenter.interactor = interactor
      presenter.dataSource = dataSource
      presenter.dataProvider = dataProvider

      interactor.firestoreService = firestoreService
      return vc
    }
}
