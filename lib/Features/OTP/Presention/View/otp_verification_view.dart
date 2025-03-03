import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/Helpers/app_toasts.dart';
import 'package:turn_digital/Core/Global/Helpers/functions.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_app_button.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turn_digital/Core/Global/theming/color_manager.dart';
import 'package:turn_digital/Features/OTP/Presention/ViewModel/otp_cubit.dart';
import 'package:turn_digital/Features/OTP/Presention/ViewModel/otp_state.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return BlocProvider<OtpCubit>(
      create: (context) => getIt<OtpCubit>(),
      child: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state.otpStatus == RequestStatus.success) {
            showSuccess(state.message);
          } else if (state.otpStatus == RequestStatus.failure) {
            showError(state.message);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(toolbarHeight: 0),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  verticalSpacing(20),
                  Text(
                    "Verification",
                    style: AppTextStyles.font24BlackWeight600,
                  ),
                  verticalSpacing(10),
                  Text(
                    "We've sent you the verification code on +20 1119404584",
                    style: AppTextStyles.font15BlackWeight400,
                  ),
                  verticalSpacing(30),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    textStyle: AppTextStyles.font24BlackWeight600.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    cursorColor: AppColorsManager.appLightGreyColor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autoFocus: true,
                    cursorHeight: 29.h,
                    enablePinAutofill: false,
                    cursorWidth: 1.5.w,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8.r),
                      fieldHeight: 50.h,
                      fieldWidth: 50.w,
                      activeColor: AppColorsManager.appPrimaryColor,
                      selectedColor: AppColorsManager.appPrimaryColor,
                      inactiveColor: AppColorsManager.appLightGreyColor,
                    ),
                    onChanged: (value) {},
                  ),
                  verticalSpacing(30),
                  CustomAppButton(
                    text: "CONTINUE",
                    onTap: () {
                      getIt<OtpCubit>().verifyOtp(otpController.text);
                    },
                  ),
                  verticalSpacing(30),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Re-send code in ",
                        style: AppTextStyles.font15BlackWeight400,
                        children: [
                          TextSpan(
                            text: "0:20",
                            style: AppTextStyles.font15BlackWeight400.copyWith(
                              color: AppColorsManager.appPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
