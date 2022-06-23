import '../../domain/entities/loan_datails_entity.dart';

class LoanDetailsMapper {
  Map<String, dynamic> toJson(LoanDetailsEntity loanDetails) {
    return {
      'fullname': loanDetails.user.fullName,
      'email': loanDetails.user.email,
      'ltv': loanDetails.ltv.ltv,
      'amount': loanDetails.amount.amount,
      'term': loanDetails.term.term,
      'has_protected_collateral': loanDetails.hasProtectedCollateral
    };
  }
}
