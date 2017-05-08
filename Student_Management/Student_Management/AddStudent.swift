//
//  AddStudent.swift
//  Student_Management
//
//  Created by TTB on 5/8/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

class AddStudent: UIViewController , UITextFieldDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var addName: UITextField!
    @IBOutlet weak var addUniversity: UITextField!
    @IBOutlet weak var addAge: UITextField!
    @IBOutlet weak var addDesc: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var name: String = ""
    var university: String = ""
    var age: Int = 0
    
    var desc: String = ""
    
    var addStudent: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)) , name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            //Check if any information is nil
            if (addName.text!.isEmpty || addUniversity.text!.isEmpty || addAge.text!.isEmpty || addDesc.text!.isEmpty ) {
                //Infor user by alert
                let alert = UIAlertController(title: "Warning", message: "Please fill out all the infor!", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
                //Present alert
                self.present(alert, animated: true, completion: nil);
                
            }
            else {
                name = addName.text!
                university = addUniversity.text!
                age = Int(addAge.text!)!
                desc = addDesc.text!
                
                addStudent = Student(name: name, university: university, description: desc, year_old: age )
                
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //ScrollView.setContentOffset(CGPoint(x:0,y:250), animated: true)
        self.addName = textField
        self.addUniversity = textField
        self.addAge = textField
        self.addDesc = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.addName = nil
        self.addUniversity = nil
        self.addAge = nil
        self.addDesc = nil
    }
  
    func keyboardDidShow(notification: NSNotification) {
        
        if let activeField = self.addUniversity, let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!aRect.contains(activeField.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardDidHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
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
