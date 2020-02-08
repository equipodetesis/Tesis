// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Categorix.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// Categorix TABLE
class TableCategorix extends SqfEntityTableBase {
  TableCategorix() {
    // declare properties of EntityTable
    tableName = 'categorix';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = true;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('name', DbType.text),
      SqfEntityFieldBase('isActive', DbType.bool, defaultValue: true),
    ];
    super.init();
  }
  static SqfEntityTableBase _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableCategorix();
  }
}
// END TABLES

// BEGIN SEQUENCES
// identity SEQUENCE
class SequenceIdentitySequence extends SqfEntitySequenceBase {
  SequenceIdentitySequence() {
    sequenceName = 'identity';
    maxValue =
        9223372036854775807; /* optional. default is max int (9.223.372.036.854.775.807) */
    cycle = false; /* optional. default is false; */
    minValue = 0; /* optional. default is 0 */
    incrementBy = 1; /* optional. default is 1 */
    startWith = 0; /* optional. default is 0 */
    super.init();
  }
  static SequenceIdentitySequence _instance;
  static SequenceIdentitySequence get getInstance {
    return _instance = _instance ?? SequenceIdentitySequence();
  }
}
// END SEQUENCES

// BEGIN DATABASE MODEL
class MyDbModel extends SqfEntityModelProvider {
  MyDbModel() {
    databaseName = myDbModel.databaseName;
    databaseTables = [
      TableCategorix.getInstance,
    ];

    sequences = [
      SequenceIdentitySequence.getInstance,
    ];

    bundledDatabasePath = myDbModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  }
  
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Categorix
class Categorix {
  Categorix({this.id, this.name, this.isActive, this.isDeleted}) {
    _setDefaultValues();
  }
  Categorix.withFields(this.name, this.isActive, this.isDeleted) {
    _setDefaultValues();
  }
  Categorix.withId(this.id, this.name, this.isActive, this.isDeleted) {
    _setDefaultValues();
  }
  Categorix.fromMap(Map<String, dynamic> o) {
    _setDefaultValues();
    id = o['id'] as int;
    if (o['name'] != null) name = o['name'] as String;
    if (o['isActive'] != null)
      isActive = o['isActive'] == 1 || o['isActive'] == true;
    isDeleted = o['isDeleted'] != null
        ? o['isDeleted'] == 1 || o['isDeleted'] == true
        : null;
  }
  // FIELDS (Categorix)
  int id;
  String name;
  bool isActive;
  bool isDeleted;

  BoolResult saveResult;
  // end FIELDS (Categorix)

  static const bool _softDeleteActivated = true;
  CategorixManager __mnCategorix;

  CategorixManager get _mnCategorix {
    return __mnCategorix = __mnCategorix ?? CategorixManager();
  }

