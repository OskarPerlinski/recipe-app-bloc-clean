import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeFirebaseService {

  Future<Either> getQuickAndEasy();
}

class RecipeFirebaseServiceImpl extends RecipeFirebaseService{
  @override
  Future<Either> getQuickAndEasy() async {
    try{
      var returnedData = await FirebaseFirestore.instance.collection(
        'Recipe'
      ).get();
      return Right(returnedData.docs.map((e) => e.data(),).toList());
    } catch(e){
      return const Left(
        'Please try again'
      );
    }
  }

}