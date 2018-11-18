//
//  DataStruct.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/21.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

struct MyPicture {
    var name = ""
    var type = ""
    var imageName = ""
    var country = ""
    var favstate = false
    var text = ""
    var rating = ""
    
}

//MyPicture(name: <#T##String#>, type: <#T##String#>, imageName: <#T##String#>, country: <#T##String#>, favstate: <#T##Bool#>)
//MyPicture(name: <#T##String#>, type: <#T##String#>, imageName: <#T##String#>, country: <#T##String#>, favstate: <#T##Bool#>, text: <#T##String#>, rating: <#T##String#>)
@available(*,deprecated)
func  getPicturesArray(name:[String],type:[String],imageName:[String],country:[String],favstateArray:[Bool],text:[String]) -> [MyPicture]{
    let pic_count=name.count
    var pictures=[MyPicture]()
    for i in 0 ... pic_count-1 {
        let picture = MyPicture(name: name[i], type: type[i], imageName: imageName[i], country: country[i], favstate: favstateArray[i],text:text[i],rating:"")
        pictures.append(picture)
    }
    return pictures
}
func  getPicturesArray2(dataset:MyDataSet) -> [MyPicture]{
    let pic_count=dataset.name.count
    var pictures=[MyPicture]()
    for i in 0 ... pic_count-1 {
        let picture = MyPicture(name: dataset.name[i], type: dataset.type[i], imageName: dataset.imagename[i], country: dataset.country[i], favstate: dataset.favstateArray[i],text:dataset.text[i],rating :"")
        pictures.append(picture)
    }
    return pictures
}
