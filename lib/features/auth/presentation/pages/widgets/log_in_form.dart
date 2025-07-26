import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/core/utils/colors/app_colors.dart';
import 'package:basic_restaurant/core/utils/helpers/snackbar.dart';
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/core/validators/validators.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/widgets/custom_text_field.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/widgets/custom_button_icon.dart';
import 'package:basic_restaurant/features/auth/presentation/view_model/auth_cubit/log_in_cubit/log_in_cubit.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  bool isVisible=false;
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LogInCubit>(),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state is LogInSuccess) {
               if (mounted) {
        GoRouter.of(context).replace(RoutesName.mainPage);
      }
          } else if (state is LogInFailure) {
            showAppSnackBar(
                backgroundColor: AppColors.redColor,
                context: context,
                message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: globalKey,
            child: Column(
              children: [
                const SizedBox(height: 15),
               
                const SizedBox(height: 15),
                CustomTextFormFieldWidget(
                  label: "Email address",
                  controller: emailController,
                  validator: (value) {
                    return Validators.validateEmail(value!);
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormFieldWidget(
                  onPressedIcon: (){setState(() {
                    isVisible=!isVisible;
                  });},
                  label: "Password",
                  isObsecure:!isVisible ,
                  icon:isVisible? Icons.visibility:Icons.visibility_off,
                  controller: passwordController,
                  validator: (value) {
                    return Validators.validatePassword(value!);
                  },
                ),
                const Spacer(),
                state is LogInLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<LogInCubit>().logIn(
                           emailController.text, passwordController.text);
                          }
                        },
                        text: "Log In",
                      ),
                const SizedBox(height: 20),
                const CustomButtonIcon(),
              ],
            ),
          );
        },
      ),
    );
  }
}
