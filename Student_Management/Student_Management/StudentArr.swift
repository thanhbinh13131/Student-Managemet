

import Foundation

class StudentArr
{
    // Variables
    var students: [Student]     // all students
    
    init(students: [Student])
    {
        self.students = students
    }
    //Function get the students
    class func getStudents() -> [Student]
    {
//        return [self.monday(), self.tuesday(), self.wenesday(), self.thursday(), self.friday(),
//        self.saturday(), self.sunday()]
        //var includes all student
        var students = [Student]()
        
        students.append(Student(name: "Frank Lampard", university: "Stamford Bridge", description: "The Blues Legend", year_old: 33))
        students.append(Student(name: "Jonh Terry", university: "Stamford Bridge", description: "The Blues Legend", year_old: 34))
        students.append(Student(name: "EdEn Hazard", university: "Stamford Bridge", description: "The Blues Super Midfielder", year_old: 26))
        return students  //return Array of Students
    }
    
    

}













