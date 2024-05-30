//
//  SanboxFileModel.swift
//  LuckySanboxStorable
//
//  Created by junky on 2024/5/28.
//

import Foundation
import LuckyException

public protocol SanboxFileModel: SanboxStorable {
    
    var sanboxDirectory: URL { get }
    
    var folderName: String { get }
    
    var sanboxFileName: String? { set get }
    
    var originFileUrl: URL { get }
}


public extension SanboxFileModel {
    
    
    /// default document
    var sanboxDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    
    /// default ‘file’
    var folderName: String {
        return "file"
    }
    
    
    /// save file to sanbox
    mutating func saveToSanbox() throws {
        let name = try storeInSanbox(originPath: originFileUrl, directory: sanboxDirectory, folder: folderName, name: sanboxFileName)
        sanboxFileName = name
    }
    
    func remove() throws {
        guard let name = sanboxFileName else {
            throw Exception(msg: "Unavailable sanbox file name")
        }
        try removeInSanbox(directory: sanboxDirectory, folder: folderName, name: name)
    }
    
    /// read file from sanbox
    func dataInSanbox() throws -> Data {
        guard let sanboxFileName = sanboxFileName else {
            throw Exception(msg: "Unavailable sanbox file name")
        }
        return try dataInSanbox(directory: sanboxDirectory, folder: folderName, name: sanboxFileName)
    }
    
}


