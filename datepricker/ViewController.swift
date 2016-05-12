//
//  ViewController.swift
//  datepricker
//
//  Created by Chris Snyder on 5/12/16.
//  Copyright © 2016 LAKES. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var dates = [String]()
    var item = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(ViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }

    func datePickerChanged(datePicker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()

        dateFormatter.dateFormat = "MM/dd/yy"
        //dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle

        let strDate = dateFormatter.stringFromDate(datePicker.date)

        //dateLabel.text = strDate
        dates.append(strDate)

    }

    @IBAction func saveAction(sender: AnyObject) {
        tableView.reloadData()
        item.append(itemTextField.text!)
        itemTextField.text = ""
    }
    

    //table view methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dates.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")

        cell?.textLabel?.text = item[indexPath.row]
        cell?.detailTextLabel?.text = dates[indexPath.row]

        return cell!
    }


    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        dates.removeAtIndex(indexPath.row)
        tableView.reloadData()
    }

    
}

