//
//  EventTableViewCell.swift
//  DDay
//
//  Created by 전율 on 9/25/24.
//

import UIKit

class EventTableViewCell: UITableViewCell {
        
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var DaysLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
                
    /// 셀 초기화 코드 중 단 한번만 실행
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
