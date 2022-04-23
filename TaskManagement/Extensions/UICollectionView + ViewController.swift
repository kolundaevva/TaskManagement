//
//  UICollectionView + ViewController.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 18.04.2022.
//

import UIKit

extension TaskViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        
        let day = currentWeek[indexPath.row]
        cell.configuartion(with: day)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGFloat((self.view.frame.width - 10) / 7) - 10
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { fatalError() }
        cell.view.backgroundColor = .systemGray6
        SupportManager.currentDay = currentWeek[indexPath.row]
        //Попробовать добавить анимацию перехода
        collectionView.reloadData()
        filter()
    }
    
    func filter() {
        filtredTasks = tasks.filter("time >= %@ AND time <= %@", SupportManager.startOfTheDay(), SupportManager.endOfTheDay())
        
        sorting()
        tableView.reloadData()
    }
    
    func sorting() {
        filtredTasks = filtredTasks.sorted(byKeyPath: "time", ascending: true)
    }
}
