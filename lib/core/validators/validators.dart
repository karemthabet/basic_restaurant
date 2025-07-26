class Validators {
  static String ? validateUserName(String value){

    if(value.isEmpty){
      return 'UserName cannot be empty';
    }
    return null;
  }

   static String ? validateEmail(String value){

    if(value.isEmpty){
      return 'Email is required';
    }
      final  emailRegExp=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
if (!emailRegExp.hasMatch(value)) return 'Enter a valid email';
    return null;
  
  }
 static String ? validatePassword(String value){

    if(value.isEmpty){
      return 'password is required';
    }
if (value.length<6) return 'Password must be at least 6 characters';
    return null;
  
  }





}