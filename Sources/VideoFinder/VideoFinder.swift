
import Files
import ShellOut
enum FindError: Error {
    case MovieNotFound
}
final class TreeNode<Value> {
    weak var parent: TreeNode<Value>?
    var children: [TreeNode<Value>] = []
    var value: Value
    init(value: Value) {
        self.value = value
    }
    
}
final class Video {
    public var videoFolderPaths = [String]()
    public  var videoFolders: [Folder] {
        get {
           try! videoFolderPaths.map { path in
                try Folder(path: path)
            }
        }
    }
    /// Default is VLC
    /// (Which is in Applications)
    var pathToVideoPlayerCommand = "/Applications/VLC.app/Contents/MacOS/VLC"
    func launchVideo(name: String ) throws {
        for videoFolder in videoFolders {
            if let video = videoFolder.findFile(name) {
                try shellOut(to: "\(pathToVideoPlayerCommand) \(video.path)")
            }
        }
        throw FindError.MovieNotFound
    }
}
/*
Folder.home.subfolders.recursive
protocol FolderOrFile {
    func hasAFile(named: String) -> Bool
    func named() -> String
    var isADir: Bool {get}
}
extension Folder: FolderOrFile {
    func hasAFile(named: String) -> Bool {
        containsFile(named: named)
    }
    func named() -> String {
        return self.name
    }
    let isADir: Bool = true
}
extension File: FolderOrFile {
    func hasAFile(named: String) -> Bool {
        return false
    }
    func named() -> String {
        return self.name
    }
     let isADir: Bool = false
}
extension Folder {
    typealias DirectoryTree = TreeNode<FolderOrFile>
    var tree: TreeNode<FolderOrFile> {
        var tree = TreeNode<FolderOrFile>(value: self)
        tree.children.append(contentsOf: files.map {TreeNode<FolderOrFile>(value: $0 )
        })
        tree.children.append(contentsOf: subfolders.map {TreeNode<FolderOrFile>(value: $0 )
               })
        func extract(_ tree: inout DirectoryTree, _ children: [TreeNode<FolderOrFile>]){
            for thing in children {
                if thing.value.isADir {
                    
                    extract(&tree, thing.children)
                } else {
                    
                }
            }
        }
        
  }
}

*/
extension Folder {
    func findFile(_ named: String) -> File? {
        for file in self.files.recursive {
            if file.name == named {
               return file
            }
        }
        return nil
    }
    func findFilNameWithNear(name: String) -> String {
        "buddy says BOO"
    }
}

