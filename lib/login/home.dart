import 'package:flutter/material.dart';
import 'package:projectcaptain/data/data.dart';
import 'package:projectcaptain/login/page/details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var body = Container(
      child: GridView.builder(
      shrinkWrap: false,
      itemCount: DataCake.Cake.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context,int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),

          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(info: DataCake.Cake[index],)
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width /2,
                height: 50,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Hero(
                            tag: DataCake.Cake[index].id_cake,
                            child: FadeInImage(
                              image:
                              AssetImage(DataCake.Cake[index].image),
                              fit: BoxFit.cover,
                              placeholder:
                              AssetImage('assets/images/load.gif'),
                            )
                          ),
                       ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        DataCake.Cake[index].title,
                        style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
  )
  );



  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAKE&BAKERY'),
        actions: <Widget>[
        ],
      ),
    body: body,
    );
  }
}