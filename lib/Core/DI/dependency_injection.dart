import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:turn_digital/Features/Home/Data/home_repo.dart';
import 'package:turn_digital/Features/Home/Data/home_services.dart';
import 'package:turn_digital/Features/Home/Presention/ViewModel/home_cubit.dart';
import 'package:turn_digital/Features/OTP/Presention/ViewModel/otp_cubit.dart';
import 'package:turn_digital/Features/SignUp/Data/register_repo.dart';
import 'package:turn_digital/Features/SignUp/Data/register_services.dart';
import 'package:turn_digital/Features/SignUp/Presention/ViewModal/sign_up_cubit.dart';
import '../networking/dio_serices.dart';

final getIt = GetIt.instance;
Future<void> setUpDependencyInjection() async {
  setupAppServices();
  setupAppRepos();
  setupAppCubits();
}

void setupAppCubits() {
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}

void setupAppRepos() {
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt<RegisterServices>()),
  );
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeServices>()));
}

void setupAppServices() {
  Dio dio = DioServices.getDio();
  getIt.registerLazySingleton<RegisterServices>(() => RegisterServices(dio));
  getIt.registerLazySingleton<HomeServices>(() => HomeServices(dio));
}
