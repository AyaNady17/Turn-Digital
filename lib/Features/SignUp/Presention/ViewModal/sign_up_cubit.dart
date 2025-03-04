import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Features/SignUp/Data/Models/register_request_body_model.dart';
import 'package:turn_digital/Features/SignUp/Data/register_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signupRepo) : super(SignUpState.intialState());
  final SignUpRepo _signupRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> emitSignupStates() async {
    emit(state.copyWith(signupStatus: RequestStatus.loading));
    final response = await _signupRepo.signup(
      registerRequestBody: RegisterRequestBodyModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (response) {
        emit(
          state.copyWith(
            signupStatus: RequestStatus.success,
            successMessage: response.message,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            signupStatus: RequestStatus.failure,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    formKey.currentState?.reset();
    return super.close();
  }
}
