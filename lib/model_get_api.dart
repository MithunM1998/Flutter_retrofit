
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'model_get_api.g.dart';
@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient{
  factory RestClient(Dio dio)=_RestClient;
  @GET("/photos")
  Future<List<Get>> getTasks();
}

@JsonSerializable()
class Get{
  int albumId;
   int id;
   String title;
   String url;
   String thumbnailUrl;

  Get({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  factory Get.fromJson(Map<String,dynamic>json)=>_$PostFromJson(json);
  Map<String,dynamic>toJson()=>_$PostToJson(this);
}