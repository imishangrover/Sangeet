import 'package:sangeet/domain/entities/songs/songs.dart';

class SongsModel {
  String ? title;
  String ? artist;
  num ? duration;

  SongsModel({
    required this.title, 
    required this.artist, 
    required this.duration
  });

  SongsModel.fromJson(Map<String,dynamic> data){
    title = data['title'] ?? 'Unknown Title';
    artist = data['artist'] ?? 'Unknown Artist';
    duration = data['duration'] ?? 0;
  }
}

extension SongsModelx on SongsModel{
  SongsEntities toEntity(){

    return SongsEntities(
      title: title!, 
      artist: artist!, 
      duration: duration!
    );
  }
}
