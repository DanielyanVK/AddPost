//
//  PostCell.swift
//  AddPost
//
//  Created by Vladislav on 04.01.2022.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var CellsImageView: UIImageView!
    @IBOutlet weak var CellsLabel: UILabel!
    
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
        // converting url to Data
        let data = try? Data(contentsOf: url!)
        // Setting label's text from model
        CellsLabel.text = model.textPosted
        // converting data in to UI Image to set it in our cell
        CellsImageView.image = UIImage(data: data!)
    }
}
