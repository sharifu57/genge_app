class HelperFunction {

  static String formatTzPhone(String input){
    String phone = input.trim();
    
    if(phone.startsWith('0')){
      return '255${phone.substring(1)}';
    }
    
    if(phone.startsWith('+255')){
      return phone.replaceFirst('+', '');
    }

    return phone;
  }
}