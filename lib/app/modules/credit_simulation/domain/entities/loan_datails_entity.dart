import '../value_objects/amount_vo.dart';
import '../value_objects/ltv_vo.dart';
import '../value_objects/term_vo.dart';
import 'user_data_entity.dart';

class LoanDetailsEntity {
  UserDataEntity user;
  LtvVO ltv;
  TermVO term;
  bool hasProtectedCollateral;
  AmountVO amount;
  LoanDetailsEntity(
      {required this.user,
      required this.term,
      required this.hasProtectedCollateral,
      required this.ltv,
      required this.amount});
}
