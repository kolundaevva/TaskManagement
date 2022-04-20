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
    
    func configuration(with task: Task) {
        titleLabel.text = task.taskTitle
        descriptionLabel.text = task.taskDescription
        timeLabel.text = SupportManager.extaractDate(date: task.taskTime, format: "h:mm")
    }
}
