//
//  ViewController.swift
//  DDay
//
//  Created by 전율 on 9/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    var sortedEvents = [Event]()
    var sortType: SortType {
        let type = UserDefaults.standard.integer(forKey: "sortType")
        return SortType(rawValue: type) ?? .futureFirst
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        NotificationCenter.default.addObserver(forName: .eventDidInsert, object: nil, queue: .main) { _ in
            self.eventTableView.reloadData()
        }
    }
    
    @IBAction func toggleSort(_ sender: Any) {
        sortType.toggle()
        refresh()
    }
    
    func refresh(){
        switch sortType {
        case .futureFirst:
            sortedEvents = events.sorted { $0.dayLeft > $1.dayLeft }
        case .pastFirst:
            sortedEvents = events.sorted { $0.dayLeft < $1.dayLeft }
        }
        eventTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        let target = sortedEvents[indexPath.row]
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

