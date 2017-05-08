//
//  DetailViewController.swift
//  Student_Management
//
//  Created by TTB on 5/8/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var university: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var desc: UILabel!

    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = student?.name
        university.text = student?.university
        age.text! = String(describing: student?.year_old)
        desc.text = student?.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
