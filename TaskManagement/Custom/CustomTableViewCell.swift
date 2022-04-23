//
//  CustomTableViewCell.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 18.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var checkmark: UIImageView!
    
    func configuration(with task: Task) {
        titleLabel.text = task.title
        descriptionLabel.text = task.definition
        timeLabel.text = SupportManager.extaractDate(date: task.time, format: "h:mm a")
        checkmark.image = UIImage(systemName: task.isDone ? "checkmark.circle" : "circle")
    }
}
