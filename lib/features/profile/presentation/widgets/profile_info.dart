import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/assets/app_colors.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../view_model/profile_cubit.dart';
import '../view_model/profile_state.dart';

class ProfileInfo extends StatefulWidget{
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {

  // @override
  // void initState() {
  //   super.initState();
  //   // cubit = getIt<ProfileCubit>();
  //   cubit.doIntent(GetDataAction());
  // }

@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..doIntent(GetDataAction()),
      child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context,state){
            if (state.baseState is BaseLoadingState) {
              // AppDialogs.showLoadingDialog(context, message: LocaleKeys.Loading.tr(),
              // );
              return const Center(child: CircularProgressIndicator());
            }
            if (state.baseState is BaseHideLoadingState) {
              Navigator.of(context).pop;
            }
            if (state.baseState is BaseErrorState) {
              AppDialogs.showFailureDialog(
                context,
                message: (state.baseState as BaseErrorState).errorMessage,
              );
            }
            if (state.baseState is BaseSuccessState) {

              final cubit = context.read<ProfileCubit>();
               return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Form(
                    // onChanged: () => viewModel.doIntent(FormDataChangedAction()),
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (value) =>
                          // viewModel.validator.validateName(value ?? ""),
                           controller: cubit.usernameController,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.Authentication_EnterYourUserName.tr(),
                            labelText: LocaleKeys.Authentication_UserName.tr(),
                          ),
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            spacing: 16.0,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  // validator: (value) =>
                                  //     viewModel.validator.validateName(value ?? ""),
                                  controller: cubit.firstNameController,
                                  decoration: InputDecoration(
                                    hintText:
                                    LocaleKeys.Authentication_EnterFirstName.tr(),
                                    labelText: LocaleKeys.Authentication_FirstName.tr(),
                                  ),
                                  onTapOutside: (_) =>
                                      FocusManager.instance.primaryFocus?.unfocus(),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  // validator: (value) =>
                                  //     viewModel.validator.validateName(value ?? ""),
                                   controller: cubit.lastNameController,
                                  decoration: InputDecoration(
                                    hintText:
                                    LocaleKeys.Authentication_EnterLastName.tr(),
                                    labelText: LocaleKeys.Authentication_LastName.tr(),
                                  ),
                                  onTapOutside: (_) =>
                                      FocusManager.instance.primaryFocus?.unfocus(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (value) =>
                          //     viewModel.validator.validateEmail(value ?? ""),
                           controller: cubit.emailController,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                            labelText: LocaleKeys.Authentication_Email.tr(),
                          ),
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            spacing: 16.0,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  // validator: (value) =>
                                  //     viewModel.validator.validatePassword(value ?? ""),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: "★★★★★★",
                                    labelText: LocaleKeys.Authentication_Password.tr(),
                                    suffix: Text(LocaleKeys.Profile_Change.tr(),style: const TextStyle(
                                      color: AppColors.blue
                                    ),)
                                  ),
                                  onTapOutside: (_) =>
                                      FocusManager.instance.primaryFocus?.unfocus(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (value) =>
                          //     viewModel.validator.validatePhoneNumber(value ?? ""),
                          controller: cubit.phoneNumberController,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.Authentication_EnterPhoneNumber.tr(),
                            labelText: LocaleKeys.Authentication_PhoneNumber.tr(),
                          ),
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                        ),
                        const SizedBox(
                          height: 48.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(LocaleKeys.Profile_Change.tr()),
                        ),

                        // ValueListenableBuilder(
                        //   valueListenable: viewModel.valid,
                        //   builder: (context, value, child) => ElevatedButton(
                        //     onPressed: () => viewModel.doIntent(SignupRequestAction()),
                        //     style: ElevatedButton.styleFrom(
                        //       padding: const EdgeInsets.all(14),
                        //       backgroundColor: value
                        //           ? AppColors.blue
                        //           : AppColors.black[AppColors.colorCode30],
                        //     ),
                        //     child: Text(LocaleKeys.Profile_Update.tr()),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return  const Placeholder();
          } ),
  );


  }
}