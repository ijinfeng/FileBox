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
        
        
//        let fileManager = FileManager.default
//
//        let bundlePath = Bundle.main
//
//        
//        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        
//        let audio = URL(fileURLWithPath: bundlePath.path(forResource: "大庆小芳 - 老公赚钱老婆花", ofType: "mp3") ?? "")
//        let video = URL(fileURLWithPath: bundlePath.path(forResource: "直播间-下单动效", ofType: "MP4") ?? "")
//        let file = URL(fileURLWithPath: bundlePath.path(forResource: "Runloop", ofType: "pdf") ?? "")
//        let image = URL(fileURLWithPath: bundlePath.path(forResource: "1", ofType: "png") ?? "")
//
//        try? fileManager.copyItem(at: audio, to: URL(fileURLWithPath: cachePath + "/audio.mp3"))
//        try? fileManager.copyItem(at: video, to: URL(fileURLWithPath: cachePath + "/video.mp4"))
//        try? fileManager.copyItem(at: file, to: URL(fileURLWithPath: cachePath + "/file.pdf"))
//        try? fileManager.copyItem(at: image, to: URL(fileURLWithPath: cachePath + "/image.png"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        FileBox.default.openRecently(dir: FileBox.cachePath())
    }
}

