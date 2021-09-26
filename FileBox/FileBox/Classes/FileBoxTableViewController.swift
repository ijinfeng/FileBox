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
    
    var rootFileNode: FileNode!
    var topFileNode: FileNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fileNode == nil {
            fileNode = FileNode(path: FileBox.sandBoxPath())
        }

        if let node = fileNode {
            rootFileNode = FileNode(actionNode: node.path, action: .root)
            topFileNode = FileNode(actionNode: node.path.topFilePath(), action: .top)
        }
        
        self.fileNodes = fileNode?.refreshNodes() ?? []
        
        navigationItem.title = fileNode?.name ?? ""
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.create(named: "icon_close")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onClickBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.create(named: "icon_refresh")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onRefresh))
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        tableView.register(TextCell.self, forCellReuseIdentifier: "text")
        tableView.register(DisplayFileCell.self, forCellReuseIdentifier: "display")
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                navigationController?.popToRootViewController(animated: true)
                FileBox.default.resetRootNode()
            } else {
                navigationController?.popViewController(animated: true)
                FileBox.default.removeLastNode()
            }
        } else {
            let fileNode = self.fileNodes[indexPath.row]
            if fileNode.isDir {
                
                FileBox.default.add(new: fileNode)
                
                let vc = FileBoxTableViewController()
                vc.fileNode = fileNode
                navigationController?.pushViewController(vc, animated: true)
            } else {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        } else {
            return 60
        }
    }
}

extension FileBoxTableViewController {
    @objc func onClickBack() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func onRefresh() {
        guard let node = fileNode else {
            return
        }
        self.fileNodes = node.refreshNodes()
        self.tableView.reloadData()
    }
}
