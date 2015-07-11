//
//  VCStudentEdit.swift
//  StudentStatus
//
//  Created by Colin Moseley on 7/4/15.
//  Copyright © 2015 Colin Moseley. All rights reserved.
//

import UIKit

class VCStudentEdit: UIViewController {
    
    var student:Student = Student()
    var studentIndex:Int = 0
    var vcSource:VCStudentList = VCStudentList()

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var segStatus: UISegmentedControl!
    
    @IBAction func doSave(sender: UIButton) {
        //print("VCStudentEdit.doSave")
        let stud = Student()
        stud.name = txtName.text!
        stud.status = segStatus.selectedSegmentIndex
        vcSource.students[studentIndex] = stud
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("VCStudentEdit.viewDidLoad")

        // Do any additional setup after loading the view.
        txtName.text = student.name
        segStatus.selectedSegmentIndex = student.status
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
