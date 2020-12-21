import 'package:live/apiServices/repository.dart';
import 'package:live/src/pages/home_page_events.dart';
import 'package:live/src/pages/home_page_state.dart';

import 'package:bloc/bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final Repository gitRepository;

  HomePageBloc({this.gitRepository});

  @override
  HomePageState get initialState => HomePageStateDefault();

  @override
  Stream<HomePageState> mapEventToState(
      HomePageState currentState, HomePageEvent event) async* {
    if (event is HomePageEventSearch) {
      yield* _mapSearchJobsState(event);
    }
  }

  Stream<HomePageState> _mapSearchJobsState(HomePageEventSearch event) async* {
    try {
      yield HomePageStateSearching();
      var result = await gitRepository.getSports();
      yield HomePageStateSearched(data: result);
    } catch (e) {
      yield HomePageStateError();
    }
  }
}
