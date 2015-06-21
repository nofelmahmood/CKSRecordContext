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
    var database:CKDatabase?
    
    init(database:CKDatabase?) {
        
        self.database = database
        super.init()
    }
    func insertNewCKRecord(recordType:String)->CKRecord
    {
        var ckRecord:CKRecord = CKRecord(recordType: recordType)
        self.modifiedRecords.append(ckRecord)
        return ckRecord
    }
    func insertNewCKRecord(recordType:String,recordID:CKRecordID)->CKRecord
    {
        var ckRecord:CKRecord = CKRecord(recordType: recordType, recordID: recordID)
        self.modifiedRecords.append(ckRecord)
        return ckRecord
    }
    func insertNewCKRecord(recordType:String,recordZoneID:CKRecordZoneID)->CKRecord
    {
        var ckRecord:CKRecord = CKRecord(recordType: recordType, zoneID: recordZoneID)
        self.modifiedRecords.append(ckRecord)
        return ckRecord
    }
    
    func fetchCKRecord(recordID:CKRecordID)->CKRecord?
    {
        var fetchRecordsOperation:CKFetchRecordsOperation = CKFetchRecordsOperation(recordIDs: [recordID])
        fetchRecordsOperation.database = self.database
        var record:CKRecord?
        fetchRecordsOperation.fetchRecordsCompletionBlock = ({(recordsWithRecordIDs,error) -> Void in
            
            if error == nil
            {
               record = recordsWithRecordIDs[recordID] as? CKRecord
            }
        })
        self.operationQueue.addOperation(fetchRecordsOperation)
        self.operationQueue.waitUntilAllOperationsAreFinished()
        
        return record
    }
    
    func deleteRecord(record:CKRecord)
    {
        self.deletedRecords.append(record.recordID)
    }
    
    func reset()
    {
        self.modifiedRecords.removeAll(keepCapacity: false)
        self.deletedRecords.removeAll(keepCapacity: false)
    }
    
    func save(error:NSErrorPointer)
    {
        self.ckModifyRecordsOperation = CKModifyRecordsOperation(recordsToSave: self.modifiedRecords, recordIDsToDelete: self.deletedRecords)
        self.ckModifyRecordsOperation?.database = self.database
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
