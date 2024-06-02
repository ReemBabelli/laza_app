
class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}

class OfflineFailure extends Failure{
  OfflineFailure({  super.errMessage =  "PLease, check your internet connection" });

}

////////////////////////////////////////////////////////////////////////////////


abstract class EmptyCacheFailure implements Failure {}
