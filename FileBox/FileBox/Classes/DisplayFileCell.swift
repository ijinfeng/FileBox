//
//  DisplayFileCell.swift
//  DisplayFileCell
//
//  Created by jinfeng on 2021/9/24.
//

import UIKit
import SnapKit

class DisplayFileCell: UITableViewCell {

    private let icon: UIImageView = {
       let img = UIImageView()
        img.backgroundColor = .clear
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let label: UILabel = {
       let l = UILabel()
        l.textColor = .black
        l.font = .systemFont(ofSize: 16)
        return l
    }()
    
    var fileNode: FileNode? {
        didSet {
            label.text = fileNode?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(icon.snp_right).offset(15)
            make.centerY.equalTo(contentView)
            make.right.lessThanOrEqualTo(-12)
        }
        
        contentView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
