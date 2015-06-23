# CKRecordContext

A dead simple way of `Inserting`, `Modifying` and `Deleting` records from the CloudKit Databases.

## How To Use

A CKRecordContext object holds all the new records, any changes to fetched records and deletions until you call save() on an instance of it. It only then conveys the changes to CloudKit Database.
