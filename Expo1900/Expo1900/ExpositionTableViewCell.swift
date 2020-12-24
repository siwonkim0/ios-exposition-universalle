//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/22.
//

import Foundation
import UIKit

class ExpositionTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var koreaItemImageView: UIImageView!
    var index: Int?
    
    func setDynamicType() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.adjustsFontSizeToFitWidth = true
    }
}
