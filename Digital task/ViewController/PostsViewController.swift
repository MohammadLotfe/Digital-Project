//
//  PostsViewController.swift
//  Digital task
//
//  Created by mohmmadlotfe on 22/08/2023.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.registerCell(id:PostTableViewCell.self)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private var postRespons:[PostsModel] = []
    private var dataToReturn:[PostsModel] = []
    private var refreshControl: UIRefreshControl?
    
    private var firstIndex = 0
    private var secondIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDate()
        setupUI()
        setRefreshControl()
    }
    private func setupUI(){
        self.title = "Post"
    }
    
    //MARK: - Fetch Data using URLSession.
    
    private func fetchDate(){
        self.ShowLoading(status:Show, View: self.view)
        let task = URLSession.shared.dataTask(with: API.post.url ){
            data, response, error in
            let decoder = JSONDecoder()
            DispatchQueue.main.async {
                if let data = data{
                    do{
                        let tasks = try decoder.decode([PostsModel].self, from: data)
                        self.postRespons = tasks
                        self.dataToReturn = Array(self.postRespons.dropLast(80))
                        self.firstIndex = self.dataToReturn.count - 1
                        self.secondIndex = self.firstIndex + 20
                        self.tableView.reloadData()
                        self.refreshControl?.endRefreshing()
                        self.ShowLoading(status:Hide, View: self.view)
                    }catch{
                        self.ShowNotfication(Status:Failed, Body:error.localizedDescription)
                        self.ShowLoading(status:Hide, View: self.view)
                    }
                }
            }
        }
        task.resume()
    }
    
    //MARK: - Refresh Control
    private func setRefreshControl(){
        self.refreshControl = UIRefreshControl()
        self.tableView.refreshControl =  self.refreshControl
        self.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc private func refreshData(){
        dataToReturn = []
        postRespons = []
        tableView.reloadData()
        fetchDate()
    }
    
    //MARK: - Enable pagination
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            let currentOffset = scrollView.contentOffset.y
            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
            if (maximumOffset - currentOffset <= 0.0) {
                for i in firstIndex + 1...secondIndex where secondIndex < postRespons.count {
                    firstIndex += 1
                    dataToReturn.append(postRespons[i])
                }
                secondIndex += 20
                tableView.reloadData()
            }
        }
    }
    
}

//MARK: - tableView delegate
extension PostsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToReturn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PostTableViewCell = tableView.dequeueTVCell()
        cell.postTitle.text = dataToReturn[indexPath.row].title
        cell.postBody.text = dataToReturn[indexPath.row].body
        cell.id.text = dataToReturn[indexPath.row].id?.toString
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen:PostDetailsViewController = UIStoryboard.instanceFromMain()
        screen.PTitle = dataToReturn[indexPath.row].title ?? ""
        screen.PDescription = dataToReturn[indexPath.row].body ?? ""
        self.pushVC(screen)
    }
}
