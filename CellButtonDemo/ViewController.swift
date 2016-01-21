//
//  ViewController.swift
//  CellButtonDemo
//
//  Created by SitesSimply PTY. LTD on 20/01/2016.
//  Copyright © 2016 SitesSimply PTY. LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        return basicCellAtIndexPath(indexPath)
        var  cell:ViewControllerCell? = tableView.dequeueReusableCellWithIdentifier("cell") as? ViewControllerCell
        
        if (cell == nil)
        {
            let nib:Array = NSBundle.mainBundle().loadNibNamed("ViewControllerCell", owner: self, options: nil)
            cell = nib[0] as? ViewControllerCell
        }
        
        cell!.button.tag = indexPath.row;
        cell?.button.setTitle("Button\(indexPath.row)", forState: UIControlState.Normal)
        cell!.button.addTarget(self, action: "yourButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        return cell!
        
    }
    
    func yourButtonClicked (sender : UIButton){
        if (sender.tag == 0)
        {
            // Your code here
        }
        
        let alert = UIAlertController(title: "Alert", message: "Button\(sender.tag) clicked", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    //    func basicCellAtIndexPath(indexPath:NSIndexPath) -> NotesCell {
    //    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

