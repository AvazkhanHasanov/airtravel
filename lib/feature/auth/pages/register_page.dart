import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:air_travel/feature/common/widgets/app_text_field.dart';
import 'package:air_travel/feature/common/widgets/app_text_button.dart';
import 'package:air_travel/core/utils/colors.dart';
import '../managers/register_bloc.dart';
import '../managers/register_event.dart';
import '../managers/register_state.dart';

class RegisterPage extends StatefulWidget {
  final String phoneNumber;
  const RegisterPage({super.key, required this.phoneNumber});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String? _selectedRegion;

  final List<String> _regions = [
    'Toshkent',
    'Samarqand',
    'Buxoro',
    'Andijon',
    'Farg\'ona',
    'Namangan',
    'Qashqadaryo',
    'Surxondaryo',
    'Sirdaryo',
    'Jizzax',
    'Navoiy',
    'Xorazm',
    'Qoraqalpog\'iston',
  ];

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galereyadan tanlash'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Kamera orqali olish'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source != null) {
      try {
        final pickedFile = await _picker.pickImage(
          source: source,
          imageQuality: 80,
          maxWidth: 1024,
          maxHeight: 1024,
        );
        if (pickedFile != null) {
          print('Rasm tanlandi: ${pickedFile.path}');
          setState(() {
            _selectedImage = File(pickedFile.path);
          });
          _showSuccess('Rasm muvaffaqiyatli tanlandi');
        } else {
          print('Rasm tanlanmadi (null qaytdi)');
          // Foydalanuvchi bekor qilgan bo'lishi mumkin - xabar ko'rsatmaymiz
        }
      } catch (e) {
        print('Xatolik: $e');
        _showError('Rasm tanlab bo\'lmadi. Qaytadan urinib ko\'ring');
      }
    }
  }
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF00B074),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  void _onSubmit() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();

    if (firstName.isEmpty) return _showError('Ismingizni kiriting');
    if (lastName.isEmpty) return _showError('Familiyangizni kiriting');
    if (_selectedRegion == null) return _showError('Viloyatingizni tanlang');

    // Rasm yo'lini to'g'ri yuborish
    final profilePhotoPath = _selectedImage?.path ?? '';
    context.read<RegisterBloc>().add(
      SubmitRegisterEvent(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: widget.phoneNumber,
        region: _selectedRegion!,
        profilePhoto: profilePhotoPath, // To'g'rilandi
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.failure) {
          _showError(state.errorMessage ?? 'Xatolik yuz berdi');
        } else if (state.status == RegisterStatus.success) {
          _showSuccess('Muvaffaqiyatli ro\'yxatdan o\'tdingiz!');
        }
      },
      builder: (context, state) {
        final isLoading = state.status == RegisterStatus.loading;
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: AppColors.greyscale),
            ),
            title: Text(
              "Ma'lumotlarni kiritish",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                // Profile Image
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: AppColors.greyscale300,
                      backgroundImage:
                      _selectedImage != null ? FileImage(_selectedImage!) : null,
                      child: _selectedImage == null
                          ? Icon(Icons.person, size: 60.r, color: AppColors.greyscale600)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: isLoading ? null : _pickImage,
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: isLoading ? AppColors.greyscale300 : AppColors.greyscale700,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),

                AppTextFormField(
                  width: double.infinity,
                  controller: _firstNameController,
                  hintText: 'Ismingiz',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16.h),

                AppTextFormField(
                  width: double.infinity,
                  controller: _lastNameController,
                  hintText: 'Familiyangiz',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16.h),

                AppTextFormField(
                  width: double.infinity,
                  controller: TextEditingController(text: widget.phoneNumber),
                  hintText: 'Telefon raqam',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.h),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.greyscale50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedRegion,
                      hint: Text(
                        'Viloyatingiz',
                        style: TextStyle(
                          color: AppColors.greyscale600,
                          fontSize: 14.sp,
                        ),
                      ),
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.greyscale600),
                      items: _regions.map((region) {
                        return DropdownMenuItem<String>(
                          value: region,
                          child: Text(region),
                        );
                      }).toList(),
                      onChanged: isLoading ? null : (newValue) {
                        setState(() => _selectedRegion = newValue);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                AppTextButton(
                  text: "Saqlash",
                  onPressed: isLoading ? null : _onSubmit,
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}