import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/use_cases/profile/profile_data_use_case.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/profile_state.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/validation/validator.dart';
import '../../../../domain/core/api_result.dart';
import '../../../../domain/entities/profile/profile_data_entity.dart';
// part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState>{
  final ProfileDataUseCase profileDataUseCase;
  final Validator validator;
  final FlutterSecureStorage secureStorage;


  ProfileCubit(this.profileDataUseCase, this.validator, this.secureStorage)
      : super(ProfileState(baseState: BaseInitialState()));


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  void doIntent(ProfileAction action) {
    switch (action) {
      case GetDataAction():
        {
          _fetchProfileData();
        }

    }
  }


  Future<ProfileDataEntity?> _fetchProfileData() async {
    emit(state.copyWith(baseState: BaseLoadingState()));
    final token = await secureStorage.read(key: Constants.token);
    final result = await profileDataUseCase.call(token!);

    switch (result)  {
      case SuccessResult<ProfileDataEntity>():
        {
          emit(state.copyWith(baseState: BaseHideLoadingState()));
          usernameController.text = result.data.user!.username ?? "";
          firstNameController.text = result.data.user!.firstName ?? "";
          lastNameController.text = result.data.user!.lastName ?? "";
          emailController.text = result.data.user!.email ?? "";
          phoneNumberController.text = result.data.user!.phone ?? "";
          emit(state.copyWith(baseState: BaseSuccessState(data: result)));
        }
      case FailureResult<ProfileDataEntity>():
        {
       emit(state.copyWith(baseState: BaseErrorState(
                  errorMessage: result.exception.toString(),
                  exception: result.exception),
            ),
          );
        }
    }
    return null;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    valid.dispose();
    return super.close();
  }


}

