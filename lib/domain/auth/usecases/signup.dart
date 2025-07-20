import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/service_locator.dart';

class SignupUsecase implements Usecase<Either, UserCreationReq>{
  @override
  Future<Either> call({UserCreationReq? params}) async{
    return await sl<AuthFirebaseService>().signup(params!);

  }

}