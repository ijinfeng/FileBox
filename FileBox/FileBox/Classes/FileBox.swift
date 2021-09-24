//
//  FileBox.swift
//  FileBox
//
//  Created by jinfeng on 2021/9/24.
//

import UIKit

public class FileBox: NSObject {
    
    public static  let `default` = FileBox()
    
    public var currentNode: FileNode?
    
    public func open() {
        let window = UIApplication.shared.windows.first!
        if let root = window.rootViewController {
            let navi = UINavigationController(rootViewController: FileBoxTableViewController())
            root.present(navi, animated: true, completion: nil)
        }
    }
    
    public func openRecently() {
        
    }
}

extension FileBox {
    public static func sandBoxPath() -> String {
        NSSearchPathForDirectoriesInDomains(.userDirectory, .userDomainMask, true).first ?? ""
    }
}
