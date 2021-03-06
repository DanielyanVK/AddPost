//
//  PostCell.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit
import Kingfisher

class PostCell: UITableViewCell {
    @IBOutlet weak private var cellsImageView: UIImageView!
    @IBOutlet weak private var cellsLabel: UILabel!
    @IBOutlet weak private var cellsTimePostedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // Method to manage how I display data from given model
    func update (with model: PostModel) {
        // getting url from our model (after it uploads to Firebase Storage)
        let url = URL(string: model.imageSource)
        // Converting Timestamp value from model to Date value
        let unformattedDate = Date(timeIntervalSince1970: model.timePosted)
        // Using calender extension to return a string "Posted (time) ago"
        let postTime = unformattedDate.calenderTimeSinceNow()
        
        cellsLabel.text = model.textPosted
        // Setting image with Kingfisher
        cellsImageView.kf.setImage(with: url)
        cellsTimePostedLabel.text = "Posted \(postTime)"
    }
    
}
