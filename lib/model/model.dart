import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
part 'model.g.dart';
// Define the 'tableCategory' constant as SqfEntityTable for the category table.
const tableCategory = SqfEntityTable(
  tableName: 'categorix',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  modelName: null,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('isActive', DbType.bool, defaultValue: true),
  ]
);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
  // maxValue:  10000, /* optional. default is max int (9.223.372.036.854.775.807) */
  // modelName: 'SQEidentity', 
                      /* optional. SqfEntity will set it to sequenceName automatically when the modelName is null*/
  // cycle : false,   /* optional. default is false; */
  // minValue = 0;    /* optional. default is 0 */
  // incrementBy = 1; /* optional. default is 1 */
  // startWith = 0;   /* optional. default is 0 */
);

@SqfEntityBuilder(myDbModel, 
formControllers: [tableCategory], // Creates controllers for Add/Edit forms and listing page of tables (optional)
)
const myDbModel = SqfEntityModel(
    modelName: 'MyDbModel', // optional
    databaseName: 'sampleORM.db',
    // put defined tables into the tables list.
    databaseTables: [tableCategory],
    // put defined sequences into the sequences list.
    sequences: [seqIdentity],
    bundledDatabasePath:
        null // 'assets/sample.db' // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
);