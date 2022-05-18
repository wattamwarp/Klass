import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//
// import 'package:klass_app/ui/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widgets/common_widgets.dart';
import '../../../../../common_widgets/custom_text.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../helper/helper.dart';
import '../../../../../themes/colors.dart';
import 'widgets/select_gender_field.dart';
import 'widgets/select_state_field.dart';
import 'widgets/select_user_role_field.dart';

class RegistrationRoleSelectScreen extends StatefulWidget {
  @override
  _RegistrationRoleSelectScreenState createState() =>
      _RegistrationRoleSelectScreenState();
}

class _RegistrationRoleSelectScreenState
    extends State<RegistrationRoleSelectScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final ValueNotifier<UserRoleEnum> _selectedRole =
      ValueNotifier<UserRoleEnum>(UserRoleEnum.student);

  //Controllers
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  bool isNameEmpty = true;
  bool isCityEmpty = true;
  bool isPhoneEmpty = true;
  late User? _user;

  @override
  void dispose() {
    _selectedRole.dispose();
    super.dispose();
    _nameController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void getUserProfile() {
    // _user =
    //     Provider.of<AuthState>(context, listen: false).getGoogleProfileInfo();
    // _emailController = TextEditingController(text: _user?.email);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _nameController = TextEditingController()
      ..addListener(() {
        setState(() {
          isNameEmpty = _nameController.text.isEmpty;
        });
      });
    _cityController = TextEditingController()
      ..addListener(() {
        setState(() {
          isCityEmpty = _cityController.text.isEmpty;
        });
      });
    _phoneController = TextEditingController(text: _user?.phoneNumber)
      ..addListener(() {
        setState(() {
          isPhoneEmpty = _phoneController.text.isEmpty;
        });
      });
  }

  Future<void> _createAccount() async {
    // try {
    //   _formKey.currentState!.save();
    //   if (_formKey.currentState!.validate()) {
    //     final authState = Provider.of<AuthState>(context, listen: false);
    //     // await authState.registerUser(); //TODO: REGISTER USER HERE
    //
    //     if (authState.tempRegistrationModel.userRole ==
    //         UserRoleEnum.instructor) {
    //       NavigationHelpers.push(context, InstructorSetupPersonalInfoScreen());
    //     } else {
    //       NavigationHelpers.push(context, StudentSetupPersonalInfoScreen());
    //     }
    //   }
    // } catch (e) {
    //   Utility.displaySnackbar(context, msg: e.toString());
    // }
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        KText(
          "Hey,",
          variant: TypographyVariant.titleSmall,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        KText(
          "New to Klass? Register here",
          variant: TypographyVariant.h2,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildForm() {
    final width = sizeConfig.safeWidth! * 100;

    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, bottom: 60.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KText(
                "Please select your role",
                variant: TypographyVariant.h3,
                style: TextStyle(
                  color: KColors.unselectedColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder<UserRoleEnum>(
                valueListenable: _selectedRole,
                builder: (context, userRole, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStackItem(UserRoleEnum.student),
                    _buildStackItem(
                      UserRoleEnum.instructor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              KTextField(
                choice: ChoiceEnum.email,
                controller: _emailController,
                labelText: _emailController.text.isEmpty ? "Email" : "",
                isEnabled: false,
              ),
              const SizedBox(height: 10),
              KTextField(
                choice: ChoiceEnum.phone,
                labelText: isPhoneEmpty ? "Phone number" : "",
                controller: _phoneController,
              ),
              const SizedBox(height: 10),
              KTextField(
                choice: ChoiceEnum.name,
                labelText: isNameEmpty ? "Full Name" : "",
                controller: _nameController,
                icon: KImages.nameIcon,
              ),
              const SizedBox(height: 10),
              SelectGenderField(),
              const SizedBox(height: 10),
              KTextField(
                choice: ChoiceEnum.text,
                labelText: isCityEmpty ? "City" : "",
                controller: _cityController,
                icon: KImages.cityIcon,
                onChanged: (val) {
                  // final authState =
                  //     Provider.of<AuthState>(context, listen: false);
                  // authState.setSelectedCity = val;
                },
              ),
              const SizedBox(height: 10),
              SelectStateDropDown(),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: KButton(
                  radius: 25.0,
                  onPressed: () => _createAccount(),
                  child: const KText(
                    "Create Account",
                    variant: TypographyVariant.h1,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),//.pH(40),
        ),
      ),
    );
  }

  Widget _buildStackItem(UserRoleEnum userRoleEnum) {
    return SelectUserRoleField(
      userRoleEnum: userRoleEnum,
    );
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final height = sizeConfig.safeHeight!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.primaryColor,
        elevation: 0.0,
      ),
      key: _scaffoldKey,
      backgroundColor: KColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 10),
          _buildWelcomeText(),//.pH(20),
          const SizedBox(height: 10.0),
          Expanded(child: _buildForm()),
        ],
      ),
    );
  }
}
