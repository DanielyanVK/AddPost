//
//  PostDataSource.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation
import UIKit

class PostDataSource: NSObject, UITableViewDataSource {
    var dataProvider: PostDataProvidable
    init (dataProvider: PostDataProvidable) {
        self.dataProvider = dataProvider
    }
    // Defining tableView functions here
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = dataProvider.getPost(by: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.update(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataProvider.numberOfSections()
    }
}
