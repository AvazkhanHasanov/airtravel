import 'package:air_travel/feature/common/widgets/app_text_field.dart';
import 'package:air_travel/feature/common/widgets/app_text_button.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../managers/login-state.dart';
import '../managers/login_bloc.dart';
import '../managers/login_event.dart';
import 'otp_verification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    print("UI Error: $message");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccess(String message) {
    print(" UI Success: $message");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF00B074),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onRegister(BuildContext context) {
    final phone = _phoneController.text.trim();

    print(" Telefon raqam kiritildi: '$phone'");

    if (phone.isEmpty) {
      _showError('Telefon raqamingizni kiritishingiz shart');
      return;
    }

    if (!RegExp(r'^\+?[0-9]+$').hasMatch(phone)) {
      _showError('Faqat raqamlar va boshida bitta + belgisi bo\'lishi mumkin');
      return;
    }

    print(" Validatsiya o'tdi, Bloc ga yuborilmoqda");
    context.read<LoginBloc>().add(SendPhoneNumberEvent(phone));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        print(" Bloc State o'zgardi: ${state.status}");

        if (state.status == LoginStatus.failure) {
          _showError(state.errorMessage ?? 'Xatolik yuz berdi');
        } else if (state.status == LoginStatus.success) {
          _showSuccess('SMS kod yuborildi');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerificationPage(phoneNumber: _phoneController.text),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == LoginStatus.loading;

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: AppColors.greyscale),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                Image.asset(
                  'assets/image/img.png',
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40.h),
                Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 40.h),
                AppTextFormField(
                  width: double.infinity,
                  controller: _phoneController,
                  hintText: 'Telefon raqamingizni kiriting',
                  prefix: "assets/icons/Call.svg",
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 24.h),
                AppTextButton(
                  text: "Ro'yxatdan o'tish",
                  onPressed: isLoading ? null : () => _onRegister(context),
                  isLoading: isLoading,
                  backgroundColor: const Color(0xFF00B074),
                  progressColor: Colors.white,
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}