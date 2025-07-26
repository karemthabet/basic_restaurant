import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/core/utils/colors/app_colors.dart';
import 'package:basic_restaurant/core/utils/helpers/snackbar.dart';
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/core/validators/validators.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/widgets/custom_text_field.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/widgets/custom_button_icon.dart';
import 'package:basic_restaurant/features/auth/presentation/view_model/auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
      create: (context) => getIt.get<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
        
            showAppSnackBar(
                backgroundColor: AppColors.green,
                context: context,
                message: "Success Registration");
              
    if (mounted) {
        GoRouter.of(context).replace(RoutesName.mainPage);
      }
          } else if (state is SignUpFailure) {
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
                CustomTextFormFieldWidget(
                  label: "Full Name",
                  controller: userNameController,
                  validator: (value) {
                    return Validators.validateUserName(value!);
                  },
                ),
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
                state is SignUpLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<SignUpCubit>().register(
                                userNameController.text, emailController.text, passwordController.text);
                          }
                        },
                        text: "Sign Up",
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
