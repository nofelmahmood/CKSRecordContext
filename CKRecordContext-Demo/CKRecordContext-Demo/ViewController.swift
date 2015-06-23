//
//  ViewController.swift
//  CKRecordContext-Demo
//
//  Created by Nofel Mahmood on 21/06/2015.
//  Copyright (c) 2015 CloudKitSpace. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ckRecordContext:CKRecordContext = CKRecordContext(database: CKContainer.defaultContainer().privateCloudDatabase, recordZone: nil)
        
        var ckRecord = ckRecordContext.insertNewCKRecord("Nofel")
        ckRecord.setObject("Nofel", forKey: "DaghaRora")
        
        var anotherckRecord = ckRecordContext.insertNewCKRecord("Nofel")
        anotherckRecord.setObject("daghaRora", forKey: "MAMia")
        
        var error:NSErrorPointer = nil
        
        ckRecordContext.save { (error) -> (Void) in
            
            if error != nil
            {
                print("Saved Successfully")
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

