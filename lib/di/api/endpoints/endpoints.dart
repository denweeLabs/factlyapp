import 'package:denwee/core/facts/data/source/remote/facts_api.dart';

part 'member_endpoints.dart';
part 'facts_endpoints.dart';

abstract class Endpoints {
  const Endpoints._();
  
  static const member = _MemberEndpoints();
  static const facts = _FactsEndpoints();
}
