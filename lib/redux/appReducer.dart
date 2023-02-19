import 'appState.dart';
import './reducers/rootReducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    auth: authReducer(state.auth, action),
  );
}
