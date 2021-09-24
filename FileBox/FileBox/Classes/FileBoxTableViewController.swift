//
//  FileBoxTableViewController.swift
//  FileBoxTableViewController
//
//  Created by jinfeng on 2021/9/24.
//

import UIKit

class FileBoxTableViewController: UITableViewController {
    
    var fileNode: FileNode?
    
    var fileNodes: [FileNode] = []
    
    let rootFileNode = FileNode(path: ".")
    let topFileNode = FileNode(path: "..")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fileNode == nil {
            fileNode = FileNode(path: FileBox.sandBoxPath())
        }

        self.fileNodes = fileNode?.refreshNodes()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .rewind, target: self, action: #selector(onClickBack))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(onRefresh))
        
        
        tableView.rowHeight = 40
        tableView.register(TextCell.Type, forCellReuseIdentifier: "text")
        tableView.register(DisplayFileCell.Type, forCellReuseIdentifier: "display")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }
        return self.fileNodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! TextCell
            if indexPath.row == 0 {
                cell.fileNode = rootFileNode
            } else {
                cell.fileNode = topFileNode
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "display", for: indexPath) as! DisplayFileCell
            let fileNode = self.fileNodes[indexPath.row]
            cell.fileNode = fileNode
            return cell
        }
    }
}

extension FileBoxTableViewController {
    @objc func onClickBack() {
        if (navigationController?.viewControllers.count ?? 0) <= 1 {
            navigationController?.dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func onRefresh() {
        guard let node = fileNode else {
            return
        }
        self.fileNodes = node.refreshNodes()
        self.tableView.reloadData()
    }
}
