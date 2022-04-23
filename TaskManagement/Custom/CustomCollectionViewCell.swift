//
//  CustomCollectionViewCell.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 18.04.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.cornerRadius = 10
            view.backgroundColor = .systemGray
        }
    }
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var dayNumber: UILabel!
    
    func configuartion(with day: Date) {
        view.backgroundColor = SupportManager.isCurrentDay(day: day) ? .systemGray6 : .systemGray
        
        dayName.text = SupportManager.extaractDate(date: day, format: "EEE")
        dayNumber.text = SupportManager.extaractDate(date: day, format: "dd")
    }
}
