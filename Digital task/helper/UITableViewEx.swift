//
//  UITableViewEx.swift
//  Digital task
//
//  Created by mohmmadlotfeon 22/08/2023.
//

import Foundation
import UIKit

extension UITableView{
    func dequeueTVCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Could not locate viewcontroller with identifier \(String(describing: T.self)) in storyboard.")
        }
        return cell
    }
    
    func registerCell(id: UITableViewCell.Type) {
        let _id = String(describing: id)
        self.register(UINib(nibName: _id, bundle: nil), forCellReuseIdentifier: _id)
    }
}

extension Int {
    var toString: String {
        return "\(self)"
    }
}
