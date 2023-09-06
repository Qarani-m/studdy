class SignUpFailure{
  final String message;

  const SignUpFailure([this.message="An unknown error occures"]);
  factory SignUpFailure.code(String code){
    switch(code){
      case "weak-password": return const SignUpFailure("Please enter a stronger password "); 
      case "invalid-email": return const SignUpFailure("Invalid email"); 
      case "email-already-in-use": return const SignUpFailure("Email already in use"); 
      case "operation-not-allowed": return const SignUpFailure("Operation not allowed, please contact support"); 
      case "user-disabled": return const SignUpFailure("User disabled, please contact support"); 
      default: return const SignUpFailure();
    }
  }
}