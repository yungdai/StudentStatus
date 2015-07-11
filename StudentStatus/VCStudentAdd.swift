//
//  VCStudentAdd.swift
//  StudentStatus
//
//  Created by Colin Moseley on 7/5/15.
//  Copyright © 2015 Colin Moseley. All rights reserved.
//

import UIKit

class VCStudentAdd: UIViewController {

    var vcSource:VCStudentList = VCStudentList()

    @IBOutlet weak var segStatus: UISegmentedControl!
    @IBOutlet weak var txtName: UITextField!
    
    @IBAction func doCancel(sender: UIBarButtonItem) {
        print("doCancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doSave(sender: UIBarButtonItem) {
        //print("doSave")
        var tName = txtName.text
        if tName == "" {
            tName = "Unspecified name"
        }
        let stud = Student()
        stud.name = tName!
        stud.status = segStatus.selectedSegmentIndex
        vcSource.students.append(stud)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