  // METHODS
  Map<String, dynamic> toMap({bool forQuery = false, bool forJson = false}) {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (name != null) {
      map['name'] = name;
    }

    if (isActive != null) {
      map['isActive'] = forQuery ? (isActive ? 1 : 0) : isActive;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  Future<Map<String, dynamic>> toMapWithChilds(
      [bool forQuery = false, bool forJson = false]) async {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (name != null) {
      map['name'] = name;
    }

    if (isActive != null) {
      map['isActive'] = forQuery ? (isActive ? 1 : 0) : isActive;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  /// This method always returns Json String
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method always returns Json String
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChilds(false, true));
  }

  List<dynamic> toArgs() {
    return [id, name, isActive, isDeleted];
  }

  static Future<List<Categorix>> fromWebUrl(String url) async {
    try {
      final response = await http.get(url);
      return await fromJson(response.body);
    } catch (e) {
      print(
          'SQFENTITY ERROR Categorix.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  static Future<List<Categorix>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Categorix>[];
    try {
      objList = list
          .map((categorix) =>
              Categorix.fromMap(categorix as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(
          'SQFENTITY ERROR Categorix.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  /*
    /// REMOVED AFTER v1.2.1+14 
    static Future<List<Categorix>> fromObjectList(Future<List<dynamic>> o) async {
      final data = await o;
      return await Categorix.fromMapList(data);
    } 
    */

  static Future<List<Categorix>> fromMapList(List<dynamic> data,
      {bool preload = false, List<String> preloadFields}) async {
    final List<Categorix> objList = <Categorix>[];
    for (final map in data) {
      final obj = Categorix.fromMap(map as Map<String, dynamic>);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Categorix by ID if exist, otherwise returns null
  /// <param name='id'>Primary Key Value</param>
  /// <returns>returns Categorix if exist, otherwise returns null
  Future<Categorix> getById(int id) async {
    if (id == null) {
      return null;
    }
    Categorix obj;
    final data = await _mnCategorix.getById(id);
    if (data.length != 0) {
      obj = Categorix.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Categorix) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record

  /// <returns>Returns id
  Future<int> save() async {
    if (id == null || id == 0) {
      id = await _mnCategorix.insert(this);
    } else {
      id = await _upsert();
    }

    return id;
  }

  /// saveAs Categorix. Returns a new Primary Key value of Categorix

  /// <returns>Returns a new Primary Key value of Categorix
  Future<int> saveAs() async {
    id = null;

    return save();
  }

  /// saveAll method saves the sent List<Categorix> as a bulk in one transaction
  ///
  /// Returns a <List<BoolResult>>
  Future<List<BoolResult>> saveAll(List<Categorix> categorixs) async {
    final results = _mnCategorix.saveAll(
        'INSERT OR REPLACE INTO categorix (id,  name, isActive,isDeleted)  VALUES (?,?,?,?)',
        categorixs);
    return results;
  }

  /// Updates if the record exists, otherwise adds a new row

  /// <returns>Returns id
  Future<int> _upsert() async {
    try {
      if (await _mnCategorix.rawInsert(
              'INSERT OR REPLACE INTO categorix (id,  name, isActive,isDeleted)  VALUES (?,?,?,?)',
              [id, name, isActive, isDeleted]) ==
          1) {
        saveResult = BoolResult(
            success: true,
            successMessage: 'Categorix id=$id updated successfuly');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Categorix id=$id did not update');
      }
      return id;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Categorix Save failed. Error: ${e.toString()}');
      return 0;
    }
  }

  /// inserts or replaces the sent List<<Categorix>> as a bulk in one transaction.
  ///
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  ///
  /// Returns a <List<BoolResult>>
  Future<List<BoolResult>> upsertAll(List<Categorix> categorixs) async {
    final results = await _mnCategorix.rawInsertAll(
        'INSERT OR REPLACE INTO categorix (id,  name, isActive,isDeleted)  VALUES (?,?,?,?)',
        categorixs);
    return results;
  }

  /// Deletes Categorix

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    print('SQFENTITIY: delete Categorix invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete || isDeleted) {
      return _mnCategorix
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnCategorix.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  /// Recover Categorix>

  /// <returns>BoolResult res.success=Recovered, not res.success=Can not recovered
  Future<BoolResult> recover([bool recoverChilds = true]) async {
    print('SQFENTITIY: recover Categorix invoked (id=$id)');
    {
      return _mnCategorix.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 0});
    }
  }

  //private CategorixFilterBuilder _Select;
  CategorixFilterBuilder select(
      {List<String> columnsToSelect, bool getIsDeleted}) {
    return CategorixFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect;
  }

  CategorixFilterBuilder distinct(
      {List<String> columnsToSelect, bool getIsDeleted}) {
    return CategorixFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isActive = isActive ?? true;
    isDeleted = isDeleted ?? false;
  }
  // END METHODS
  // CUSTOM CODES
  /*
      you must define customCode property of your SqfEntityTable constant for ex:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODES
}
// endregion categorix

// region CategorixField
class CategorixField extends SearchCriteria {
  CategorixField(this.categorixFB) {
    param = DbParameter();
  }
  DbParameter param;
  String _waitingNot = '';
  CategorixFilterBuilder categorixFB;

  CategorixField get not {
    _waitingNot = ' NOT ';
    return this;
  }

  CategorixFilterBuilder equals(dynamic pValue) {
    param.expression = '=';
    categorixFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, categorixFB.parameters, param, SqlSyntax.EQuals,
            categorixFB._addedBlocks)
        : setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.NotEQuals, categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder equalsOrNull(dynamic pValue) {
    param.expression = '=';
    categorixFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.EQualsOrNull, categorixFB._addedBlocks)
        : setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.NotEQualsOrNull, categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder isNull() {
    categorixFB._addedBlocks = setCriteria(
        0,
        categorixFB.parameters,
        param,
        SqlSyntax.IsNULL.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder contains(dynamic pValue) {
    if (pValue != null) {
      categorixFB._addedBlocks = setCriteria(
          '%${pValue.toString()}%',
          categorixFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          categorixFB._addedBlocks);
      _waitingNot = '';
      categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
          categorixFB._addedBlocks.retVal;
    }
    return categorixFB;
  }

  CategorixFilterBuilder startsWith(dynamic pValue) {
    if (pValue != null) {
      categorixFB._addedBlocks = setCriteria(
          '${pValue.toString()}%',
          categorixFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          categorixFB._addedBlocks);
      _waitingNot = '';
      categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
          categorixFB._addedBlocks.retVal;
      categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
          categorixFB._addedBlocks.retVal;
    }
    return categorixFB;
  }

  CategorixFilterBuilder endsWith(dynamic pValue) {
    if (pValue != null) {
      categorixFB._addedBlocks = setCriteria(
          '%${pValue.toString()}',
          categorixFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          categorixFB._addedBlocks);
      _waitingNot = '';
      categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
          categorixFB._addedBlocks.retVal;
    }
    return categorixFB;
  }

  CategorixFilterBuilder between(dynamic pFirst, dynamic pLast) {
    if (pFirst != null && pLast != null) {
      categorixFB._addedBlocks = setCriteria(
          pFirst,
          categorixFB.parameters,
          param,
          SqlSyntax.Between.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          categorixFB._addedBlocks,
          pLast);
    } else if (pFirst != null) {
      if (_waitingNot != '') {
        categorixFB._addedBlocks = setCriteria(pFirst, categorixFB.parameters,
            param, SqlSyntax.LessThan, categorixFB._addedBlocks);
      } else {
        categorixFB._addedBlocks = setCriteria(pFirst, categorixFB.parameters,
            param, SqlSyntax.GreaterThanOrEquals, categorixFB._addedBlocks);
      }
    } else if (pLast != null) {
      if (_waitingNot != '') {
        categorixFB._addedBlocks = setCriteria(pLast, categorixFB.parameters,
            param, SqlSyntax.GreaterThan, categorixFB._addedBlocks);
      } else {
        categorixFB._addedBlocks = setCriteria(pLast, categorixFB.parameters,
            param, SqlSyntax.LessThanOrEquals, categorixFB._addedBlocks);
      }
    }
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder greaterThan(dynamic pValue) {
    param.expression = '>';
    categorixFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.GreaterThan, categorixFB._addedBlocks)
        : setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.LessThanOrEquals, categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder lessThan(dynamic pValue) {
    param.expression = '<';
    categorixFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, categorixFB.parameters, param, SqlSyntax.LessThan,
            categorixFB._addedBlocks)
        : setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder greaterThanOrEquals(dynamic pValue) {
    param.expression = '>=';
    categorixFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, categorixFB._addedBlocks)
        : setCriteria(pValue, categorixFB.parameters, param, SqlSyntax.LessThan,
            categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder lessThanOrEquals(dynamic pValue) {
    param.expression = '<=';
    categorixFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.LessThanOrEquals, categorixFB._addedBlocks)
        : setCriteria(pValue, categorixFB.parameters, param,
            SqlSyntax.GreaterThan, categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }

  CategorixFilterBuilder inValues(dynamic pValue) {
    categorixFB._addedBlocks = setCriteria(
        pValue,
        categorixFB.parameters,
        param,
        SqlSyntax.IN.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        categorixFB._addedBlocks);
    _waitingNot = '';
    categorixFB._addedBlocks.needEndBlock[categorixFB._blockIndex] =
        categorixFB._addedBlocks.retVal;
    return categorixFB;
  }
}
// endregion CategorixField

// region CategorixFilterBuilder
class CategorixFilterBuilder extends SearchCriteria {
  CategorixFilterBuilder(Categorix obj) {
    whereString = '';
    qparams = QueryParams();
    parameters = <DbParameter>[];
    orderByList = <String>[];
    groupByList = <String>[];
    _addedBlocks = AddedBlocks(<bool>[], <bool>[]);
    _addedBlocks.needEndBlock.add(false);
    _addedBlocks.waitingStartBlock.add(false);
    _pagesize = 0;
    _page = 0;
    _obj = obj;
  }
  AddedBlocks _addedBlocks;
  int _blockIndex = 0;
  List<DbParameter> parameters;
  List<String> orderByList;
  Categorix _obj;
  QueryParams qparams;
  int _pagesize;
  int _page;

  /// put the sql keyword 'AND'
  CategorixFilterBuilder get and {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' AND ';
    }
    return this;
  }

  /// put the sql keyword 'OR'
  CategorixFilterBuilder get or {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' OR ';
    }
    return this;
  }

  /// open parentheses
  CategorixFilterBuilder get startBlock {
    _addedBlocks.waitingStartBlock.add(true);
    _addedBlocks.needEndBlock.add(false);
    _blockIndex++;
    if (_blockIndex > 1) _addedBlocks.needEndBlock[_blockIndex - 1] = true;
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  CategorixFilterBuilder where(String whereCriteria) {
    if (whereCriteria != null && whereCriteria != '') {
      final DbParameter param = DbParameter();
      _addedBlocks =
          setCriteria(0, parameters, param, '($whereCriteria)', _addedBlocks);
      _addedBlocks.needEndBlock[_blockIndex] = _addedBlocks.retVal;
    }
    return this;
  }

  /// page = page number,
  ///
  /// pagesize = row(s) per page
  CategorixFilterBuilder page(int page, int pagesize) {
    if (page > 0) _page = page;
    if (pagesize > 0) _pagesize = pagesize;
    return this;
  }

  /// int count = LIMIT
  CategorixFilterBuilder top(int count) {
    if (count > 0) {
      _pagesize = count;
    }
    return this;
  }

  /// close parentheses
  CategorixFilterBuilder get endBlock {
    if (_addedBlocks.needEndBlock[_blockIndex]) {
      parameters[parameters.length - 1].whereString += ' ) ';
    }
    _addedBlocks.needEndBlock.removeAt(_blockIndex);
    _addedBlocks.waitingStartBlock.removeAt(_blockIndex);
    _blockIndex--;
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  CategorixFilterBuilder orderBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add(argFields);
      } else {
        for (String s in argFields) {
          if (s != null && s != '') orderByList.add(' $s ');
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  CategorixFilterBuilder orderByDesc(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add('$argFields desc ');
      } else {
        for (String s in argFields) {
          if (s != null && s != '') orderByList.add(' $s desc ');
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  CategorixFilterBuilder groupBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        groupByList.add(' $argFields ');
      } else {
        for (String s in argFields) {
          if (s != null && s != '') groupByList.add(' $s ');
        }
      }
    }
    return this;
  }

  CategorixField setField(CategorixField field, String colName, DbType dbtype) {
    return CategorixField(this)
      ..param = DbParameter(
          dbType: dbtype,
          columnName: colName,
          wStartBlock: _addedBlocks.waitingStartBlock[_blockIndex]);
  }

  CategorixField _id;
  CategorixField get id {
    return _id = setField(_id, 'id', DbType.integer);
  }

  CategorixField _name;
  CategorixField get name {
    return _name = setField(_name, 'name', DbType.text);
  }

  CategorixField _isActive;
  CategorixField get isActive {
    return _isActive = setField(_isActive, 'isActive', DbType.bool);
  }

  CategorixField _isDeleted;
  CategorixField get isDeleted {
    return _isDeleted = setField(_isDeleted, 'isDeleted', DbType.bool);
  }

  bool _getIsDeleted;

  void _buildParameters() {
    if (_page > 0 && _pagesize > 0) {
      qparams
        ..limit = _pagesize
        ..offset = (_page - 1) * _pagesize;
    } else {
      qparams
        ..limit = _pagesize
        ..offset = _page;
    }
    for (DbParameter param in parameters) {
      if (param.columnName != null) {
        if (param.value is List) {
          param.value = param.value
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .toString();
          whereString += param.whereString
              .replaceAll('{field}', param.columnName)
              .replaceAll('?', param.value.toString());
          param.value = null;
        } else {
          whereString +=
              param.whereString.replaceAll('{field}', param.columnName);
        }
        if (!param.whereString.contains('?')) {
        } else {
          switch (param.dbType) {
            case DbType.bool:
              param.value =
                  param.value == null ? null : param.value == true ? 1 : 0;
              param.value2 =
                  param.value2 == null ? null : param.value2 == true ? 1 : 0;
              break;
            case DbType.date:
            case DbType.datetime:
            case DbType.datetimeUtc:
              param.value = param.value == null
                  ? null
                  : (param.value as DateTime).millisecondsSinceEpoch;
              param.value2 = param.value2 == null
                  ? null
                  : (param.value2 as DateTime).millisecondsSinceEpoch;
              break;
            default:
          }
          if (param.value != null) {
            whereArguments.add(param.value);
          }
          if (param.value2 != null) {
            whereArguments.add(param.value2);
          }
        }
      } else {
        whereString += param.whereString;
      }
    }
    if (Categorix._softDeleteActivated) {
      if (whereString != '') {
        whereString =
            '${!_getIsDeleted ? 'ifnull(isDeleted,0)=0 AND' : ''} ($whereString)';
      } else if (!_getIsDeleted) {
        whereString = 'ifnull(isDeleted,0)=0';
      }
    }

    if (whereString != '') {
      qparams.whereString = whereString;
    }
    qparams
      ..whereArguments = whereArguments
      ..groupBy = groupByList.join(',')
      ..orderBy = orderByList.join(',');
  }

  /// Deletes List<Categorix> bulk by query
  ///
  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    _buildParameters();
    var r = BoolResult();
    if (Categorix._softDeleteActivated && !hardDelete) {
      r = await _obj._mnCategorix.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _obj._mnCategorix.delete(qparams);
    }
    return r;
  }

  Future<BoolResult> recover() async {
    _getIsDeleted = true;
    _buildParameters();
    print('SQFENTITIY: recover Categorix bulk invoked');
    return _obj._mnCategorix.updateBatch(qparams, {'isDeleted': 0});
  }

  /// using:
  ///
  /// update({'fieldName': Value})
  ///
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  Future<BoolResult> update(Map<String, dynamic> values) {
    _buildParameters();
    if (qparams.limit > 0 || qparams.offset > 0) {
      qparams.whereString =
          'id IN (SELECT id from categorix ${qparams.whereString.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _obj._mnCategorix.updateBatch(qparams, values);
  }

  /// This method always returns CategorixObj if exist, otherwise returns null
  ///
  /// Set preload to true if you want to load all fields related to child or parent
  ///
  /// You can send certain field names with preloadFields parameter for preloading. For ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])
  ///
  /// <returns>List<Categorix>
  Future<Categorix> toSingle(
      {bool preload = false, List<String> preloadFields}) async {
    _pagesize = 1;
    _buildParameters();
    final objFuture = _obj._mnCategorix.toList(qparams);
    final data = await objFuture;
    Categorix obj;
    if (data.isNotEmpty) {
      obj = Categorix.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method always returns int.
  ///
  /// <returns>int
  Future<int> toCount([VoidCallback Function(int c) categorixCount]) async {
    _buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final categorixsFuture = await _obj._mnCategorix.toList(qparams);
    final int count = categorixsFuture[0]['CNT'] as int;
    if (categorixCount != null) {
      categorixCount(count);
    }
    return count;
  }

  /// This method always returns List<Categorix>.
  ///
  /// Set preload to true if you want to load all fields related to child or parent
  ///
  /// You can send certain field names with preloadFields parameter for preloading. For ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])
  ///
  /// <returns>List<Categorix>
  Future<List<Categorix>> toList(
      {bool preload = false, List<String> preloadFields}) async {
    final data = await toMapList();
    final List<Categorix> categorixsData =
        await Categorix.fromMapList(data, preload: preload);
    return categorixsData;
  }

  /// This method always returns Json String
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method always returns Json String.
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChilds(false, true));
    }
    return json.encode(list);
  }

  /// This method always returns List<dynamic>.
  ///
  /// <returns>List<dynamic>
  Future<List<dynamic>> toMapList() async {
    _buildParameters();
    return await _obj._mnCategorix.toList(qparams);
  }

  /// Returns List<DropdownMenuItem<Categorix>>
  Future<List<DropdownMenuItem<Categorix>>> toDropDownMenu(
      String displayTextColumn,
      [VoidCallback Function(List<DropdownMenuItem<Categorix>> o)
          dropDownMenu]) async {
    _buildParameters();
    final categorixsFuture = _obj._mnCategorix.toList(qparams);

    final data = await categorixsFuture;
    final int count = data.length;
    final List<DropdownMenuItem<Categorix>> items = []..add(DropdownMenuItem(
        value: Categorix(),
        child: Text('Select Categorix'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: Categorix.fromMap(data[i] as Map<String, dynamic>),
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// Returns List<DropdownMenuItem<int>>
  Future<List<DropdownMenuItem<int>>> toDropDownMenuInt(
      String displayTextColumn,
      [VoidCallback Function(List<DropdownMenuItem<int>> o)
          dropDownMenu]) async {
    _buildParameters();
    qparams.selectColumns = ['id', displayTextColumn];
    final categorixsFuture = _obj._mnCategorix.toList(qparams);

    final data = await categorixsFuture;
    final int count = data.length;
    final List<DropdownMenuItem<int>> items = []..add(DropdownMenuItem(
        value: 0,
        child: Text('Select Categorix'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: data[i]['id'] as int,
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// This method always returns Primary Key List<int>.
  /// <returns>List<int>
  Future<List<int>> toListPrimaryKey([bool buildParameters = true]) async {
    if (buildParameters) _buildParameters();
    final List<int> idData = <int>[];
    qparams.selectColumns = ['id'];
    final idFuture = await _obj._mnCategorix.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..
  ///
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  Future<List<dynamic>> toListObject(
      [VoidCallback Function(List<dynamic> o) listObject]) async {
    _buildParameters();

    final objectFuture = _obj._mnCategorix.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    if (listObject != null) {
      listObject(objectsData);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  ///
  /// Sample usage: await Categorix.select(columnsToSelect: ['columnName']).toListString()
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o) listString]) async {
    _buildParameters();

    final objectFuture = _obj._mnCategorix.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns[0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion CategorixFilterBuilder

// region CategorixFields
class CategorixFields {
  static TableField _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField _fName;
  static TableField get name {
    return _fName = _fName ?? SqlSyntax.setField(_fName, 'name', DbType.text);
  }

  static TableField _fIsActive;
  static TableField get isActive {
    return _fIsActive =
        _fIsActive ?? SqlSyntax.setField(_fIsActive, 'isActive', DbType.bool);
  }

  static TableField _fIsDeleted;
  static TableField get isDeleted {
    return _fIsDeleted = _fIsDeleted ??
        SqlSyntax.setField(_fIsDeleted, 'isDeleted', DbType.integer);
  }
}
// endregion CategorixFields

//region CategorixManager
class CategorixManager extends SqfEntityProvider {
  CategorixManager() : super(MyDbModel(), tableName: _tableName, colId: _colId);
  static String _tableName = 'categorix';
  static String _colId = 'id';
}

//endregion CategorixManager
/// Region SEQUENCE IdentitySequence
class IdentitySequence {
  /// Assigns a new value when it is triggered and returns the new value
  /// returns Future<int>
  Future<int> nextVal([VoidCallback Function(int o) nextval]) async {
    final val = await MyDbModelSequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, true);
    if (nextval != null) {
      nextval(val);
    }
    return val;
  }

  /// Get the current value
  /// returns Future<int>
  Future<int> currentVal([VoidCallback Function(int o) currentval]) async {
    final val = await MyDbModelSequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, false);
    if (currentval != null) {
      currentval(val);
    }
    return val;
  }

  /// Reset sequence to start value
  /// returns start value
  Future<int> reset([VoidCallback Function(int o) currentval]) async {
    final val = await MyDbModelSequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, false, reset: true);
    if (currentval != null) {
      currentval(val);
    }
    return val;
  }
}

/// End Region SEQUENCE IdentitySequence

class MyDbModelSequenceManager extends SqfEntityProvider {
  MyDbModelSequenceManager() : super(MyDbModel());
}
// END OF ENTITIES