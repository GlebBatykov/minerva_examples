import 'package:minerva/minerva.dart';
import 'package:mongo_dart/mongo_dart.dart';

class NotesApi extends Api {
  late final Db _db;

  late final DbCollection _collection;

  @override
  Future<void> initialize(ServerContext context) async {
    var configuration = ConfigurationManager();

    await configuration.load();

    _db = Db(configuration['mongo_connection_string']);

    await _db.open();

    _collection = _db.collection('notes');
  }

  @override
  void build(Endpoints endpoints) {
    endpoints.post('/notes/add', _add,
        filter: RequestFilter(
            body: JsonFilter(fields: [
          JsonField(name: 'title', type: JsonFieldType.string),
          JsonField(name: 'value', type: JsonFieldType.string)
        ])));

    endpoints.delete('/notes', _delete,
        filter: RequestFilter(
            body: JsonFilter(
                fields: [JsonField(name: 'id', type: JsonFieldType.string)])));

    endpoints.get('/notes', _get);
  }

  void _add(ServerContext context, MinervaRequest request) async {
    var json = await request.body.asJson();

    await _collection.insert({'title': json['title'], 'value': json['value']});
  }

  void _delete(ServerContext context, MinervaRequest request) async {
    var json = await request.body.asJson();

    var id = json['id'];

    var objectId = ObjectId.parse(id);

    await _collection.remove({'_id': objectId});
  }

  dynamic _get(ServerContext context, MinervaRequest request) async {
    var notes = await _collection.find().toList();

    return {'notes': notes};
  }

  @override
  Future<void> dispose(ServerContext context) async {
    await _db.close();
  }
}
