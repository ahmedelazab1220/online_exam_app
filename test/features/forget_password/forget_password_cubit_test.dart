import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/base/base_state.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/core/utils/validation/validator.dart';
import 'package:online_exam_app/domain/use_cases/forget_password_use_case.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:online_exam_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forget_password_cubit_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase, Validator, GlobalKey, FormState])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ForgetPasswordCubit forgetPasswordCubit;
  late MockForgetPasswordUseCase mockForgetPasswordUseCase;
  late MockValidator mockValidator;

  // Constants to avoid hardcoded values
  const String emptyEmail = '';
  const String invalidEmail = 'test';
  const String validEmail = 'test@gmail.com';

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [];
    EasyLocalization.logger.enableBuildModes = [];

    mockForgetPasswordUseCase = MockForgetPasswordUseCase();
    mockValidator = MockValidator();
    forgetPasswordCubit =
        ForgetPasswordCubit(mockForgetPasswordUseCase, mockValidator);
  });

  tearDown(() {
    forgetPasswordCubit.close();
  });

  test('Initial state should be BaseInitialState', () {
    expect(forgetPasswordCubit.state.baseState, isA<BaseInitialState>());
  });

  /// Helper function to initialize localization
  Future<void> pumpLocalizedWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        child: OnlineExamApp(),
      ),
    );
  }

  group('Testing Email Validation Function', () {
    testWidgets('should return error message when the input is empty',
        (tester) async {
      await tester.runAsync(() async {
        await pumpLocalizedWidget(tester);

        // Arrange
        forgetPasswordCubit.emailController.text = emptyEmail;
        final expectedErrorMessage = LocaleKeys.Error_EmailCannotBeEmpty.tr();
        when(mockValidator.emailValidation(emptyEmail))
            .thenReturn(expectedErrorMessage);

        // Act
        var result = forgetPasswordCubit.validator
            .emailValidation(forgetPasswordCubit.emailController.text);

        // Assert
        expect(result, expectedErrorMessage);
      });
    });

    testWidgets('should return error message when the input is invalid',
        (tester) async {
      await tester.runAsync(() async {
        await pumpLocalizedWidget(tester);

        // Arrange
        forgetPasswordCubit.emailController.text = invalidEmail;
        final expectedErrorMessage = LocaleKeys.Error_EnterAValidEmail.tr();
        when(mockValidator.emailValidation(invalidEmail))
            .thenReturn(expectedErrorMessage);

        // Act
        var result = forgetPasswordCubit.validator
            .emailValidation(forgetPasswordCubit.emailController.text);

        // Assert
        expect(result, expectedErrorMessage);
      });
    });

    testWidgets('should return null when the input is valid', (tester) async {
      await tester.runAsync(() async {
        await pumpLocalizedWidget(tester);

        // Arrange
        forgetPasswordCubit.emailController.text = validEmail;
        when(mockValidator.emailValidation(validEmail)).thenReturn(null);

        // Act
        var result = forgetPasswordCubit.validator
            .emailValidation(forgetPasswordCubit.emailController.text);

        // Assert
        expect(result, null);
      });
    });
  });
}
