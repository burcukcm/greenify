import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static final Color buttonColor = Colors.green[200]!;

}

abstract class AppStrings{
  static const String signup= "Hesap Oluştur";
  static const String login= "Giriş Yap";
  static const String email="E-posta";
  static const String password="Şifre";
  static const String passwordAgain="Şifre Tekrar";
  static const String alreadyHaveAccount="Hesabın var mı? Giriş Yap";
  static const String loginheader1 = "Akıllı bitki yardımcınız";
  static const String loginheader2="Greenify sizin için takipte!";
  static const String mainheader="Greenify";
  static const String dontHaveAccount="Hesabın Yok mu Kayıt ol";
  static const String fillAllFields= "Lütfen tüm alanları doldurun.";
  static const String passwordsNotMatch = "Şifreler eşleşmiyor.";
  static const String regisSuccessful = "Kayıt Başarılı";
  static const String loginSuccessful = "Giriş Başarılı";
  static const String fillEmailAndPassword = "Lütfen e-posta ve şifre alanlarını doldurun.";


}

abstract class AppImages {
  static const String register = "assets/register.png";
  static const String loginAnimation= 'assets/lottie/plant.json';
}

abstract class AppSizedBoxHeights {
  static const double small = 10.0;
  static const double medium = 30.0;
  static const double large = 300.0;
  static const double textfieldBorderRadius = 20.0;
  static const double buttonHorizontal = 40.0;
  static const double buttonVertical = 14.0;


}
