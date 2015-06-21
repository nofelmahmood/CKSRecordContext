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
   
    var operationQueue:NSOperationQueue = NSOperationQueue()
    var ckModifyRecordsOperation:CKModifyRecordsOperation?
    var deletedRecords:Array<CKRecordID> = Array<CKRecordID>()
    var modifiedRecords:Array<CKRecord> = Array<CKRecord>()
    
    func addRecord(record:CKRecord)
    {
        self.modifiedRecords.append(record)
    }
    
    func deleteRecord(record:CKRecord)
    {
        self.deletedRecords.append(record.recordID)
    }
    
    func save(error:NSErrorPointer)
    {
        self.ckModifyRecordsOperation = CKModifyRecordsOperation(recordsToSave: self.modifiedRecords, recordIDsToDelete: self.deletedRecords)
        self.ckModifyRecordsOperation?.modifyRecordsCompletionBlock = ({(savedRecords, deletedRecordsIDs, operationError) -> Void in
            
            if operationError != nil
            {
                error.memory = operationError
            }
        })
        self.operationQueue.addOperation(self.ckModifyRecordsOperation!)
        self.operationQueue.waitUntilAllOperationsAreFinished()
    }
    
}
