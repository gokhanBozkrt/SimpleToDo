//
//  FiileManager-DocumentsDirectory.swift
//  SimpleToDo
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import Foundation

extension FileManager {
//    static var documentsDirectory: URL {
//        let paths = FileManager.default.urls(for: .desktopDirectory, in: .allDomainsMask)
//        return paths[0]
//    }
    
    static var documentsDirectory = URL.documentsDirectory
}
