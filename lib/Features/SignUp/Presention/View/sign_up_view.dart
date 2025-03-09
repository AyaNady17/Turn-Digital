import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_digital/Core/DI/dependency_injection.dart';
import 'package:turn_digital/Core/Global/Helpers/app_enums.dart';
import 'package:turn_digital/Core/Global/Helpers/app_toasts.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_app_button.dart';
import 'package:turn_digital/Core/Global/SharedWidgets/custom_text_field.dart';
import 'package:turn_digital/Core/Global/app_strings.dart';
import 'package:turn_digital/Core/Global/theming/app_text_styles.dart';
import 'package:turn_digital/Features/SignUp/Presention/View/Widgets/social_login_button_widget.dart';
import 'package:turn_digital/Features/SignUp/Presention/ViewModal/sign_up_cubit.dart';
import 'package:turn_digital/core/Global/theming/color_manager.dart';
import 'package:turn_digital/core/global/Helpers/functions.dart';
import 'package:turn_digital/core/global/Helpers/app_regex.dart';
import 'package:turn_digital/core/routing/routes.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => getIt<SignUpCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight: 0),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/masked_background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  final cubit = context.read<SignUpCubit>();
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back),
                        ),
                        verticalSpacing(20),
                        Text(
                          AppStrings.tSignUp,
                          style: AppTextStyles.font24BlackWeight600,
                        ),
                        verticalSpacing(20),
                        CustomTextField(
                          hintText: AppStrings.tNameHint,
                          prefixIconPath: 'assets/images/Profile.png',
                          controller: cubit.nameController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                AppRegex.isOnlyWhiteSpaces(value)) {
                              return "Full name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        verticalSpacing(10),
                        CustomTextField(
                          hintText: AppStrings.tEmailHint,
                          prefixIconPath: 'assets/images/Mail.png',
                          controller: cubit.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email cannot be empty";
                            } else if (!AppRegex.isEmailValid(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        verticalSpacing(10),
                        CustomTextField(
                          hintText: AppStrings.tPasswordHint,
                          prefixIconPath: 'assets/images/Lock.png',
                          isPassword: true,
                          controller: cubit.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (!AppRegex.isPasswordValid(value)) {
                              return "Password must have 8+ chars, uppercase, lowercase, number & special char";
                            }
                            return null;
                          },
                        ),
                        verticalSpacing(10),
                        CustomTextField(
                          hintText: AppStrings.tConfirmPasswordHint,
                          prefixIconPath: 'assets/images/Lock.png',
                          isPassword: true,
                          controller: cubit.confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirm password cannot be empty";
                            } else if (value != cubit.passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        verticalSpacing(20),
                        BlocConsumer<SignUpCubit, SignUpState>(
                          listenWhen:
                              (previous, current) =>
                                  current.signupStatus ==
                                      RequestStatus.success ||
                                  current.signupStatus == RequestStatus.failure,
                          listener: (context, state) {
                            if (state.signupStatus == RequestStatus.success) {
                              showSuccess(state.successMessage);
                              Navigator.pushNamed(context, AppRoutes.rOtp);
                            }
                            if (state.signupStatus == RequestStatus.failure) {
                              showError(state.errorMessage!);
                            }
                          },
                          builder: (context, state) {
                            return CustomAppButton(
                              text: AppStrings.tSIGNup,
                              onTap: () {
                                if (cubit.formKey.currentState?.validate() ??
                                    false) {
                                  cubit.emitSignupStates();
                                }
                              },
                              isLoading:
                                  state.signupStatus == RequestStatus.loading,
                            );
                          },
                        ),
                        verticalSpacing(20),
                        Center(
                          child: Text(
                            "OR",
                            style: AppTextStyles.font16GreyWeight500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        verticalSpacing(20),
                        SocialLoginButton(
                          text: AppStrings.tLoginGoogle,
                          icon: "assets/images/google.png",
                          onTap: () {},
                        ),
                        verticalSpacing(10),
                        SocialLoginButton(
                          text: AppStrings.tLoginFacebook,
                          icon: "assets/images/facebook.png",
                          onTap: () {},
                        ),
                        verticalSpacing(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.tAlreadyHaveAccount,
                              style: AppTextStyles.font15BlackWeight400,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Navigator.pushNamed(
                                  context,
                                  AppRoutes.rLogin,
                                );
                              },
                              child: Text(
                                " Sign in",
                                style: AppTextStyles.font15BlackWeight400
                                    .copyWith(
                                      color: AppColorsManager.appPrimaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
