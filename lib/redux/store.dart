import 'dart:io';

import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/redux/appReducer.dart';
import 'package:mobile_apps/redux/middleware/Auth.dart';
import 'package:mobile_apps/redux/middleware/CRUDMiddleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:path_provider/path_provider.dart';

class AppStore {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/state.json');
  }

  Future<Store<AppState>> getStoreAsync() async {
    final persistor = Persistor<AppState>(
      storage: FileStorage(await _localFile),
      serializer: JsonSerializer<AppState>(AppState.fromJson),
      // debug: true,
    );

    final initialState = await persistor.load();
    final store = Store<AppState>(
        appReducer,
        initialState: initialState ?? AppState(),
        middleware: [
          thunkMiddleware,
          AuthMiddleware(),
          CRUDMiddleware(),
          persistor.createMiddleware()
        ]
    );

    return store;
  }
}