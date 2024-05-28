//
//  ViewController.swift
//  LuckySanboxStorable
//
//  Created by 汤俊杰 on 05/28/2024.
//  Copyright (c) 2024 汤俊杰. All rights reserved.
//

import UIKit
import LuckySanboxStorable

class ViewController: UIViewController {

    var model: FileModel = FileModel(originFileUrl: URL(string: "http://www.baidu.com")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let url = Bundle.main.url(forResource: "temp", withExtension: "pdf") else {
            print("url = nil")
            return
        }
        
        model = FileModel(originFileUrl: url)
        do {
            try model.saveToSanbox()
        } catch {
            print(error.localizedDescription)
        }
        
        print(model)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        do {
            let data = try model.dataInSanbox()
            print(data)
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



struct FileModel:SanboxFileModel {
    
    /// 保存的文件名字
    var sanboxFileName: String?
    
    /// 原始文件目录
    var originFileUrl: URL
    
}
