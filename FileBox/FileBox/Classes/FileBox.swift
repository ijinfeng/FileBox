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
    
    public func open(dir path: String = FileBox.sandBoxPath()) {
        let window = UIApplication.shared.windows.first!
        if let root = window.rootViewController {
            let vc = FileBoxTableViewController()
            vc.fileNode = FileNode(path: path)
            let navi = UINavigationController(rootViewController: vc)
            root.present(navi, animated: true, completion: nil)
        }
    }
    
    public func openRecently() {
        
    }
}

extension FileBox {
    public static func mainBundlePath() -> String {
        Bundle.main.bundlePath
    }
    
    public static func sandBoxPath() -> String {
        NSHomeDirectory()
    }
    
    public static func documentPath() -> String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
    }
    
    public static func libraryPath() -> String {
        NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? ""
    }
    
    public static func cachePath() -> String {
        NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
    }
    
    public static func tempPath() -> String {
        NSTemporaryDirectory()
    }
}
