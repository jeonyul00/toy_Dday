//
//  ComposeViewController.swift
//  DDay
//
//  Created by 전율 on 9/26/24.
//

import UIKit

class ComposeViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemTeal,
        .systemIndigo,
        .systemGray,
        .black,
        .white
    ]

    @IBOutlet weak var backgroundColorCollectionView: UICollectionView!
    @IBOutlet weak var textColorCollectionView: UICollectionView!
    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        
    }
        
}


extension ComposeViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ColorCollectionViewCell.self), for: indexPath) as! ColorCollectionViewCell
        
        if indexPath.item == colors.count {
            cell.colorImageView.image = UIImage(named: "color-wheel")
            cell.colorImageView.tintColor = nil
        } else {
            let target = colors[indexPath.row]
            cell.colorImageView.image = UIImage(named: "color-wheel")?.withRenderingMode(.alwaysTemplate)
            cell.colorImageView.tintColor = target
        }
        return cell
    }    
    
}
