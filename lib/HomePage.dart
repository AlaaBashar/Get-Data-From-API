import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/StoryModel.dart';
import 'Fetch_Api.dart';
import 'New_Page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Articles> listModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20.0),child: Icon(Icons.search_rounded))],
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(child: listModel != null ?  ListView.builder(
          shrinkWrap: true,
          itemCount: listModel.length,
          itemBuilder: (_ , index){
            Articles model = listModel[index] ;
            if(model.urlToImage != null)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                      onTap:()=> onPressCallback(model),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(model.urlToImage,)),),
                  Text(model.title,style: TextStyle(fontSize: 27.0,fontWeight:FontWeight.bold),),
                  SizedBox(height: 20,),],
              ),
            ) ;

            return SizedBox();

          }) : Center(child: Text('Loading data ... ')),)

    );
  }

  void loadData() async{

   listModel = await FetchApi.fetchStory() ;

   setState(() {});

  }


  void onPressCallback(Articles model) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => NewPage(model: model)));

  }
}
