import 'package:ecommerce/data/auth/repository/auth_repository_imp.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/usecases/get_age.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  //services

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImp()
  );
  
  //repositories

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImp()
  );

  //Usecases

sl.registerSingleton<SignupUsecase>(
  SignupUsecase()
);

  sl.registerSingleton<GetAgesUseCase>(
      GetAgesUseCase()
  );

}