//
//  ViewController.swift
//  DDay
//
//  Created by 전율 on 9/23/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .eventDidInsert, object: nil, queue: .main) { _ in
            self.eventTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell        
        let target = events[indexPath.row]
        cell.iconImageView.image = target.iconImage
        cell.titleLabel.text = target.title
        cell.dateLabel.text = target.dateString
        cell.DaysLabel.text = target.daysString
        cell.containerView.backgroundColor = target.backgroundColor
        cell.titleLabel.textColor = target.textColor
        cell.DaysLabel.textColor = target.textColor
        cell.dateLabel.textColor = target.textColor
        return cell
    }
    
}

