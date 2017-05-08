//
//  StudentTableViewController.swift
//  Student_Management
//
//  Created by TTB on 5/8/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var newStudent: Student?
    //declared an instance of UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    var filteredStudents = [Student]()
    
    var students: [Student] = Student.getStudents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
//        if let splitViewController = splitViewController {
//            let controllers = splitViewController.viewControllers
//            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
//        }
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    //Implement function done to add new student
    @IBAction func done(segue:UIStoryboardSegue) {
        let addStudentVC = segue.source as! AddStudent
        
        newStudent = addStudentVC.addStudent
        
        if(newStudent != nil) {
            students.append(newStudent!)
            tableView.reloadData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: this function do search student
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filteredStudents = students.filter{ student in
            return student.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
//        super.viewWillAppear(animated)
//    }
//    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudents.count
        }
        return students.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "student_cell", for: indexPath as IndexPath) as! StudentCell
        
        let student: Student
        
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudents[indexPath.row]
        } else {
            student = students[indexPath.row]
        }
        cell.studentName.text = student.name
        cell.university.text = student.university
        cell.age.text! = String(student.year_old)
        cell.descript.text = student.description
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //Function prepare segue for detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail_student" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let student: Student
                if searchController.isActive && searchController.searchBar.text != "" {
                    student = filteredStudents[indexPath.row]
                } else {
                    student = students[indexPath.row]
                }
                let controller = segue.destination as! DetailViewController
                controller.student = student
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // get student dragging
        let student = students[fromIndexPath.row]
        // remove event dragging
        students.remove(at: fromIndexPath.row)
        // insert event into new possition
        students.insert(student, at: to.row)
        
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
extension StudentTableViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
