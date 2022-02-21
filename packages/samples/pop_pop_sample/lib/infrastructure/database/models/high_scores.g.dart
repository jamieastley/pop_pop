// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_scores.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetHighScoresCollection on Isar {
  IsarCollection<HighScores> get highScores {
    return getCollection('HighScores');
  }
}

final HighScoresSchema = CollectionSchema(
  name: 'HighScores',
  schema:
      '{"name":"HighScores","idName":"id","properties":[{"name":"playedAt","type":"Long"},{"name":"score","type":"Long"}],"indexes":[{"name":"playedAt","unique":false,"properties":[{"name":"playedAt","type":"Value","caseSensitive":false}]},{"name":"score","unique":false,"properties":[{"name":"score","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _HighScoresNativeAdapter(),
  webAdapter: const _HighScoresWebAdapter(),
  idName: 'id',
  propertyIds: {'playedAt': 0, 'score': 1},
  listProperties: {},
  indexIds: {'playedAt': 0, 'score': 1},
  indexTypes: {
    'playedAt': [
      NativeIndexType.long,
    ],
    'score': [
      NativeIndexType.long,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _HighScoresWebAdapter extends IsarWebTypeAdapter<HighScores> {
  const _HighScoresWebAdapter();

  @override
  Object serialize(IsarCollection<HighScores> collection, HighScores object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(
        jsObj, 'playedAt', object.playedAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'score', object.score);
    return jsObj;
  }

  @override
  HighScores deserialize(IsarCollection<HighScores> collection, dynamic jsObj) {
    final object = HighScores();
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.playedAt = IsarNative.jsObjectGet(jsObj, 'playedAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'playedAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.score =
        IsarNative.jsObjectGet(jsObj, 'score') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'playedAt':
        return (IsarNative.jsObjectGet(jsObj, 'playedAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'playedAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'score':
        return (IsarNative.jsObjectGet(jsObj, 'score') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, HighScores object) {}
}

class _HighScoresNativeAdapter extends IsarNativeTypeAdapter<HighScores> {
  const _HighScoresNativeAdapter();

  @override
  void serialize(
      IsarCollection<HighScores> collection,
      IsarRawObject rawObj,
      HighScores object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.playedAt;
    final _playedAt = value0;
    final value1 = object.score;
    final _score = value1;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeDateTime(offsets[0], _playedAt);
    writer.writeLong(offsets[1], _score);
  }

  @override
  HighScores deserialize(IsarCollection<HighScores> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = HighScores();
    object.id = id;
    object.playedAt = reader.readDateTime(offsets[0]);
    object.score = reader.readLong(offsets[1]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readDateTime(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, HighScores object) {}
}

extension HighScoresQueryWhereSort
    on QueryBuilder<HighScores, HighScores, QWhere> {
  QueryBuilder<HighScores, HighScores, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhere> anyPlayedAt() {
    return addWhereClauseInternal(const WhereClause(indexName: 'playedAt'));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhere> anyScore() {
    return addWhereClauseInternal(const WhereClause(indexName: 'score'));
  }
}

extension HighScoresQueryWhere
    on QueryBuilder<HighScores, HighScores, QWhereClause> {
  QueryBuilder<HighScores, HighScores, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> idNotEqualTo(
      int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> playedAtEqualTo(
      DateTime playedAt) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'playedAt',
      lower: [playedAt],
      includeLower: true,
      upper: [playedAt],
      includeUpper: true,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> playedAtNotEqualTo(
      DateTime playedAt) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'playedAt',
        upper: [playedAt],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'playedAt',
        lower: [playedAt],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'playedAt',
        lower: [playedAt],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'playedAt',
        upper: [playedAt],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> playedAtGreaterThan(
    DateTime playedAt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'playedAt',
      lower: [playedAt],
      includeLower: include,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> playedAtLessThan(
    DateTime playedAt, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'playedAt',
      upper: [playedAt],
      includeUpper: include,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> playedAtBetween(
    DateTime lowerPlayedAt,
    DateTime upperPlayedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'playedAt',
      lower: [lowerPlayedAt],
      includeLower: includeLower,
      upper: [upperPlayedAt],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> scoreEqualTo(
      int score) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'score',
      lower: [score],
      includeLower: true,
      upper: [score],
      includeUpper: true,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> scoreNotEqualTo(
      int score) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'score',
        upper: [score],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'score',
        lower: [score],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'score',
        lower: [score],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'score',
        upper: [score],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> scoreGreaterThan(
    int score, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'score',
      lower: [score],
      includeLower: include,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> scoreLessThan(
    int score, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'score',
      upper: [score],
      includeUpper: include,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterWhereClause> scoreBetween(
    int lowerScore,
    int upperScore, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'score',
      lower: [lowerScore],
      includeLower: includeLower,
      upper: [upperScore],
      includeUpper: includeUpper,
    ));
  }
}

extension HighScoresQueryFilter
    on QueryBuilder<HighScores, HighScores, QFilterCondition> {
  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> playedAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'playedAt',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition>
      playedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'playedAt',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> playedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'playedAt',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> playedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'playedAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> scoreEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'score',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'score',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'score',
      value: value,
    ));
  }

  QueryBuilder<HighScores, HighScores, QAfterFilterCondition> scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'score',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension HighScoresQueryLinks
    on QueryBuilder<HighScores, HighScores, QFilterCondition> {}

extension HighScoresQueryWhereSortBy
    on QueryBuilder<HighScores, HighScores, QSortBy> {
  QueryBuilder<HighScores, HighScores, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> sortByPlayedAt() {
    return addSortByInternal('playedAt', Sort.asc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> sortByPlayedAtDesc() {
    return addSortByInternal('playedAt', Sort.desc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> sortByScore() {
    return addSortByInternal('score', Sort.asc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> sortByScoreDesc() {
    return addSortByInternal('score', Sort.desc);
  }
}

extension HighScoresQueryWhereSortThenBy
    on QueryBuilder<HighScores, HighScores, QSortThenBy> {
  QueryBuilder<HighScores, HighScores, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> thenByPlayedAt() {
    return addSortByInternal('playedAt', Sort.asc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> thenByPlayedAtDesc() {
    return addSortByInternal('playedAt', Sort.desc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> thenByScore() {
    return addSortByInternal('score', Sort.asc);
  }

  QueryBuilder<HighScores, HighScores, QAfterSortBy> thenByScoreDesc() {
    return addSortByInternal('score', Sort.desc);
  }
}

extension HighScoresQueryWhereDistinct
    on QueryBuilder<HighScores, HighScores, QDistinct> {
  QueryBuilder<HighScores, HighScores, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<HighScores, HighScores, QDistinct> distinctByPlayedAt() {
    return addDistinctByInternal('playedAt');
  }

  QueryBuilder<HighScores, HighScores, QDistinct> distinctByScore() {
    return addDistinctByInternal('score');
  }
}

extension HighScoresQueryProperty
    on QueryBuilder<HighScores, HighScores, QQueryProperty> {
  QueryBuilder<HighScores, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<HighScores, DateTime, QQueryOperations> playedAtProperty() {
    return addPropertyNameInternal('playedAt');
  }

  QueryBuilder<HighScores, int, QQueryOperations> scoreProperty() {
    return addPropertyNameInternal('score');
  }
}
