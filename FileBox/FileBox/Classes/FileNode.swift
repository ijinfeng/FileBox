//
//  FileNode.swift
//  FileNode
//
//  Created by jinfeng on 2021/9/24.
//

import UIKit

private let imageExt = ["jpg", "jpeg", "png", "webp"]
private let videoExt = ["mov", "avi", "mpg", "vob", "mkv", "rm", "rmvb", "mp4"]
private let audioExt = ["pcm","wav", "aac", "mp3", "ogg"]

public class FileNode: NSObject {
    
    var head: FileNode?
    var next: FileNode?
    
    public private(set) var path: String!
    
    public private(set) var name: String!
    
    public private(set) var isDir: Bool!
    
    public private(set) var type: FileType!
    
    public private(set) var size: UInt64!
    
    private var attribute: [FileAttributeKey: Any]!
    
    public private(set) var nodes: [FileNode] = []
    
    convenience public init(path: String) {
        self.init(path: path, node: .file)
    }
    
    convenience public init(actionNode path: String) {
        self.init(path: path, node: .action)
    }
    
    private init(path: String, node: NodeType) {
        self.path = path
        
        let URL = URL(string: path)
        let extname = URL?.pathExtension.lowercased() ?? ""
        
        let fileManager = FileManager.default
        self.name = fileManager.displayName(atPath: path)
        
        if let attribute = try? fileManager.attributesOfItem(atPath: path) {
            self.attribute = attribute
            if let type = attribute[FileAttributeKey.type] as? FileAttributeType {
                if type == FileAttributeType.typeDirectory {
                    self.isDir = true
                    self.type = .dir
                } else {
                    self.isDir = false
                    if imageExt.contains(extname) {
                        self.type = .image
                    } else if videoExt.contains(extname) {
                        self.type = .video
                    } else if audioExt.contains(extname) {
                        self.type = .audio
                    } else {
                        self.type = .file
                    }
                }
            } else {
                self.isDir = false
                self.type = .unknown
            }
            if let size = attribute[FileAttributeKey.size] as? UInt64 {
                self.size = size
            } else {
                self.size = 0
            }
        } else {
            self.attribute = [:]
            self.size = 0
            self.isDir = false
            self.type = .unknown
        }
        super.init()
        
        self.nodes = refreshNodes()
    }
}

extension FileNode {
    public enum FileType {
        case unknown
        case dir
        case image
        case video
        case audio
        case file
    }
    
    public enum NodeType {
        case file
        case action
    }
}



extension FileNode {
    func fileSize() -> String {
        var size = self.size!
        if size < 1024 {
            return "\(size)B"
        }
        size /= 1024
        if size < 1024 {
            return "\(size)KB"
        }
        size /= 1024
        if size < 1024 {
            return "\(size)M"
        } else {
            return "\(size/1024)G"
        }
    }
    
    func refreshNodes() -> [FileNode] {
        if let contents = try? FileManager.default.contentsOfDirectory(atPath: path) {
            var nodes: [FileNode] = []
            for content in contents {
                let node = FileNode(path: content)
                nodes.append(node)
            }
            return nodes
        } else {
            return []
        }
    }
}
