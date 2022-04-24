//
//  TaskViewController.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 16.04.2022.
//

import UIKit
import RealmSwift

class TaskViewController: UIViewController {

    var tasks: Results<Task>!
    var filtredTasks: Results<Task>!
    
    @IBOutlet weak var collectionVew: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let currentWeek = SupportManager.fetchCurrentWeek()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SupportManager.fetchCurrentWeek())
        tasks = realm.objects(Task.self)
        self.collectionVew.delegate = self
        self.collectionVew.dataSource = self
        filter()
    }

    @IBAction func addTaskPressed(_ sender: UIBarButtonItem) {}
    
    @IBAction func cancelPressed(_ segue: UIStoryboardSegue) {
        guard let newTaskVC = segue.source as? NewTaskViewController else { return }
        
        newTaskVC.saveTask()
        tableView.reloadData()
    }
}

