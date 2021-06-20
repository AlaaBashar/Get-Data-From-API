import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'StoryModel.dart';

class NewPage extends StatefulWidget {
  final Articles model ;

  const NewPage({Key key, this.model}) : super(key: key);
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Column(children: [
        Image.network(widget.model.urlToImage),
        Text(widget.model.source.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
        Text(widget.model.title,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        Text(widget.model.content),
        Text(widget.model.description),



      ],)


    );
  }
}
