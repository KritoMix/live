import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/apiServices/Models/sportmodels.dart';
import 'package:live/apiServices/repository.dart';
import 'package:live/src/pages/home_page_bloc.dart';
import 'package:live/src/pages/home_page_events.dart';
import 'package:live/src/pages/home_page_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomePageBloc _homeBloc;
  

  double _searchElevation = 1;

  @override
  void initState() {
    _homeBloc = HomePageBloc(
        gitRepository: Repository()
    );

    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchMargin = 80.0;

    return BlocProvider<HomePageBloc>(
      bloc: _homeBloc,
      child: Scaffold(
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
                    _searchElevation = 0; // reset search bar's elevation
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
                    if (state.data.result.tree.length == 0) {
                      return Center(child: Text('No Results!'),);
                    }

                    return NotificationListener(
                      onNotification: (t) {
                        if (t is ScrollUpdateNotification) {
                          print('Delta: ${t.scrollDelta}');
                          if (t.scrollDelta < 0.0 && _searchElevation != 0) {
                            setState(() => _searchElevation = 0);
                          } else
                          if (t.scrollDelta > 0.0 && _searchElevation != 8) {
                            setState(() => _searchElevation = 30);
                          }
                        }
                      },
                      child: ListView.builder(
                        itemCount: state.data.result.tree.length,
                        itemBuilder: (context, index) {
                          return SportCard(
                            sport: state.data.result.tree.elementAt(index),
							visibilityInfo: false
                          );
                        },
                      ),
                    );
                  }
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
      ),
    );
  }

}



class SportCard extends StatefulWidget {
   Tree sport;
	bool visibilityInfo;
  SportCard({this.sport,this.visibilityInfo});
  @override
  MySportCard createState() => MySportCard(sport,visibilityInfo);
}

class MySportCard extends State<SportCard> {

   Tree job;
	bool visibilityInfo;
   MySportCard(this.job,this.visibilityInfo); 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
         
          width: double.maxFinite,
          margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
         
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                  blurRadius: 1
              )
            ]
          ),
        child: InkWell
		(
			onTap: ()
			{
				if(visibilityInfo)
				{
					visibilityInfo = false;
				}else
				{
					visibilityInfo = true;
				}
				setState(() {
				
				});
			},
				child:  Column(
				
				children: <Widget>[
				Padding(
				padding: const EdgeInsets.all(8.0),
				child: Row(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
					
					Flexible(
						flex: 5,
						fit: FlexFit.tight,
						child: Text(job.title, style: TextStyle(
						fontWeight: FontWeight.bold,
						),
						),
					),
					Spacer(),
					Padding(
					padding: EdgeInsets.all(10),
					child: Icon(Icons.navigate_next_outlined),
					),
					
					
					],
				),
				),
				
				Visibility
				(
					visible: visibilityInfo,
					child: Column(children: 
					[
						Container
						(
							margin: EdgeInsets.all(10),
							child:Divider(
						color: Colors.black
						),
						),
						
						for(int i = 0;i<job.categories.length;i++)
						getMatch(job.categories[i])
					],
				)
					
					
					
					
					
				)
				
				
				
				],
			),
			),
			
		)
		  
		 
		
	  ],
    );
  }

	Widget getMatch(Categories categori)
	{
		return Column
		(
			children: 
			[
				Container
				(
					alignment: Alignment.centerLeft,
					margin: EdgeInsets.all(10),
					child: Text(categori.title, style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.left,),
				),
				for(int n = 0;n<categori.tournaments.length;n++)
				Column
				(
					children: 
					[
						Container
						(
							alignment: Alignment.centerLeft,
							margin: EdgeInsets.only(left:25,top:5,bottom:5),
							child: Text(categori.tournaments[n].title)
						)
					],
				)
				
			],
		);
	}
  
  
}

