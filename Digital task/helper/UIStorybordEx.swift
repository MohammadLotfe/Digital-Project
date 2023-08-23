//
//  UIStorybordEx.swift
//  Digital task
//
//  Created by mohmmadlotfe on 23/08/2023.
//

import Foundation
import UIKit

enum Storyboard : String {
    
    case main = "Main"
}

extension UIStoryboard {

    static func instanceFromMain<T: UIViewController>() -> T {
        return load(from: .main, identifier: String(describing: T.self)) as! T
    }
    // ... or use the main loading method directly when
    // instantiating view controller from a specific storyboard
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}
