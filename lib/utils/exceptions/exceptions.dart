class HttpException with Exception {
  final String message;

  HttpException([this.message]);

  @override
  String toString() => message ?? 'Http Exception occured!';
}

class UserNotFoundException with Exception {
  @override
  String toString() => 'User is not found!';
}

class RegistrationFaultException with Exception {
  final String message;

  RegistrationFaultException([this.message]);

  @override
  String toString() => message ?? 'Registration is failed!';
}
