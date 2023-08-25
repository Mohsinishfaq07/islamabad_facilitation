import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/globals/snack_bar.dart';
import '../../data/modals/login_request_model.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this.loginUseCase);

  //usecases
  LoginUsecase loginUseCase;

  //value notifiers

  ValueNotifier<bool> loginLoading = ValueNotifier(false);

  //useCases calls
  // Future<void> loginUser() async {
  //   loginLoading.value = false;
  //   const params = LoginRequestModel(clientId: 1);
  //   var loginEither = await loginUseCase(params);
  //   if (loginEither.isLeft()) {
  //     handleError(loginEither);
  //     loginLoading.value = false;
  //   } else if (loginEither.isRight()) {
  //     loginEither.foldRight(null, (response, previous) async {
  //       loginLoading.value = false;
  //     });
  //   }
  // }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
