class StringConstant {
  StringConstant._();
  factory StringConstant() => StringConstant._();

  //! Error Status Code

  static final errorMsg = 'Something went wrong';
  static final errorMsg400 = 'Bad request';
  static final errorMsg401 = 'Authentication failed';
  static final errorMsg403 = 'The authenticated user is not allowed to access the specified API endpoint';
  static final errorMsg404 = 'The requested resource does not exist';
  static final errorMsg405 = 'Method not allowed. Please check the Allow header for the allowed HTTP methods';
  static final errorMsg415 = 'Unsupported media type. The requested content type or version number is invalid';
  static final errorMsg422 = 'Data validation failed';
  static final errorMsg429 = 'Too many requests';
  static final errorMsg500 = 'Internal server error';

  //! URLs
  static final privacyPolicyUrl = 'https://docs.google.com/document/d/1uwVVRD_kbKkhsGdsUvZwzs3lPHQXxmmzcUZOCIWSmj4/edit?usp=sharing';
  static final temNConditionUrl = 'https://docs.google.com/document/d/1hcEuH5u-z8MmlA2l6C-t1B2oQtJaAoCFsS3H_7pElrg/edit?usp=sharing';

  static final accountDelegation = 'https://docs.google.com/forms/d/e/1FAIpQLSe_6UsyVHh5hX02k2N-uaAz26Kl9iTim2fTskkyppcthKmlDQ/viewform?usp=header';

  static final appContactMobile = '9727402784';
  static final appContactMail = 'sahil078078@gmail.com';

  static final googleAppLink = 'https://play.google.com/store/apps/details?id=app.textile.mandee';
  static final iosAppLink = 'https://apps.apple.com/us/app/textile-mandee/id6743525584';
}
