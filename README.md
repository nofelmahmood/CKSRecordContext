# CKRecordContext

A dead simple way of `Inserting`, `Modifying` and `Deleting` records from the CloudKit Databases.

## How To Use

A CKRecordContext object holds all the new records, any changes to fetched records and deletions until you call `save()` on an instance of it. It only then conveys the changes to the CloudKit Database.

```swift
var ckRecordContext:CKRecordContext = CKRecordContext(database: CKContainer.defaultContainer().privateCloudDatabase, recordZone: nil)
```
### Creating a new CKRecord

```swift
var ckRecord = ckRecordContext.insertNewCKRecord("NewRecordType")
```

### Modifying a CKRecord

Any CKRecords you create using methods of CKRecordContext are monitored by it.

### Deleting a CKRecord

```swift
var ckRecord = ckRecordContext.insertNewCKRecord("NewRecordType")
ckRecordContext.deleteRecord(record: ckRecord)
```

OR 

```swift
var ckRecord = ckRecordContext.insertNewCKRecord("NewRecordType")
ckRecordContext.deleteRecord(recordID: ckRecord.recordID)
```

### Saving the Insertions, Modifications and Deletions to server.

Its a one liner !

```swift
ckRecordContext.save { (error) -> (Void) in
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

You want to to add pod `'CKRecordContext', '~> 0.1'` similar to the following to your Podfile:
```
target 'MyApp' do
  pod 'CKRecordContext', '~> 0.1'
end
```

Then run a `[sudo] pod install` inside your terminal, or from CocoaPods.app.


## Credits
CKRecordContext was created by [Nofel Mahmood](http://twitter.com/NofelMahmood)

## Contact 
Follow Nofel Mahmood on [Twitter](http://twitter.com/NofelMahmood) and [GitHub](http://github.com/nofelmahmood) or email him at nofelmehmood@gmail.com

## License
CKRecordContext is available under the MIT license. See the LICENSE file for more info.
