String selectCategoryType(String input) {
  String val = 'Option';
  switch (input) {
    case 'weaver':
      val = 'Multiple';
      break;
    case 'broker':
      val = 'Option';
      break;
    case 'trader':
      val = 'Multiple';
      break;
    case 'buyer':
      val = 'Multiple';
      break;
    case 'valueaddition':
      val = 'Multiple';
      break;
  }
  return val;
}
