import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/features/authentication/controllers/auth_controller.dart';
import 'package:chap_mobile/src/features/authentication/widgets/custom_textfield.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/models/user.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundWhiteColor,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            padding: AppSize.paddingPage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(AppStrings.registerTitle, style: AppText.large),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(AppStrings.registerSubTitle,
                        textAlign: TextAlign.center,
                        style: AppText.secondaryTiny),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'lastname is required';
                            }
                            return null;
                          },
                          maxLength: 50,
                          controller: _lastNameController,
                          isObscureText: false,
                          hintText: "Nom",
                          keyboardType: TextInputType.name,
                          obscuringCharacter: '*',
                          prefixIcon: const Icon(Icons.person_2_outlined),
                          suffixIcon: const Icon(Icons.abc),
                        ),
                        Positioned(
                            left: 43,
                            top: 15,
                            bottom: 35,
                            child: Container(
                                height: 3,
                                width: 1,
                                color: Colors.black.withOpacity(0.13)))
                      ],
                    ),
                    const SizedBox(height: AppSize.textfieldSpace),
                    Stack(
                      children: [
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'firstname is required';
                            }
                            return null;
                          },
                          maxLength: 100,
                          controller: _firstNameController,
                          isObscureText: false,
                          hintText: "Prenom(s)",
                          keyboardType: TextInputType.name,
                          obscuringCharacter: '*',
                          prefixIcon: const Icon(Icons.person_2_outlined),
                          suffixIcon: const Icon(Icons.abc),
                        ),
                        Positioned(
                            left: 43,
                            top: 15,
                            bottom: 35,
                            child: Container(
                                height: 3,
                                width: 1,
                                color: Colors.black.withOpacity(0.13)))
                      ],
                    ),
                    const SizedBox(height: AppSize.textfieldSpace),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColor.primaryColor)),
                      child: Stack(
                        children: [
                          InternationalPhoneNumberInput(
                            //searchBoxDecoration: InputDecoration(),
                            textFieldController: _phoneNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }
                              return null;
                            },
                            onInputChanged: (PhoneNumber phone) {},
                            formatInput: false,
                            initialValue: PhoneNumber(isoCode: 'TG'),
                            maxLength: 8,
                            selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET),
                            cursorColor: AppColor.primaryColor,
                            inputDecoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 15, left: 0),
                                border: InputBorder.none,
                                hintText: 'Numéro de téléphone',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: AppColor.backgroundTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ),
                          Positioned(
                              left: 90,
                              top: 8,
                              bottom: 8,
                              child: Container(
                                  height: 40,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.13)))
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 4) {
                              return 'Password must be at least 4 characters';
                            }
                            return null;
                          },
                          maxLength: 4,
                          controller: _passwordController,
                          isObscureText: true,
                          hintText: "Mot de passe",
                          keyboardType: TextInputType.phone,
                          obscuringCharacter: '*',
                          prefixIcon: const Icon(Icons.key_outlined),
                          suffixIcon: const Icon(Icons.password),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    isLoading
                        ? const SpinKitChasingDots(
                            color: AppColor.primaryColor, size: 25)
                        : PrimaryButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                //concat phone number to togolese number
                                String phoneNumber =
                                    "+228${_phoneNumberController.text}";

                                final newUser = User(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  phoneNumber: phoneNumber,
                                  password: _passwordController.text,
                                );

                                ref
                                    .read(authenticationControllerProvider)
                                    .register(
                                      context: context,
                                      user: newUser,
                                    );

                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            text: "Valider"),
                  ],
                )
              ],
            ),
          ),
        ))));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: AppColor.backgroundWhiteColor,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            IconAssets.arrow_left,
            color: AppColor.backgroundTextColor,
            width: 25,
            height: 25,
          ),
        ));
  }
}
