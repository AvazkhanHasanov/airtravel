import 'package:air_travel/feature/auth/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../core/utils/colors.dart';
import '../managers/otp_bloc.dart';
import '../managers/otp_event.dart';
import '../managers/otp_state.dart';

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    print(" OTP UI Error: $message");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccess(String message) {
    print(" OTP UI Success: $message");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF00B074),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _verifyOtp() {
    final code = _otpController.text.trim();

    print("OTP kiritildi: '$code'");

    if (code.isEmpty) {
      _showError('Kodni kiritishingiz shart');
      return;
    }

    if (code.length != 4) {
      _showError('Kod 4 ta raqamdan iborat bo\'lishi kerak');
      return;
    }

    print(" OTP validatsiya o'tdi, Bloc ga yuborilmoqda");
    context.read<OtpBloc>().add(VerifyOtpEvent(widget.phoneNumber, code));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {
        print("OTP Bloc State o'zgardi: ${state.status}");

        if (state.status == OtpStatus.failure) {
          _showError(state.errorMessage ?? 'Xatolik yuz berdi');
        } else if (state.status == OtpStatus.success) {
          _showSuccess('Muvaffaqiyatli tasdiqlandi!');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(phoneNumber: widget.phoneNumber),
            ),
          );
          print("Token olindi, Home page ga o'tish kerak");
        }
      },
      builder: (context, state) {
        final isLoading = state.status == OtpStatus.loading;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: AppColors.greyscale),
            ),
            title: Text("Kodni kiriting",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sms kodni kiriting",
                  style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 16),
                Text(
                  "${widget.phoneNumber} raqamiga kod yuborildi",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.greyscale600),
                ),
                SizedBox(height: 32),
                Pinput(
                  length: 4,
                  controller: _otpController,
                  enabled: !isLoading,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onCompleted: (code) {
                    if (!isLoading) {
                      _verifyOtp();
                    }
                  },
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Tasdiqlash",style: TextStyle(color: AppColors.white),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}