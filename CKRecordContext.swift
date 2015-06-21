//
//  CKRecordContext.swift
//  
//
//  Created by Nofel Mahmood on 21/06/2015.
//
//

import UIKit
import CloudKit

class CKRecordContext: NSObject {
   
    var ckModifyRecordsOperation:CKModifyRecordsOperation?
    var deletedRecords:Array<CKRecordID> = Array<CKRecordID>()
    var modifiedRecords:Array<CKRecord>? = Array<CKRecord>()
    
    
}
