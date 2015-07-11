//
//  VCStudentList.swift
//  StudentStatus
//
//  Created by Colin Moseley on 7/3/15.
//  Copyright © 2015 Colin Moseley. All rights reserved.
//

import UIKit

class VCStudentList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var students:[Student] = []
    var currentHeadings:[String] = []
    var studentsInSection:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //["Alexander Anderson", "Bob Branson", "Charles Carson", "Dennis Danielson", "Enrique Evinson", "Franklin Fredrickson"]
        addStudent("Alexander Anderson", status: 0)
        addStudent("Bob Branson", status: 0)
        addStudent("Charles Carson", status:1)
        addStudent("Dennis Danielson", status:1)
        addStudent("Enrique Evinson", status:2)
        addStudent("Franklin Fredrickson", status:2)
    }
    
    override func viewWillAppear(animated: Bool) {
        sortStudents()
        setupSections()
        tableView.reloadData()
    }
    
    func addStudent(name:String, status:Int) {
        let stud = Student()
        stud.name = name
        stud.status = status
        students.append(stud)
   }
    
    func sortStudents() {
        //Bubble sort
        for var i = 1; i < students.count; ++i {
            //print("\(i)" + ". " + students[i].name)
            var j = i
            var bAnother = true
            while bAnother {
                bAnother = switched(j)
                if bAnother {
                    j = j - 1
                }
                if j == 0 {
                    bAnother = false
                }
            }
        }
    }
    
    func switched(ix:Int) -> Bool {
        let stud = students[ix]
        let studAbove = students[ix-1]
        var b = false
        //status desc
        if stud.status > studAbove.status {
            b = true
        } else {
            if stud.status == studAbove.status {
                //name asc
                if stud.name < studAbove.name {
                    b = true
                }
            }
        }
        
        if b {
            students[ix-1] = stud
            students[ix] = studAbove
        }
        
        return b
    }
    
    func setupSections() {
        currentHeadings = []
        studentsInSection = []
        var lastStatus = 99
        var count = 0
        var bIsNotFirst = false
        for s in students {
            if s.status != lastStatus {
                if bIsNotFirst {
                    studentsInSection.append(count)
                    //print("Count is \(count)")
                    count = 0
                }
                lastStatus = s.status
                let newHeading = statusNames[lastStatus]
                currentHeadings.append(newHeading)
                //print("Will use heading \(newHeading)")
            }
            bIsNotFirst = true
            count += 1
        }
        studentsInSection.append(count)
        //print("Count is \(count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print("VCStudentList:prepareForSegue \(segue.identifier)")
        if segue.identifier == "StudentEdit" {
            let ip = self.tableView.indexPathForSelectedRow
            let sex = studentIndexForIndexPath(ip!)
            let student = students[sex]
            //print("Will seque to edit student \(student)")
            let dest = segue.destinationViewController as! VCStudentEdit
            dest.student = student
            dest.studentIndex = studentIndexForIndexPath(ip!)
            dest.vcSource = self
        } else if segue.identifier == "StudentAdd" {
            //print("Will seque to add student")
            let dest = segue.destinationViewController as! VCStudentAdd
            dest.vcSource = self
        }
    }
    
//MARK: TableVIewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("StudentCell", forIndexPath: indexPath)
        let studentIndex = studentIndexForIndexPath(indexPath)
        cell.textLabel?.text = students[studentIndex].name
        cell.detailTextLabel?.text = statusNames[students[studentIndex].status]
       return cell
    }
    
    func studentIndexForIndexPath(indexPath:NSIndexPath) -> Int {
        var section = 0
        var sex = 0
        while section < indexPath.section {
            sex += studentsInSection[section]
            section += 1
        }
        sex += indexPath.row
        return sex
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return currentHeadings.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsInSection[section]
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currentHeadings[section]
    }
    
//MARK: TableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("Clicked cell \(indexPath.row) in section \(indexPath.section)")
        
       performSegueWithIdentifier("StudentEdit", sender: self)
    }

}

