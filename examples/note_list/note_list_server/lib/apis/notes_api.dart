import 'package:minerva/minerva.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class NotesApi extends Api {
  late final mongo.Db _db;

  late final mongo.DbCollection _collection;

  @override
  Future<void> initialize(ServerContext context) async {
    var configuration = ConfigurationManager();

    await configuration.load();

    _db = mongo.Db(configuration['mongo_connection_string']);

    await _db.open();

    _collection = _db.collection('notes');
  }

  @override
  void build(Endpoints endpoints) {
    endpoints.post('/notes/add', _add,
        filter: Filter(
            body: JsonFilter(fields: [
          JsonField(name: 'title', type: JsonFieldType.string),
          JsonField(name: 'value', type: JsonFieldType.string)
        ])));

    endpoints.get('/notes', _get);
  }

  void _add(ServerContext context, MinervaRequest request) async {
    var json = await request.body.asJson();

    await _collection.insert({'title': json['title'], 'value': json['value']});
  }

  dynamic _get(ServerContext context, MinervaRequest request) async {
    var notes = await _collection.find().toList();

    return {'notes': notes};
  }
}
