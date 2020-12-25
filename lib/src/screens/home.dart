import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/BookmakerServices/ligastavok.dart';
import 'package:live/src/screens/home/components/sportcard.dart';
import 'package:live/src/screens/home/home_bloc.dart';
import 'package:live/src/screens/home/home_events.dart';
import 'package:live/src/screens/home/home_state.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomePageBloc _homeBloc;
  

  double _searchElevation = 1;

  @override
  void initState() 
  {
    _homeBloc = HomePageBloc( gitRepository: LigaStavok());
    super.initState();
  }

  @override
  void dispose() 
  {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchMargin = 80.0;

    return  Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: searchMargin),
              child: BlocBuilder<HomePageEvent, HomePageState>(
                bloc: _homeBloc,
                builder: (BuildContext context, HomePageState state) {
                  
                  if (state is HomePageStateDefault) {
                    return Center(
                      child: Text('Лига Ставок',
                        textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 24,
                            color: Colors.blueGrey
                        ),)
                      ,);
                  }

                  if (state is HomePageStateSearching) {
                    _searchElevation = 0;
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is HomePageStateError) {
                    return Center(
                      child: Text('Conection Error!',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24
                        ),
                      ),
                    );
                  }

                  if (state is HomePageStateSearched) {
                    if (state.data.length == 0) {
                      return Center(child: Text('No Results!'),);
                    }

                    return ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return SportCard(
                          sport: state.data.elementAt(index),
                          visibilityInfo: false
                        );
                      },
                    ); 
                  }
                   return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            Container
            (
              margin: EdgeInsets.only(top:50,left:20),
              child: InkWell
              (
                onTap: ()
                {
                  _homeBloc.dispatch(
                              HomePageEventSearch());
                },
                child: Text("Получить LIVE новости"),
              )
              
            ),
			
          ],
        ),
      );
    
  }

}




  
  


