//
//  PostCollectionViewCell.swift
//  LinkedIn
//
//  Created by TDI Student on 24.8.23.
//

import UIKit
// Post collection view cell is used to initialize this with posts object data
class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var userProfession: UILabel!
    @IBOutlet weak var Username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
