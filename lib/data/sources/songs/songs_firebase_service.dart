import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sangeet/data/models/songs/songs.dart';
import 'package:sangeet/domain/entities/songs/songs.dart';

abstract class SongsFirebaseService {
  Future<Either> getNewSongs();
}

class SongsFirebaseServiceImp extends SongsFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongsEntities> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('title', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songsModel = SongsModel.fromJson(element.data());
        songs.add(songsModel.toEntity());
      }
      return right(songs);
    } catch (e) {
      return const Left('An error occured, Please try again.');
    }
  }
}
