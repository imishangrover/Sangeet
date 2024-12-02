import 'package:dartz/dartz.dart';

abstract class SongsRepositry{
  Future<Either> getNewSongs();
}