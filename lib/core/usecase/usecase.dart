
abstract class Usecase<Type, Params> {
  //other usecases should implement this usecase
//params come form presentation layer like presentation layer
// user coming requests
//Type is return type of method which going to call
  Future<Type> call({Params params});
}