part of 'endpoints.dart';

class _FactsEndpoints {
  const _FactsEndpoints();

  static const _base = 'facts';
  
  final archive = '$_base/archive';

  String dailyFactsBucket({
    String? languageCode,
    List<String>? interests,
  }) {
    final url = '$_base/daily/bucket';
    final uri = Uri.parse(url).replace(
      queryParameters: {
        if (languageCode != null) 'lang': languageCode,
        if (interests != null && interests.isNotEmpty) 'interests': interests.join(','),
      },
    );
    return uri.toString();
  }
  String factExplanation(String factId) => '$_base/explanation/$factId';
  String factExplanationRewardStatus(String factId) => '$_base/explanation/check_reward/$factId';
  String deleteArchivedFact(int id) => '$_base/archive/$id';
  String archiveList({
    required SortOrder sortOrder,
    required int count,
    required int page,
  }) {
    final url = '$_base/archive/list';
    final uri = Uri.parse(url).replace(
      queryParameters: {
        'sort': sortOrder.apiType,
        'count': count.toString(),
        'page': page.toString(),
      },
    );
    return uri.toString();
  }
}