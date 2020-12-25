
import 'package:live/BookmakerServices/IBookmakerService.dart';
import 'package:bloc/bloc.dart';
import 'package:live/src/screens/home/home_events.dart';
import 'package:live/src/screens/home/home_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IBookmakerService gitRepository;

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
