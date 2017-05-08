

import Foundation
import UIKit



class Student
{
    var name: String
    var university: String
    var description: String
    var year_old: Int
    
    init(name: String, university: String, description: String, year_old: Int)
    {
        self.name = name
        self.university = university
        self.description = description
        self.year_old = year_old
    }
    
    class func getStudents() -> [Student]
    {
        var students = [Student]()
        
        students.append(Student(name: "Frank Lampard", university: "Stamford Bridge", description: "The Blues Legend", year_old: 33))
        students.append(Student(name: "Jonh Terry", university: "Stamford Bridge", description: "The Blues Legend", year_old: 34))
        students.append(Student(name: "EdEn Hazard", university: "Stamford Bridge", description: "The Blues Super Midfielder", year_old: 26))
        return students  //return Array of Students
    }
    
}










