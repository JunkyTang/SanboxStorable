# SanboxStorable

## 安装

```ruby

    pod 'LuckySanboxStorable'

```

## 使用

### 定义遵循于SanboxFileModel协议的数据模型

```swift

struct FileModel:SanboxFileModel {
    
    /// 保存的文件名字
    var sanboxFileName: String?
    
    /// 原始文件目录
    var originFileUrl: URL
    
}

```

* 自定义沙盒目录

```swift

    var sanboxDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
```

* 自定义文件夹目录

```swift

    var folderName: String {
        return "file"
    }
```

### 初始化数据模型并保存

```swift

    let model = FileModel(originFileUrl: url)
    // 如果没有给文件名，默认会用uuid代替，且保存成功后会赋值sanboxFileName
    try model.saveToSanbox()
```

### 读取数据

```swift

    let data = try model.dataInSanbox()
```

