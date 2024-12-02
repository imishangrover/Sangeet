import 'package:dartz/dartz.dart';
import 'package:sangeet/core/usecase/usecase.dart';
import 'package:sangeet/domain/repositry/songs/songs.dart';
import 'package:sangeet/service_locator.dart';

class GetNewSongsUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepositry>().getNewSongs();
  }
  

}