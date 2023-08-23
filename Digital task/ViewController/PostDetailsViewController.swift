//
//  PostDetailsViewController.swift
//  Digital task
//
//  Created by roya TV on 23/08/2023.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    
    var PTitle:String = ""
    var PDescription:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI(){
        self.title = "Post details"
        postTitle.text = PTitle
        postDescription.text = PDescription
    }
    
    
    
}
