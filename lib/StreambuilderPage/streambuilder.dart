

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreambuilderPage extends StatelessWidget {
  const StreambuilderPage({Key? key,required this.SEEMORE,this.SEE_DELE,required this.Collectonname}) : super(key: key);
   final String ? Collectonname;
   final VoidCallback ? SEE_DELE;
   final String ? SEEMORE;


  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('${Collectonname}').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Column(
            children: [
              Text("Loading.."),
              CircularProgressIndicator(
                backgroundColor: Colors.amberAccent,
              )
            ],
          ),
        );
      }

      return ListView(
        scrollDirection: Axis.horizontal,
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return Container(
            padding: EdgeInsets.all(5),
            height: 200,
            width: 300,
           color: Colors.green,
            child: Column(
              children: [
                Expanded(flex:1,child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text(data["category"])),
                      ElevatedButton(onPressed:(){}, child: Text("See All")),
                    ],
                  ),
                  color: Colors.amberAccent,)),
                Expanded(flex:3,child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Expanded(flex:2,child: Container(
                        child: Image.network(data["img"],fit: BoxFit.fill,),
                        color: Colors.blue,)),
                      Expanded(flex:4,child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 20,
                        ),

                        child: Text(data["Title"],style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),),
                        color: Colors.white,))
                    ],
                  ),
                  color: Colors.white,)),
                Expanded(flex:6,child: Stack(
                  children: [
                    Container(
                      child: Text(data["dec"]),
                      padding: EdgeInsets.only(
                        left: 5,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,),
                    Positioned(
                        right: 0,
                        bottom: 5,
                        child: ElevatedButton(onPressed:SEE_DELE, child: Text("${SEEMORE}"))),
                  ],
                )),

              ],
            ),
          );
        }).toList(),
      );
    });
  }
}
