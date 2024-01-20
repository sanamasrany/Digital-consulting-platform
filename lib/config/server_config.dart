//where to put the back apis links
class ServerConfig {
  // the api static locations like http://localhost (anything before /api ) http://10.0.2.2:8000 for localhost


  static const domainNameserver = 'https://digital-consulting-platform.000webhostapp.com';

  //authoraization api (the after /api part for sign up api)
static const signup = '/api/registeruser';
  static const signupexpert = '/api/registerexpert';
  static const login = '/api/login';
  //static const checkvalid = '';
  static const getexperts = '/api/expertdetails';
  static const getexpertsM = '';
  static const getexpertsV = '';
  static const getexpertsF = '';
  static const getexpertsP = '';
  static const getexpertsB = '';

}