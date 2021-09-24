//
//  ViewController.swift
//  FileBox
//
//  Created by ijinfeng on 09/24/2021.
//  Copyright (c) 2021 ijinfeng. All rights reserved.
//

import UIKit
import FileBox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        let data = "Do any additional setup after loading the view, typically from a nib.".data(using: .utf8)
        try? data!.write(to: URL(string: path! + "/string.data.txt")!)
        
        let node = FileNode(path: path!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        FileBox.default.open()
    }
}

