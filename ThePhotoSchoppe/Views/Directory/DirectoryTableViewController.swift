//
//  DirectoryTableViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class DirectoryTableViewController: UITableViewController {

    fileprivate var directory = [Photographer]()
    private var viewModel = DirectoryViewModel()

    var headerview : UIView!
    var newHeaderLayer : CAShapeLayer!
    
    private let headerheight : CGFloat = 250.0
    private let headercut : CGFloat = 50.0
    private let cellHeight : CGFloat = 138.0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateView()
    }
    
    //If there are table view controllers more than one, and need to hide nav bars time to time we can use a BaseTableViewController and keep these methods as common
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getAllPhotographers(callback: self)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func updateView() {
        tableView.backgroundColor = UIColor.white
        headerview = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = cellHeight
        tableView.addSubview(headerview)
        
        newHeaderLayer = CAShapeLayer()
        newHeaderLayer.fillColor = UIColor.black.cgColor
        headerview.layer.mask = newHeaderLayer
        
        let newheight = headerheight - headercut / 2
        tableView.contentInset = UIEdgeInsets(top: newheight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -newheight)
        
        self.setupNewView()
    }
    
    func setupNewView() {
        let newheight = headerheight - headercut / 2
        var getheaderframe = CGRect(x: 0, y: -newheight, width: tableView.bounds.width, height: headerheight)
        if tableView.contentOffset.y < newheight {
            getheaderframe.origin.y = tableView.contentOffset.y
            getheaderframe.size.height = -tableView.contentOffset.y + headercut / 2
        }
        
        headerview.frame = getheaderframe
        let cutdirection = UIBezierPath()
        cutdirection.move(to: CGPoint(x: 0, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: 0))
        cutdirection.addLine(to: CGPoint(x: getheaderframe.width, y: getheaderframe.height))
        cutdirection.addLine(to: CGPoint(x: 0, y: getheaderframe.height - headercut))
        newHeaderLayer.path = cutdirection.cgPath
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tableView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.setupNewView()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.DirectoryTableViewCell, for: indexPath) as! DirectoryTableViewCell
        cell.setObject(photographer: directory[indexPath.row])
        return cell
    }

}

extension DirectoryTableViewController : UIGetDirectoryDelegate {
    
    func onGetDirectorySuccess(photographers: [Photographer]) {
        directory = photographers
        tableView.reloadData()
    }
    
    func onGetDirectoryFailed(reason: String) {
        
    }
    
}
