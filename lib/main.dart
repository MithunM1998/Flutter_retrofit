import 'package:flutter/material.dart';
import 'package:flutter_retrofit/model_get_api.dart';
import 'package:dio/dio.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrofit',
      home: Scaffold(
        appBar: AppBar(title: Text("Retrofit Get"),),
        body: _buildBody(context),
      ),
    );
  }
}

FutureBuilder<List<Get>> _buildBody(BuildContext context){
  final client =RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<List<Get>>(
    future:client.getTasks(),
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        final List<Get>? get=snapshot.data;
        return _buildGet(context,get!);
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

ListView _buildGet(BuildContext context,List<Get> get){
return ListView.builder(
  itemCount: get.length,
  itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(get[index].title),
          leading: Column(
            children: [
              Image.network(get[index].thumbnailUrl,height: 50,width: 50,)
            ],
          ),
        ),
      ),
    );
  },
);
}