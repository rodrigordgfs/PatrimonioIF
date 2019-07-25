import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String ID = '_id';
const String CODIGO = 'codigo';
const String STATUS = 'status';
const String EDICAO = 'edicao';
const String DESCRICAO = 'descricao';
const String VALOR_AQUISICAO = 'valor_aquisicao';
const String DATA_ENTRADA = 'data_entrada';
const String LOCAL = 'local';
const String ESTADO = 'estado';
const String PATRIMONIO = 'patrimonio';

class PatrimonyHelper {
  static final PatrimonyHelper _instance = PatrimonyHelper.internal();
  factory PatrimonyHelper() => _instance;
  PatrimonyHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "patrimony.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE IF NOT EXISTS $PATRIMONIO ($ID INTEGER AUTOINCREMENT PRIMARY KEY, $CODIGO INTEGER, $STATUS TEXT, $EDICAO INTEGER, $DESCRICAO TEXT, $VALOR_AQUISICAO DOUBLE, $DATA_ENTRADA TEXT, $LOCAL TEXT, $ESTADO TEXT);");
    });
  }
}

class Patrimony {
  int id;
  String codigo;
  String status;
  int edicao;
  String descricao;
  double valor_aquisicao;
  String data_entrada;
  String local;
  String estado;

  Patrimony.fromMap(Map map) {
    id = map[ID];
    codigo = map[CODIGO];
    status = map[STATUS];
    edicao = map[EDICAO];
    descricao = map[DESCRICAO];
    valor_aquisicao = map[VALOR_AQUISICAO];
    data_entrada = map[DATA_ENTRADA];
    local = map[LOCAL];
    estado = map[ESTADO];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      CODIGO: codigo,
      STATUS: status,
      EDICAO: edicao,
      DESCRICAO: descricao,
      VALOR_AQUISICAO: valor_aquisicao,
      DATA_ENTRADA: data_entrada,
      LOCAL: local,
      ESTADO: estado
    };
    if (id != null) {
      map[ID] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Descricao: ${descricao}";
  }
}
