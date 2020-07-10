/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

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
