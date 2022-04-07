import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectcaptain/data/cakeclass.dart';
import 'package:projectcaptain/login/page/Review.dart';
class Details extends StatelessWidget {
  final InfoCake info;
  Details({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return<Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              title: Text(info.title),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                tag: info.id_cake,
                  child: FadeInImage(
                    image:
                    AssetImage(info.image),
                    fit: BoxFit.cover,
                    placeholder:
                    AssetImage('assets/images/load.gif'),
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/cat.jpg'),
                fit: BoxFit.contain,
              )
          ),
          padding: EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text('ส่วนผสมเค้ก',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0
                  ),
                ),
                componentInfo(
                  component: info.component,
                ),
                Text('วิธีการทำ',
                  style: TextStyle(
                    color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0
                  ),
                ),
                solutionCake(
                  infoCake: info.infoCake,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Review(title: 'CAKE&BAKERY'),
                    ),
                  );
                },
                    child: Text('Review',
                    style: TextStyle(fontSize: 40.0,color: Colors.black),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class componentInfo extends StatelessWidget {
  final List<String> component;
  componentInfo({this.component = const []});

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemCount : component.length,
        padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Text('${index + 1}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
              title: Text(component[index],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))
          );
      },
    );
  }
}
class solutionCake extends StatelessWidget {
  final List<String> infoCake;
  solutionCake({this.infoCake = const []});

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount : infoCake.length,
      padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context,int index){
        return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Text('${index + 1}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            title: Text(infoCake[index],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))
        );
      },
    );
  }
}