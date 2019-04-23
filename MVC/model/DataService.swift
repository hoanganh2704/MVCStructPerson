//
//  DataService.swift
//  MVC
//
//  Created by hoanganh on 4/23/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class DataService {
    static let conpho = DataService()
    
    var  student = [
        Student(photo: UIImage(named: "1")!, name: "Hoang Anh", age: "19", sex: "be de"),
         Student(photo: UIImage(named: "2")!, name: "Dai", age: "50", sex: "het dat"),
         Student(photo: UIImage(named: "3")!, name: "Khanh", age: "100", sex: "sap di"),
         Student(photo: UIImage(named: "4")!, name: "binh", age: "18", sex: "nam")
    ]
    
    func add (photo1: UIImage, name1: String, age1: String, sex1: String){
        let student4 = Student(photo: photo1, name: name1, age: age1, sex: sex1)
        student.append(student4)
    }
    func edit( indexPath:IndexPath, photo1: UIImage, name1: String, age1: String, sex1: String){
        student[indexPath.row] = Student(photo: photo1, name: name1, age: age1, sex: sex1 )
    }
    func remove(indexPath:IndexPath){
        student.remove(at: indexPath.row)
    }

}
