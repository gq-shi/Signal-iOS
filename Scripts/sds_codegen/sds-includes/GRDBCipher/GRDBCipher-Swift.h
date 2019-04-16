//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

// NOTE: This file is generated by /Scripts/sds_codegen/sds_parse_swift_bridging.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

@protocol SelectionRequest
@end

@protocol FilteredRequest
@end

@protocol TableRequest
@end

@protocol AggregatingRequest
@end

@protocol OrderedRequest
@end

@protocol DerivableRequest
@end

@protocol SQLCollection
@end

@protocol SQLExpression
@end

@protocol SQLOrderingTerm
@end

@protocol SQLExpressible
@end

@protocol SQLSpecificExpressible
@end

@protocol SQLSelectable
@end

@protocol ColumnExpression
@end

@protocol VirtualTableModule
@end

@protocol Association
@end

@protocol AssociationToMany
@end

@protocol AssociationToOne
@end

@protocol LayoutedRowAdapter
@end

@protocol RowLayout
@end

@protocol RowAdapter
@end

@protocol StatementAuthorizer
@end

@protocol FetchRequest
@end

@protocol DatabaseSchemaCache
@end

@protocol DatabaseReader
@end

@protocol StatementColumnConvertible
@end

@protocol TransactionObserver
@end

@protocol DatabaseEventProtocol
@end

@protocol DatabaseEventImpl
@end

@protocol DatabasePreUpdateEventImpl
@end

@protocol DatabaseRegionConvertible
@end

@protocol Cursor
@end

@protocol RowImpl
@end

@protocol DatabaseWriter
@end

@protocol DatabaseAggregate
@end

@protocol StatementProtocol
@end

@protocol DatabaseValueConvertible
@end

@protocol EncodableRecord
@end

@protocol FetchableRecord
@end

@protocol TableRecord
@end

@protocol MutablePersistableRecord
@end

@protocol PersistableRecord
@end

@protocol FTS5CustomTokenizer
@end

@protocol FTS5Tokenizer
@end

@protocol FTS5WrapperTokenizer
@end

@protocol ValueReducer
@end

@interface TableDefinition : NSObject
@end

@interface TableAlteration : NSObject
@end

@interface ColumnDefinition : NSObject
@end

@interface TableAlias : NSObject
@end

@interface DatabaseQueue : NSObject
@end

@interface StatementCompilationAuthorizer : NSObject
@end

@interface TruncateOptimizationBlocker : NSObject
@end

@interface AnyDatabaseReader : NSObject
@end

@interface DatabaseSnapshot : NSObject
@end

@interface SnapshotValueObserver : NSObject
@end

@interface FastDatabaseValueCursor : NSObject
@end

@interface FastNullableDatabaseValueCursor : NSObject
@end

@interface DatabasePool : NSObject
@end

@interface SchedulingWatchdog : NSObject
@end

@interface DatabaseObservationBroker : NSObject
@end

@interface TransactionObservation : NSObject
@end

@interface SavepointStack : NSObject
@end

@interface Database : NSObject
@end

@interface DatabaseRegionObserver : NSObject
@end

@interface AnyCursor : NSObject
@end

@interface DropFirstCursor : NSObject
@end

@interface DropWhileCursor : NSObject
@end

@interface EnumeratedCursor : NSObject
@end

@interface FilterCursor : NSObject
@end

@interface FlattenCursor : NSObject
@end

@interface MapCursor : NSObject
@end

@interface PrefixCursor : NSObject
@end

@interface PrefixWhileCursor : NSObject
@end

@interface Row : NSObject
@end

@interface RowCursor : NSObject
@end

@interface DatabaseFuture : NSObject
@end

@interface AnyDatabaseWriter : NSObject
@end

@interface DatabaseFunction : NSObject
@end

@interface Statement : NSObject
@end

@interface SelectStatement : NSObject
@end

@interface StatementCursor : NSObject
@end

@interface UpdateStatement : NSObject
@end

@interface DatabaseValueCursor : NSObject
@end

@interface NullableDatabaseValueCursor : NSObject
@end

@interface DatabaseCollation : NSObject
@end

@interface SerializedDatabase : NSObject
@end

@interface SQLiteDateParser : NSObject
@end

@interface RecordEncoder : NSObject
@end

@interface ColumnEncoder : NSObject
@end

@interface RecordCursor : NSObject
@end

@interface FetchedRecordsController : NSObject
@end

@interface FetchedRecordsObserver : NSObject
@end

@interface Item : NSObject
@end

@interface Record : NSObject
@end

@interface DAO : NSObject
@end

@interface ReadWriteBox : NSObject
@end

@interface Pool : NSObject
@end

@interface TokenizeContext : NSObject
@end

@interface FTS4TableDefinition : NSObject
@end

@interface FTS4ColumnDefinition : NSObject
@end

@interface FTS5TableDefinition : NSObject
@end

@interface FTS5ColumnDefinition : NSObject
@end

@interface FTS3TableDefinition : NSObject
@end

@interface ValueObserver : NSObject
@end