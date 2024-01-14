
import 'localization_service.dart';

enum TKeys{
  welcome,
  registerNow,
  email,
  emailHint,
  password,
  passwordHint,
  configPass,
  configPassHint,
  account,
  noAccount,
  next,
  name,
  nameHint,
  phoneNumber,
  phoneNumberHint,
  text,
  textCompany,
  login,
  back,
  no,
  createAccount,
  home,
  playStore,
  favorite,
  title1,
  title2,
  title3,
  title4,
  description1,
  description2,
  description3,
  description4,
  skip,
  choose,
  farmer,
  companies,
  note,
  field1,
  field2,
  helper,
  weather,
  hi,
  selectCrop,
  crop,
  clickHere,
  selectType,
  prepare
}

extension TKeysExtention on TKeys{
  String get _string => this.toString().split('.')[1];

  String translate(context){
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}