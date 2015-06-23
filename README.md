# CKSRecordContext

A dead simple way of `Fetching`, `Inserting`, `Modifying` and `Deleting` records from the CloudKit Databases.

## How To Use

A CKRecordContext object holds all the new records, any changes and deletions to them until you call `save()` on an instance of it. It only then conveys the changes to the CloudKit Database.

```swift
var cksRecordContext:CKSRecordContext = CKRecordContext(database: CKContainer.defaultContainer().privateCloudDatabase, recordZone: nil)
```
### Creating a new CKRecord

```swift
var ckRecord = cksRecordContext.insertNewCKRecord("NewRecordType")
```

### Modifying a CKRecord

Any CKRecords you create using methods of CKRecordContext are monitored by it.

### Deleting a CKRecord

```swift
var ckRecord = cksRecordContext.insertNewCKRecord("NewRecordType")
ckRecordContext.deleteRecord(record: ckRecord)
```

OR 

```swift
var ckRecord = cksRecordContext.insertNewCKRecord("NewRecordType")
ckRecordContext.deleteRecord(recordID: ckRecord.recordID)
```

### Fetching Records

```swift
func fetchCKRecord(recordID:CKRecordID,completion:(record:CKRecord?,error:NSError!) ->())

func fetchCKRecords(recordType:String,predicate:NSPredicate,completion:(results:Array<AnyObject>?,error:NSError!) ->())

func fetchCKRecords(recordType:String,predicate:NSPredicate,sortDescriptors:[NSSortDescriptor],completion:(results:Array<AnyObject>?,error:NSError!) ->())

```

### Saving the Insertions, Modifications and Deletions to server.

Its a one liner !

```swift
cksRecordContext.save { (error) -> (Void) in
  if error != nil
    {
        print("Saved Successfully")
    }
}
```

## Getting Started 
Check out the sample iOS demo app.

## Installation
`CocoaPods` is the recommended way of adding CKSIncrementalStore to your project.

You want to to add pod `'CKSRecordContext', '~> 0.1'` similar to the following to your Podfile:
```
target 'MyApp' do
  pod 'CKSRecordContext', '~> 0.1'
end
```

Then run a `[sudo] pod install` inside your terminal, or from CocoaPods.app.


## Credits
CKSRecordContext was created by [Nofel Mahmood](http://twitter.com/NofelMahmood)

## Contact 
Follow Nofel Mahmood on [Twitter](http://twitter.com/NofelMahmood) and [GitHub](http://github.com/nofelmahmood) or email him at nofelmehmood@gmail.com

## License
CKSRecordContext is available under the MIT license. See the LICENSE file for more info.
