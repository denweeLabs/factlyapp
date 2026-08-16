enum PaywallSource {
  appEnterPrompt,
  backgroundsList,
  backgroundEdit,
  shareWatermark,
  subscriptionCard;

  String get eventSuffix {
    switch (this) {
      case PaywallSource.appEnterPrompt:
        return 'app_enter';
      case PaywallSource.backgroundsList:
        return 'bg_list';
      case PaywallSource.backgroundEdit:
        return 'bg_edit';
      case PaywallSource.shareWatermark:
        return 'share';
      case PaywallSource.subscriptionCard:
        return 'account';
    }
  }

  static PaywallSource? fromEventSuffix(String? value) {
    if (value == null) return null;
    for (final source in PaywallSource.values) {
      if (source.eventSuffix == value) return source;
    }
    return null;
  }
}
