import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState.initial());
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOtp() async {
    emit(state.copyWith(otpStatus: RequestStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    if (otpController.text == '0000') {
      emit(
        state.copyWith(
          message: 'تم التحقق بنجاح',
          otpStatus: RequestStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          message: 'رقم التحقق غير صحيح',
          otpStatus: RequestStatus.failure,
        ),
      );
    }
  }
}
