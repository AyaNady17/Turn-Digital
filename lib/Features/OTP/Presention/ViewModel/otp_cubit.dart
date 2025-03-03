import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState.initial());

  void verifyOtp(String otp) {
    emit(state.copyWith(otpStatus: RequestStatus.loading));

    if (otp == '0000') {
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
