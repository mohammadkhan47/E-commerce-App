import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();

}
class AuthFirebaseServiceImp extends AuthFirebaseService{
  @override
  Future<Either> signup(UserCreationReq user) async{
    try{
      var returnedData = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email!,
          password: user.password!
      );
      FirebaseFirestore.instance.collection('Users').doc(
        returnedData.user!.uid
      ).set(
        {
          'firstName' : user.firstname,
          'lastName' : user.lastname,
          'email' : user.email,
          'gender' : user.gender,
          'age' : user.age
        }
      );
      return Right('sign up successful');

    }on FirebaseAuthException catch(e){
      String message = '';

      if(e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async{
    try{
      var returnedData = await FirebaseFirestore.instance.collection('Ages').get();
      return Right(
          returnedData.docs
      );
    }catch(e){
      return left(
        'please try again'
      );
    }
     }
}