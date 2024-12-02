import 'package:dartz/dartz.dart';
import 'package:sangeet/data/sources/songs/songs_firebase_service.dart';
import 'package:sangeet/domain/repositry/songs/songs.dart';
import 'package:sangeet/service_locator.dart';

class SongsRepositryImpl extends SongsRepositry {
  @override
  Future<Either> getNewSongs() async{
    return await sl<SongsFirebaseService>().getNewSongs();
  }
}