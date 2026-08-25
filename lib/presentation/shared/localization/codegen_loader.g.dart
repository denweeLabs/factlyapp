// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _zh = {
  "appTitle": "Denwee",
  "welcome": {
    "title": "Denwee",
    "subtitle": "每天发现简洁易记、讲解清晰的精彩知识点!",
    "begin_cta": "探索",
    "have_an_account": "已有账户？"
  },
  "user_interest": {
    "history": "历史",
    "science": "科学",
    "space": "太空",
    "nature": "自然",
    "society": "社会",
    "human_body": "人体",
    "art": "艺术",
    "movies_music": "电影与音乐",
    "mind": "心智",
    "food": "食物",
    "technology": "科技",
    "money": "金钱",
    "habits": "习惯",
    "random_curiosities": "随机事实"
  },
  "onboarding": {
    "select_interests": {
      "title": "什么最能激发你的好奇心？",
      "subtitle": "告诉我们你最感兴趣的内容",
      "cta": "选择"
    },
    "select_notification_time": {
      "title": "每天提醒你保持好奇",
      "subtitle": "我们每天会发送一个事实",
      "time_selection_title": "时间",
      "dummy_notification": {
        "title": "🌙  晚上好！",
        "body": "蓝鲸的心脏重达**400磅**，大小相当于小汽车，每分钟仅跳动**8-10次**！",
        "time_ago": "现在"
      },
      "cta": "启用"
    },
    "select_theme_colorations": {
      "title": "选择让你感觉舒适的颜色",
      "subtitle": "用颜色个性化你的体验",
      "cta": "应用"
    },
    "value_primer": {
      "title": "将好奇转化为知识",
      "bullets": {
        "line_1": "发现一个简短的事实",
        "line_2": "点击“{}”深入了解",
        "line_3": "了解事实背后的故事"
      },
      "cta": "探索"
    }
  },
  "account": {
    "section": {
      "profile": {
        "title": "个人资料"
      },
      "subscription": {
        "title": "订阅"
      },
      "interests": {
        "title": "兴趣"
      },
      "daily_facts": {
        "title": "每日趣闻",
        "items": {
          "receive_notification": "接收通知",
          "notification_time": "通知时间",
          "archive": "存档"
        }
      },
      "background": {
        "title": "背景",
        "more": "更多"
      },
      "theme": {
        "title": "主题",
        "items": {
          "system": "系统",
          "light": "浅色",
          "dark": "深色"
        }
      },
      "coloration": {
        "title": "颜色设置"
      },
      "preferences": {
        "title": "偏好",
        "items": {
          "language": "语言",
          "haptics": "触觉反馈"
        }
      },
      "more": {
        "title": "更多",
        "items": {
          "about_app": "关于应用",
          "privacy_terms": "隐私与条款",
          "contact_support": "联系客服"
        }
      }
    },
    "statistics": {
      "stars": {
        "title": "星星",
        "hint": "1 个广告 = 1 颗星星\n使用星星可立即解锁无广告的内容解释，或解锁新的背景 :)"
      },
      "streak": {
        "title": "连击",
        "hint": "你的连击显示你连续解锁了多少天的趣闻 - 不要错过任何一天以保持连击！"
      },
      "facts": {
        "title": "趣闻",
        "hint": "你已经解锁的趣闻数量 - 收集全部趣闻，扩展你的知识！"
      }
    },
    "profile": {
      "default_username": "Denwee 用户",
      "register_encourage_msg": "在多设备间同步你的账户 - 点击开始",
      "logged_in_encourage_msg": "你已登录！点击管理你的个人资料",
      "personal": {
        "title": "个人"
      },
      "subscription": {
        "title": "订阅"
      },
      "more": {
        "title": "更多",
        "change_password": "更改\n密码",
        "contact_support": "联系客服"
      }
    }
  },
  "subscription": {
    "basic_plan": "Denwee Basic",
    "premium_plan": "Premium",
    "active_plan": "当前方案",
    "upgrade_cta": "升级",
    "trial_cta": "免费试用",
    "paywall": {
      "title": "从每一个事实中获得更多，无限探索",
      "benefits": {
        "line_1": "即时解析",
        "line_2": "解锁所有背景",
        "line_3": "不再有广告",
        "ads_encourage_msg": {
          "other": "你已花费约 {} 分钟在广告上。使用 Premium 节省更多时间 🫶"
        }
      },
      "package": {
        "weekly": {
          "title": "3天试用",
          "price_string": "之后每周{}"
        },
        "monthly": {
          "title": "每月",
          "price_string": "每月{}"
        },
        "yearly": {
          "title": "每年",
          "price_string": "每年{}",
          "discount_badge": "省{}%"
        }
      },
      "footer": {
        "restore": "恢复",
        "privacy": "隐私政策",
        "terms": "条款"
      },
      "expiry": "到期时间"
    }
  },
  "backgrounds": {
    "selected": "已选择",
    "apply": "应用",
    "unlock": "解锁"
  },
  "showcase": {
    "title": "你的每日趣闻将在这里显示",
    "subtitle": "左右滑动探索更多！",
    "button": "好的 :)"
  },
  "fact_share": {
    "more": "更多",
    "hide_watermark": "隐藏水印",
    "archive": {
      "archive": "存档",
      "unarchive": "取消存档"
    },
    "copy": {
      "copy": "复制",
      "copied": "已复制"
    },
    "download": {
      "download": "下载",
      "saved": "已保存"
    },
    "resource": "来源"
  },
  "validation": {
    "email": {
      "empty": "请输入邮箱",
      "invalid": "提供的邮箱似乎无效"
    },
    "password": {
      "empty": "请输入密码",
      "short": "密码太短",
      "long": "密码太长"
    },
    "username": {
      "empty": "请输入名字",
      "short": "名字太短",
      "long": "名字太长"
    },
    "interests": {
      "not_enough": "请选择至少 {} 个兴趣，以获得最佳体验"
    }
  },
  "input_field": {
    "hint": {
      "email": "邮箱",
      "password": "密码",
      "name": "姓名",
      "old_password": "旧密码",
      "new_password": "新密码",
      "confirm_password": "确认密码"
    }
  },
  "fact_unlock_method": {
    "ad": {
      "title": "广告",
      "subtitle": "您可以通过观看广告获得 1 颗星并解锁该事实"
    },
    "star": {
      "title": "星星",
      "subtitle": "您可以使用 1 颗星在不观看广告的情况下解锁该事实"
    }
  },
  "label": {
    "login": "登录",
    "register": "注册",
    "change_password": "修改密码",
    "reset_password": "重置密码",
    "create_an_account": "创建账户",
    "forgot_pass_question": "忘记密码？",
    "dont_have_an_account_question": "还没有账户？",
    "have_an_account_question": "已有账户？",
    "daily_facts": "每日趣闻",
    "oops": "哎呀！"
  },
  "button": {
    "login": "登录",
    "register": "加入",
    "logout": "退出",
    "delete_account": "删除账户",
    "save": "保存",
    "change": "修改",
    "explain_fact": "了解更多"
  },
  "loading": {
    "just_a_moment": "请稍候..."
  },
  "error_generic_titles": {
    "title1": "哎呀！",
    "title2": "糟了！",
    "title3": "哎哟！",
    "title4": "不好了！",
    "title5": "嗯…",
    "title6": "现在不行 😔",
    "title7": "天啊！",
    "title8": "小失误！",
    "title9": "小卡顿！",
    "title10": "小故障！",
    "title11": "没成功 🥺"
  },
  "error_message": {
    "login": {
      "invalid_email": "这个邮箱似乎不对…请再次检查 😉",
      "weak_password": "嗯，这个密码太容易被猜到…试试更强的密码 🔐",
      "user_not_found": "我们找不到匹配的账户…你注册过吗？ 😉",
      "user_banned": "此账户已被限制…如有疑问请联系支持 🙏",
      "cancelled": "登录已取消……当你准备好时可以随时再试 😉",
      "internal_server": "哎呀！服务器出错…我们正在修复 🔧",
      "connection_timeout": "无法连接…请检查网络并重试 📶",
      "unexpected": "发生了意外问题…我们正在处理 🚨"
    },
    "register": {
      "invalid_email": "这个邮箱似乎不合法…请检查 ✉️",
      "weak_password": "哎呀，这个密码太弱…试试更强的密码 💪",
      "user_already_exists": "这个邮箱已被使用…试着登录 😉",
      "disabled": "当前注册已关闭…请稍后再试 🕒",
      "cancelled": "注册已取消……当你准备好时可以随时继续 😉",
      "internal_server": "服务器出错…我们正在处理 🔧",
      "connection_timeout": "无连接…请检查网络 📡",
      "unexpected": "发生意外错误…我们正在处理 🚨"
    },
    "update_profile": {
      "internal_server": "服务器出错…我们正在处理 🔧",
      "connection_timeout": "无连接…请检查网络 📡",
      "unexpected": "发生意外错误…我们正在处理 🚨"
    },
    "change_password": {
      "weak_password": "嗯，这个密码太弱 :( 试试更强的密码 🔐",
      "invalid_credentials": "密码似乎不正确…请检查后重试 😉",
      "internal_server": "哎呀！服务器出错…我们正在修复 ⚙️",
      "connection_timeout": "无法连接…请检查网络 📶",
      "unexpected": "发生了意外问题…我们正在处理 🚨"
    },
    "facts": {
      "explanation_reward_missing": "哎呀！出现了问题…我们无法验证广告完成情况，请重试 🙏",
      "explanation_insufficient_stars": "你的星星不足以解锁此趣闻…观看广告获取更多 😔",
      "archive_limit_reached": "已达到存档上限… 删除部分内容，或升级至 Premium 以获得无限保存 📚",
      "internal_server": "哎呀！服务器出错…我们正在修复 ⚙️",
      "connection_timeout": "无法连接…请检查网络 📶",
      "unexpected": "发生了意外问题…我们正在处理 🚨",
      "no_ad_for_explanation": {
        "title": "非常抱歉 😔",
        "subtitle": "很抱歉让您久等了，目前没有可用广告…请几分钟后再试 :("
      }
    },
    "subscriptions": {
      "configuration": "购买过程中出现问题… 请再试一次 🙏",
      "purchase_not_allowed": "哦… 此设备或账户不允许购买 😕",
      "purchase_cancelled": "购买已取消… 没关系，您可以随时再试 🙂",
      "payment_pending": "付款仍在处理中… 请稍等 ⏳",
      "payment_failed": "付款失败… 请检查您的支付方式 💳",
      "already_subscribed": "您已经拥有有效的订阅 🎉",
      "subscription_not_found": "未找到有效订阅… 请尝试恢复或检查你的账户 🙂",
      "insufficient_permissions": "无法验证购买… 请尝试恢复或重新登录 🔐",
      "internal_server": "糟糕！我们的服务器出现问题了… 正在修复中 ⚙️",
      "connection_timeout": "无法连接网络… 请检查您的网络 📶",
      "unexpected": "发生了意外错误… 我们正在处理中 🚨"
    },
    "common": {
      "internal_server": "服务器出错…我们正在处理 🔧",
      "connection_timeout": "无连接…请检查网络 📡",
      "authorization": "授权出现问题…请尝试退出并重新登录 🔐",
      "too_many_requests": "请求过多…稍等片刻再试 🔄",
      "unexpected": "哦！发生了意外错误…我们正在处理 🚨"
    },
    "email": {
      "failed_to_open_support": "哎呀！无法打开邮箱…但你可以随时发送邮件至 {} 💌"
    }
  },
  "info_message": {
    "password_change_success": "密码修改成功！",
    "password_reset_success": "密码已更新！",
    "password_mismatch": "哎呀！两次密码不一致…请检查 🔂",
    "signup_success": "欢迎加入！",
    "no_results": {
      "title": "➡️ 哎呀，这里什么都没有 ⬅️",
      "daily_facts": "还没有每日趣闻…稍后再来看看新内容！",
      "facts_archive": "你的存档是空的 — 保存一些趣闻，它们会显示在这里！"
    },
    "agreeing_to_terms": "继续操作即表示你同意我们的\n<terms>条款</terms>和<privacy>隐私</privacy>"
  },
  "dialog": {
    "session_expired": {
      "title": "欢迎回来！",
      "subtitle": "你的会话小憩了一下…请重新登录唤醒它 😴"
    },
    "account_delete": {
      "title": "再见 :(",
      "subtitle": "删除账户将永久移除你的数据…此操作不可撤销 ⛔️"
    },
    "permission": {
      "notifications": {
        "title": "权限",
        "subtitle": {
          "basic": "要接收通知，请确保允许此应用权限",
          "in_settings": "要接收通知，请确保在系统设置中允许此应用权限"
        }
      },
      "photosAdd": {
        "title": "权限",
        "subtitle": {
          "basic": "为了保存和分享文件，请允许此应用访问存储空间",
          "in_settings": "为了保存和分享文件，请在系统设置中允许此应用访问存储空间"
        }
      },
      "photosFull": {
        "title": "权限",
        "subtitle": {
          "basic": "要保存和分享文件，请允许此应用访问照片",
          "in_settings": "要保存和分享文件，请在系统设置中允许此应用访问照片"
        }
      }
    },
    "ad_alert": {
      "title": "坏消息 :(",
      "subtitle": "为了保持此功能免费，我们需要显示广告…感谢理解和支持！"
    },
    "reset_password_expired": {
      "title": "链接已过期 ⏳",
      "subtitle": "你的重置密码链接已过期…请申请新链接以安全继续"
    },
    "reset_password_email_sent": {
      "title": "查看邮箱 📬",
      "subtitle": "我们已将重置密码链接发送到你的邮箱…请按照说明设置新密码 🔑"
    },
    "select_notification_time": {
      "title": "选择时间",
      "button": "确定"
    },
    "reset_password_enter_email": {
      "title": "重置密码",
      "subtitle": "我们会向你的邮箱发送重置密码的链接... 如果一直没收到，请等待 30 秒后再试一次 :)"
    },
    "success_purchase": {
      "title": "一切就绪！",
      "subtitle": "您的 Premium 权限有效期至 {}。非常感谢您的支持！❤️"
    },
    "subscription_packages_switch": {
      "title": "小提示！",
      "subtitle": "当你更换套餐时，当前订阅将被替换，剩余价值将应用到新套餐中 😉"
    },
    "background_purchase_confirmation": {
      "title": "太棒了！",
      "subtitle": "是否要花费 {} 颗星星解锁此背景？"
    },
    "background_insufficient_balance": {
      "title": "还不够呢 🥺",
      "subtitle": "你的星星数量还不足以解锁这个背景"
    },
    "background_insufficient_few_balance": {
      "title": "就差一点 ⭐️",
      "subtitle": {
        "one": "只差 {} 颗星星就可以解锁这个背景了！",
        "other": "只差 {} 颗星星就可以解锁这个背景了！"
      }
    },
    "email_change": {
      "title": "温馨提示！",
      "subtitle": "请确保您可以访问此电子邮箱地址，它将用于账号恢复 📧"
    },
    "signup_review_encourage": {
      "title": "很高兴在这里见到你 🎉",
      "subtitle": "感谢你使用 Denwee！如果你喜欢这款应用，留下一个简短的评价是支持它的好方式。祝你拥有美好的一天！❤️"
    }
  },
  "snackbar": {
    "badConnection": {
      "title": "哎呀！连接中断 📶",
      "description": "请检查网络并重试！"
    }
  }
};
static const Map<String,dynamic> _de = {
  "appTitle": "Denwee",
  "welcome": {
    "title": "Denwee",
    "subtitle": "Entdecke jeden Tag schnelle und einprägsame Fakten mit klaren Erklärungen!",
    "begin_cta": "Entdecken",
    "have_an_account": "Hast du ein Konto?"
  },
  "user_interest": {
    "history": "Geschichte",
    "science": "Wissenschaft",
    "space": "Weltraum",
    "nature": "Natur",
    "society": "Gesellschaft",
    "human_body": "Menschlicher Körper",
    "art": "Kunst",
    "movies_music": "Filme & Musik",
    "mind": "Geist",
    "food": "Essen",
    "technology": "Technologie",
    "money": "Geld",
    "habits": "Gewohnheiten",
    "random_curiosities": "Zufällige Fakten"
  },
  "onboarding": {
    "select_interests": {
      "title": "Was weckt deine Neugier am meisten?",
      "subtitle": "Sag uns, was dich interessiert",
      "cta": "Wählen"
    },
    "select_notification_time": {
      "title": "Tägliche Erinnerung für deine Neugier",
      "subtitle": "Wir senden dir jeden Tag einen Fakt",
      "time_selection_title": "Zeit",
      "dummy_notification": {
        "title": "🌙  Guten Abend!",
        "body": "Das Herz eines Blauwals ist so riesig, dass es über 180 kg wiegen kann, etwa so groß wie ein kleines Auto ist und nur 8–10 Mal pro Minute schlägt!",
        "time_ago": "jetzt"
      },
      "cta": "Aktivieren"
    },
    "select_theme_colorations": {
      "title": "Finde Farben, die sich richtig anfühlen",
      "subtitle": "Gestalte dein Erlebnis mit Farben",
      "cta": "Anwenden"
    },
    "value_primer": {
      "title": "Neugier in echtes Wissen verwandeln",
      "bullets": {
        "line_1": "Entdecke einen kurzen Fakt",
        "line_2": "Tippe auf „{}“",
        "line_3": "Lerne die Geschichte dahinter"
      },
      "cta": "Entdecken"
    }
  },
  "account": {
    "section": {
      "profile": {
        "title": "Profil"
      },
      "subscription": {
        "title": "Abonnement"
      },
      "interests": {
        "title": "Interessen"
      },
      "daily_facts": {
        "title": "Tägliche Fakten",
        "items": {
          "receive_notification": "Benachrichtigungen erhalten",
          "notification_time": "Benachrichtigungszeit",
          "archive": "Archiv"
        }
      },
      "background": {
        "title": "Hintergrund",
        "more": "Mehr"
      },
      "theme": {
        "title": "Thema",
        "items": {
          "system": "System",
          "light": "Hell",
          "dark": "Dunkel"
        }
      },
      "coloration": {
        "title": "Farbgestaltung"
      },
      "preferences": {
        "title": "Einstellungen",
        "items": {
          "language": "Sprache",
          "haptics": "Haptisches Feedback"
        }
      },
      "more": {
        "title": "Mehr",
        "items": {
          "about_app": "Über die App",
          "privacy_terms": "Datenschutz & Bedingungen",
          "contact_support": "Support kontaktieren"
        }
      }
    },
    "statistics": {
      "stars": {
        "title": "Sterne",
        "hint": "1 Anzeige = 1 Stern\nNutze Sterne, um Erklärungen sofort ohne Werbung freizuschalten oder neue Hintergründe freizuschalten :)"
      },
      "streak": {
        "title": "Serie",
        "hint": "Deine Serie zeigt, wie viele Tage hintereinander du mindestens einen Fakt freigeschaltet hast - Verpasse keinen Tag, um sie aufrechtzuerhalten!"
      },
      "facts": {
        "title": "Fakten",
        "hint": "Die Anzahl der Fakten, die du bereits freigeschaltet hast - Sammle sie alle und erweitere dein Wissen!"
      }
    },
    "profile": {
      "default_username": "Denwee Benutzer",
      "register_encourage_msg": "Synchronisiere dein Konto auf mehreren Geräten - Tippe zum Starten",
      "logged_in_encourage_msg": "Du bist eingeloggt! Tippe, um dein Profil zu verwalten",
      "personal": {
        "title": "Persönlich"
      },
      "subscription": {
        "title": "Abonnement"
      },
      "more": {
        "title": "Mehr",
        "change_password": "Passwort\nändern",
        "contact_support": "Support\nkontaktieren"
      }
    }
  },
  "subscription": {
    "basic_plan": "Denwee Basic",
    "premium_plan": "Premium",
    "active_plan": "Aktiver Tarif",
    "upgrade_cta": "Upgrade",
    "trial_cta": "Gratis testen",
    "paywall": {
      "title": "Mehr aus jedem Fakt herausholen – ohne Grenzen",
      "benefits": {
        "line_1": "Sofortige Erklärungen",
        "line_2": "Alle Hintergründe freischalten",
        "line_3": "Keine Werbung mehr",
        "ads_encourage_msg": {
          "one": "Du hast ~{} Minute mit Werbung verbracht. Spare mehr Zeit mit Premium 🫶",
          "other": "Du hast ~{} Minuten mit Werbung verbracht. Spare mehr Zeit mit Premium 🫶"
        }
      },
      "package": {
        "weekly": {
          "title": "3 Tage testen",
          "price_string": "danach {} pro Woche"
        },
        "monthly": {
          "title": "Monatlich",
          "price_string": "{} pro Monat"
        },
        "yearly": {
          "title": "Jährlich",
          "price_string": "{} pro Jahr",
          "discount_badge": "{}% sparen"
        }
      },
      "footer": {
        "restore": "Wiederherstellen",
        "privacy": "Datenschutz",
        "terms": "Bedingungen"
      },
      "expiry": "Ablauf"
    }
  },
  "backgrounds": {
    "selected": "Ausgewählt",
    "apply": "Anwenden",
    "unlock": "Freischalten"
  },
  "showcase": {
    "title": "Deine täglichen Fakten werden hier angezeigt",
    "subtitle": "Wische nach links oder rechts, um zu erkunden!",
    "button": "Ok :)"
  },
  "fact_share": {
    "more": "Mehr",
    "hide_watermark": "Wasserzeichen ausblenden",
    "archive": {
      "archive": "Archivieren",
      "unarchive": "Aus Archiv entfernen"
    },
    "copy": {
      "copy": "Kopieren",
      "copied": "Kopiert"
    },
    "download": {
      "download": "Herunterladen",
      "saved": "Gespeichert"
    },
    "resource": "Quelle"
  },
  "validation": {
    "email": {
      "empty": "Bitte gib eine E-Mail ein",
      "invalid": "Die angegebene E-Mail sieht ungültig aus"
    },
    "password": {
      "empty": "Bitte gib ein Passwort ein",
      "short": "Das Passwort ist zu kurz",
      "long": "Das Passwort ist zu lang"
    },
    "username": {
      "empty": "Bitte gib einen Namen ein",
      "short": "Der Name ist zu kurz",
      "long": "Der Name ist zu lang"
    },
    "interests": {
      "not_enough": "Wähle mindestens {} Interessen für das beste Erlebnis"
    }
  },
  "input_field": {
    "hint": {
      "email": "E-Mail",
      "password": "Passwort",
      "name": "Name",
      "old_password": "Altes Passwort",
      "new_password": "Neues Passwort",
      "confirm_password": "Passwort bestätigen"
    }
  },
  "fact_unlock_method": {
    "ad": {
      "title": "Werbung",
      "subtitle": "Sie können 1 Stern verdienen und den Fakt freischalten, indem Sie eine Werbung ansehen"
    },
    "star": {
      "title": "Stern",
      "subtitle": "Sie können 1 Stern verwenden, um den Fakt ohne Werbung freizuschalten"
    }
  },
  "label": {
    "login": "Einloggen",
    "register": "Registrieren",
    "change_password": "Pass ändern",
    "reset_password": "Pass zurücksetzen",
    "create_an_account": "Konto erstellen",
    "forgot_pass_question": "Passwort vergessen?",
    "dont_have_an_account_question": "Noch kein Konto?",
    "have_an_account_question": "Hast du ein Konto?",
    "daily_facts": "Tägliche Fakten",
    "oops": "Ups!"
  },
  "button": {
    "login": "Einloggen",
    "register": "Mitmachen",
    "logout": "Ausloggen",
    "delete_account": "Konto löschen",
    "save": "Speichern",
    "change": "Ändern",
    "explain_fact": "Mehr erfahren"
  },
  "loading": {
    "just_a_moment": "Einen Moment..."
  },
  "error_generic_titles": {
    "title1": "Ups!",
    "title2": "Oh-oh!",
    "title3": "Hoppla!",
    "title4": "Oh nein!",
    "title5": "Hm...",
    "title6": "Nicht jetzt 😔",
    "title7": "Auweia!",
    "title8": "Upssi!",
    "title9": "Kleiner Hänger!",
    "title10": "Mini-Fehler!",
    "title11": "Hat nicht geklappt 🥺"
  },
  "error_message": {
    "login": {
      "invalid_email": "Diese E-Mail sieht nicht richtig aus... Kannst du sie bitte überprüfen? 😉",
      "weak_password": "Hmm, dieses Passwort ist zu leicht zu erraten... Versuche etwas Stärkeres 🔐",
      "user_not_found": "Wir konnten kein Konto mit diesen Daten finden... Hast du dich registriert? 😉",
      "user_banned": "Dieses Konto wurde eingeschränkt... Wenn du denkst, dass das ein Fehler ist, kontaktiere den Support 🙏",
      "cancelled": "Die Anmeldung wurde abgebrochen... Du kannst es erneut versuchen, wenn du bereit bist 😉",
      "internal_server": "Ups! Auf unserer Seite ist etwas schiefgelaufen... Wir beheben es! 🔧",
      "connection_timeout": "Verbindung nicht möglich... Überprüfe dein Internet und versuche es erneut 📶",
      "unexpected": "Ein unerwartetes Problem ist aufgetreten... Wir prüfen es! 🚨"
    },
    "register": {
      "invalid_email": "Diese E-Mail sieht nicht gültig aus... Kannst du sie bitte prüfen? ✉️",
      "weak_password": "Ups, dieses Passwort ist zu schwach... Versuch es stärker zu machen 💪",
      "user_already_exists": "Diese E-Mail ist anscheinend schon vergeben... Versuche dich einzuloggen 😉",
      "disabled": "Registrierungen sind momentan geschlossen... Versuche es später 🕒",
      "cancelled": "Die Registrierung wurde abgebrochen... Du kannst jederzeit weitermachen, wenn du bereit bist 😉",
      "internal_server": "Auf unserer Seite ist etwas kaputt gegangen... Wir arbeiten daran 🔧",
      "connection_timeout": "Keine Verbindung... Überprüfe dein Internet und versuche es erneut 📡",
      "unexpected": "Ein unerwarteter Fehler ist aufgetreten... Wir kümmern uns darum! 🚨"
    },
    "update_profile": {
      "internal_server": "Auf unserer Seite ist etwas kaputt gegangen... Wir arbeiten daran 🔧",
      "connection_timeout": "Keine Verbindung... Überprüfe dein Internet und versuche es erneut 📡",
      "unexpected": "Ein unerwarteter Fehler ist aufgetreten... Wir kümmern uns darum! 🚨"
    },
    "change_password": {
      "weak_password": "Hmm, dieses Passwort ist zu schwach :( Versuch etwas Stärkeres 🔐",
      "invalid_credentials": "Sieht so aus, als ob dein Passwort nicht korrekt ist... Bitte überprüfe es und versuche es erneut 😉",
      "internal_server": "Ups! Auf unserer Seite ist etwas schiefgelaufen... Wir beheben es! ⚙️",
      "connection_timeout": "Verbindung nicht möglich... Überprüfe dein Internet und versuche es erneut 📶",
      "unexpected": "Ein unerwartetes Problem ist aufgetreten... Wir prüfen es! 🚨"
    },
    "facts": {
      "explanation_reward_missing": "Ups! Etwas ist passiert... Wir konnten nicht bestätigen, dass die Anzeige abgeschlossen wurde. Bitte versuche es erneut 🙏",
      "explanation_insufficient_stars": "Du hast nicht genug Sterne, um diesen Fakt freizuschalten... Sieh dir eine Anzeige an, um mehr zu bekommen 😔",
      "archive_limit_reached": "Du hast das Archivlimit erreicht... Entferne einige Einträge oder wechsle zu Premium für unbegrenzte Speicherungen 📚",
      "internal_server": "Ups! Auf unserer Seite ist etwas schiefgelaufen... Wir beheben es! ⚙️",
      "connection_timeout": "Verbindung nicht möglich... Überprüfe dein Internet und versuche es erneut 📶",
      "unexpected": "Ein unerwartetes Problem ist aufgetreten... Wir prüfen es! 🚨",
      "no_ad_for_explanation": {
        "title": "Entschuldigung 😔",
        "subtitle": "Es tut uns leid, dass Sie warten müssen, aber im Moment sind keine Anzeigen verfügbar... Bitte versuchen Sie es in ein paar Minuten erneut :("
      }
    },
    "subscriptions": {
      "configuration": "Beim Einrichten deines Kaufs ist etwas schiefgelaufen... Bitte versuche es erneut 🙏",
      "purchase_not_allowed": "Oh... Käufe sind auf diesem Gerät oder Konto nicht erlaubt 😕",
      "purchase_cancelled": "Kauf abgebrochen... Kein Problem, du kannst es jederzeit erneut versuchen 🙂",
      "payment_pending": "Deine Zahlung wird noch verarbeitet... Bitte warte einen Moment ⏳",
      "payment_failed": "Zahlung fehlgeschlagen... Bitte überprüfe deine Zahlungsmethode 💳",
      "already_subscribed": "Du hast bereits ein aktives Abonnement 🎉",
      "subscription_not_found": "Kein aktives Abonnement gefunden... Versuche es erneut oder überprüfe dein Konto 🙂",
      "insufficient_permissions": "Der Kauf konnte nicht überprüft werden... Bitte melde dich erneut an 🔐",
      "internal_server": "Ups! Auf unserer Seite ist etwas schiefgelaufen... Wir kümmern uns darum ⚙️",
      "connection_timeout": "Verbindung fehlgeschlagen... Bitte überprüfe deine Internetverbindung 📶",
      "unexpected": "Ein unerwarteter Fehler ist aufgetreten... Wir untersuchen das 🚨"
    },
    "common": {
      "internal_server": "Auf unserer Seite ist etwas kaputt gegangen... Wir arbeiten daran 🔧",
      "connection_timeout": "Keine Verbindung... Überprüfe dein Internet und versuche es erneut 📡",
      "authorization": "Es scheint ein Problem mit der Autorisierung zu geben... Bitte logge dich aus und wieder ein 🔐",
      "too_many_requests": "Anfragelimit erreicht... Warte kurz, bevor du es erneut versuchst 🔄",
      "unexpected": "Oh! Ein unerwarteter Fehler ist aufgetreten... Wir kümmern uns darum! 🚨"
    },
    "email": {
      "failed_to_open_support": "Ups! Wir konnten deine E-Mail-App nicht öffnen... Aber du kannst uns jederzeit eine Nachricht an {} senden 💌"
    }
  },
  "info_message": {
    "password_change_success": "Passwort erfolgreich geändert!",
    "password_reset_success": "Passwort erfolgreich aktualisiert!",
    "password_mismatch": "Ups! Die Passwörter stimmen nicht überein... Bitte überprüfe sie 🔂",
    "signup_success": "Willkommen an Bord!",
    "no_results": {
      "title": "➡️ Ups, hier ist nichts ⬅️",
      "daily_facts": "Noch keine täglichen Fakten... Schau später wieder vorbei für Neues!",
      "facts_archive": "Dein Archiv ist leer — speichere ein paar Fakten und sie werden hier angezeigt!"
    },
    "agreeing_to_terms": "Wenn du fortfährst, akzeptierst du unsere\n<terms>AGB</terms> und den <privacy>Datenschutz</privacy>"
  },
  "dialog": {
    "session_expired": {
      "title": "Willkommen zurück!",
      "subtitle": "Deine Sitzung hat ein kleines Nickerchen gemacht... Bitte melde dich erneut an, um sie aufzuwecken! 😴"
    },
    "account_delete": {
      "title": "Lebewohl :(",
      "subtitle": "Das Löschen deines Kontos entfernt dauerhaft deine Daten... Diese Aktion kann nicht rückgängig gemacht werden ⛔️"
    },
    "permission": {
      "notifications": {
        "title": "Erlaubnis",
        "subtitle": {
          "basic": "Um Benachrichtigungen zu erhalten, erlaube den Zugriff für diese App",
          "in_settings": "Um Benachrichtigungen zu erhalten, erlaube den Zugriff für diese App in den Systemeinstellungen"
        }
      },
      "photosAdd": {
        "title": "Erlaubnis",
        "subtitle": {
          "basic": "Um Dateien zu speichern und zu teilen, erlaube bitte den Speicherzugriff für diese App",
          "in_settings": "Um Dateien zu speichern und zu teilen, erlaube bitte den Speicherzugriff für diese App in den Systemeinstellungen"
        }
      },
      "photosFull": {
        "title": "Erlaubnis",
        "subtitle": {
          "basic": "Um Dateien zu speichern und zu teilen, erlauben Sie dieser App den Zugriff auf Fotos",
          "in_settings": "Um Dateien zu speichern und zu teilen, erlauben Sie dieser App den Zugriff auf Fotos in den Systemeinstellungen"
        }
      }
    },
    "ad_alert": {
      "title": "Traurige Nachricht :(",
      "subtitle": "Um diese Funktion für dich kostenlos zu halten, müssen wir eine Anzeige zeigen... Danke für dein Verständnis und deine Unterstützung!"
    },
    "reset_password_expired": {
      "title": "Link abgelaufen ⏳",
      "subtitle": "Dein Link zum Zurücksetzen des Passworts ist abgelaufen... Bitte fordere einen neuen an, um sicher fortzufahren"
    },
    "reset_password_email_sent": {
      "title": "Überprüfe dein Postfach 📬",
      "subtitle": "Wir haben einen Link zum Zurücksetzen des Passworts an deine E-Mail-Adresse gesendet... Folge den Anweisungen, um ein neues Passwort festzulegen 🔑"
    },
    "select_notification_time": {
      "title": "Zeit auswählen",
      "button": "Ok"
    },
    "reset_password_enter_email": {
      "title": "Passwort zurücksetzen",
      "subtitle": "Wir senden dir einen Link zum Zurücksetzen des Passworts an deine E-Mail... Falls nichts ankommt, warte 30 Sekunden und versuch es erneut :)"
    },
    "success_purchase": {
      "title": "Alles bereit!",
      "subtitle": "Dein Premium-Zugang ist bis zum {} aktiv. Vielen Dank für deine Unterstützung! ❤️"
    },
    "subscription_packages_switch": {
      "title": "Kleiner Hinweis!",
      "subtitle": "Wenn du deinen Tarif änderst, wird dein aktuelles Abonnement ersetzt und der verbleibende Wert auf den neuen Tarif angewendet 😉"
    },
    "background_purchase_confirmation": {
      "title": "Juhu!",
      "subtitle": "Möchtest du diesen Hintergrund für {} Sterne freischalten?"
    },
    "background_insufficient_balance": {
      "title": "Noch nicht genug 🥺",
      "subtitle": "Du hast noch nicht genug Sterne, um diesen Hintergrund freizuschalten"
    },
    "background_insufficient_few_balance": {
      "title": "Fast geschafft ⭐️",
      "subtitle": {
        "one": "Dir fehlt nur noch {} Stern, um diesen Hintergrund freizuschalten!",
        "other": "Dir fehlen nur noch {} Sterne, um diesen Hintergrund freizuschalten!"
      }
    },
    "email_change": {
      "title": "Kleiner Hinweis!",
      "subtitle": "Bitte stellen Sie sicher, dass Sie Zugriff auf diese E-Mail-Adresse haben. Sie wird für die Kontowiederherstellung verwendet 📧"
    },
    "signup_review_encourage": {
      "title": "Schön, dass du hier bist 🎉",
      "subtitle": "Danke, dass du Denwee nutzt! Wenn dir die App gefällt, hilft eine kurze Bewertung sehr dabei, sie zu unterstützen. Wir wünschen dir einen tollen Tag! ❤️"
    }
  },
  "snackbar": {
    "badConnection": {
      "title": "Ups! Verbindung abgebrochen 📶",
      "description": "Bitte überprüfe dein Netzwerk und versuche es erneut!"
    }
  }
};
static const Map<String,dynamic> _ru = {
  "appTitle": "Denwee",
  "welcome": {
    "title": "Denwee",
    "subtitle": "Узнавайте быстрые и запоминающиеся факты с понятными объяснениями каждый день!",
    "begin_cta": "Начать",
    "have_an_account": "Уже есть аккаунт?"
  },
  "user_interest": {
    "history": "История",
    "science": "Наука",
    "space": "Космос",
    "nature": "Природа",
    "society": "Общество",
    "human_body": "Тело",
    "art": "Искусство",
    "movies_music": "Кино и музыка",
    "mind": "Разум",
    "food": "Еда",
    "technology": "Технологии",
    "money": "Деньги",
    "habits": "Привычки",
    "random_curiosities": "Случайные факты"
  },
  "onboarding": {
    "select_interests": {
      "title": "Что обычно пробуждает ваше любопытство?",
      "subtitle": "Расскажите, что вас интересует",
      "cta": "Выбрать"
    },
    "select_notification_time": {
      "title": "Ежедневное напоминание для любопытства",
      "subtitle": "Мы будем присылать один факт в день",
      "time_selection_title": "Время",
      "dummy_notification": {
        "title": "🌙 Доброй ночки",
        "body": "Сердце голубого кита настолько велико, что может весить более 180 кг и по размеру равно малой машине, бьется всего 8-10 раз в минуту!",
        "time_ago": "сейчас"
      },
      "cta": "Включить"
    },
    "select_theme_colorations": {
      "title": "Найдите цвета, которые вам подходят",
      "subtitle": "Настройте внешний вид под себя",
      "cta": "Применить"
    },
    "value_primer": {
      "title": "Превратите ваше любопытство в знания",
      "bullets": {
        "line_1": "Откройте короткий факт",
        "line_2": "Нажмите «{}»",
        "line_3": "Узнайте историю за этим фактом"
      },
      "cta": "Начать"
    }
  },
  "account": {
    "section": {
      "profile": {
        "title": "Профиль"
      },
      "subscription": {
        "title": "Подписка"
      },
      "interests": {
        "title": "Интересы"
      },
      "daily_facts": {
        "title": "Ежедневные факты",
        "items": {
          "receive_notification": "Получать уведомления",
          "notification_time": "Время уведомления",
          "archive": "Архив"
        }
      },
      "background": {
        "title": "Фон",
        "more": "Ещё"
      },
      "theme": {
        "title": "Тема",
        "items": {
          "system": "Система",
          "light": "Светлая",
          "dark": "Тёмная"
        }
      },
      "coloration": {
        "title": "Цвета"
      },
      "preferences": {
        "title": "Настройки",
        "items": {
          "language": "Язык",
          "haptics": "Тактильный отклик"
        }
      },
      "more": {
        "title": "Еще",
        "items": {
          "about_app": "О приложении",
          "privacy_terms": "Политика и Условия",
          "contact_support": "Связаться с поддержкой"
        }
      }
    },
    "statistics": {
      "stars": {
        "title": "Звёзды",
        "hint": "1 реклама = 1 звезда\nИспользуйте звёзды, чтобы мгновенно открывать объяснения без рекламы или разблокировать новые фоны :)"
      },
      "streak": {
        "title": "Стрик",
        "hint": "Стрик показывает, сколько дней подряд Вы открывали хотя бы один факт - Не пропускайте ни дня, чтобы не потерять его!"
      },
      "facts": {
        "title": "Факты",
        "hint": "Количество фактов, которые Вы уже открыли - Пополняйте это число и расширяйте свои знания!"
      }
    },
    "profile": {
      "default_username": "Дэнви Юзер",
      "register_encourage_msg": "Создайте свой аккаунт - Тапните, чтобы начать",
      "logged_in_encourage_msg": "Тапните, чтобы посмотреть свой профиль",
      "personal": {
        "title": "Личное"
      },
      "subscription": {
        "title": "Подписка"
      },
      "more": {
        "title": "Еще",
        "change_password": "Поменять\nпароль",
        "contact_support": "Связаться\nс поддержкой"
      }
    }
  },
  "subscription": {
    "basic_plan": "Denwee Basic",
    "premium_plan": "Premium",
    "active_plan": "Активный план",
    "upgrade_cta": "Обновить",
    "trial_cta": "Бесплатно",
    "paywall": {
      "title": "Получайте больше от каждого факта без ограничений",
      "benefits": {
        "line_1": "Мгновенные объяснения фактов",
        "line_2": "Все фоны без ограничений",
        "line_3": "Больше никакой рекламы",
        "ads_encourage_msg": {
          "one": "Вы потратили ~{} минуту на рекламу. Экономьте больше времени с Premium 🫶",
          "few": "Вы потратили ~{} минуты на рекламу. Экономьте больше времени с Premium 🫶",
          "many": "Вы потратили ~{} минут на рекламу. Экономьте больше времени с Premium 🫶",
          "other": "Вы потратили ~{} минут на рекламу. Экономьте больше времени с Premium 🫶"
        }
      },
      "package": {
        "weekly": {
          "title": "Пробный период 3 дня",
          "price_string": "затем {} в неделю"
        },
        "monthly": {
          "title": "Ежемесячно",
          "price_string": "{} в месяц"
        },
        "yearly": {
          "title": "Ежегодно",
          "price_string": "{} в год",
          "discount_badge": "Скидка {}%"
        }
      },
      "footer": {
        "restore": "Восстановить",
        "privacy": "Политика",
        "terms": "Условия"
      },
      "expiry": "До"
    }
  },
  "backgrounds": {
    "selected": "Текущий фон",
    "apply": "Применить",
    "unlock": "Разблокировать"
  },
  "showcase": {
    "title": "Ваши ежедневные факты будут здесь",
    "subtitle": "Свайпайте влево или вправо",
    "button": "Ok :)"
  },
  "fact_share": {
    "more": "Ещё",
    "hide_watermark": "Убрать водяной знак",
    "archive": {
      "archive": "Архивировать",
      "unarchive": "Разархивировать"
    },
    "copy": {
      "copy": "Скопировать",
      "copied": "Скопировано"
    },
    "download": {
      "download": "Скачать",
      "saved": "Скачано"
    },
    "resource": "Источник"
  },
  "validation": {
    "email": {
      "empty": "Пожалуйста, введите адрес электронной почты",
      "invalid": "Похоже, введённый вами адрес электронной почты недействителен"
    },
    "password": {
      "empty": "Пожалуйста, введите пароль",
      "short": "Пароль слишком короткий",
      "long": "Пароль слишком длинный"
    },
    "username": {
      "empty": "Пожалуйста, введите имя",
      "short": "Имя слишком короткое",
      "long": "Имя слишком длинное"
    },
    "interests": {
      "not_enough": "Выберите как минимум {} интереса для лучшего опыта"
    }
  },
  "input_field": {
    "hint": {
      "email": "Эл. почта",
      "password": "Пароль",
      "name": "Имя",
      "old_password": "Старый пароль",
      "new_password": "Новый пароль",
      "confirm_password": "Повторите пароль"
    }
  },
  "fact_unlock_method": {
    "ad": {
      "title": "Реклама",
      "subtitle": "Вы можете заработать 1 Звезду и открыть факт, посмотрев рекламу"
    },
    "star": {
      "title": "Звезда",
      "subtitle": "Вы можете использовать 1 Звезду, чтобы открыть факт без просмотра рекламы"
    }
  },
  "label": {
    "login": "Логин",
    "register": "Регистрация",
    "change_password": "Смена пароля",
    "reset_password": "Сброс пароля",
    "create_an_account": "Создать аккаунт",
    "forgot_pass_question": "Забыли пароль?",
    "dont_have_an_account_question": "Еще нет аккаунта?",
    "have_an_account_question": "Уже есть аккаунт?",
    "daily_facts": "Факты дня",
    "oops": "Упс!"
  },
  "button": {
    "login": "Войти",
    "register": "Войти",
    "logout": "Выйти",
    "delete_account": "Удалить аккаунт",
    "save": "Сохранить",
    "change": "Поменять",
    "explain_fact": "Подробнее"
  },
  "loading": {
    "just_a_moment": "Секундочку..."
  },
  "error_generic_titles": {
    "title1": "Упс!",
    "title2": "Ой-ой!",
    "title3": "Ой!",
    "title4": "О черт!",
    "title5": "Хм...",
    "title6": "Только не сейчас 😔",
    "title7": "Какой-то глюк 😕",
    "title8": "Не задалось 🥺",
    "title9": "Небольшой сбой!",
    "title10": "Не завелось 😔",
    "title11": "Не сработало 🥺"
  },
  "error_message": {
    "login": {
      "invalid_email": "Похоже, это некорректный адрес электронной почты... Проверьте, пожалуйста, ещё раз 😉",
      "weak_password": "Этот пароль слишком простой :( Попробуйте сделать его посложнее 🔐",
      "user_not_found": "Мы не нашли аккаунт с такими данными... Возможно, вы ещё не зарегистрированы?",
      "user_banned": "Этот аккаунт заблокирован :( Если это ошибка, пожалуйста, свяжитесь с поддержкой 🙏",
      "cancelled": "Вход был отменён... Не беда, попробуйте снова, когда будете готовы 😉",
      "internal_server": "Упс! Что-то пошло не так на нашей стороне... Уже работаем над этим! 🔧",
      "connection_timeout": "Не удалось подключиться... Проверьте интернет и попробуйте снова 📶",
      "unexpected": "Произошла непредвиденная ошибка... Мы уже разбираемся! 🚨"
    },
    "register": {
      "invalid_email": "Этот адрес электронной почты выглядит некорректным... Проверьте, пожалуйста, ещё раз ✉️",
      "weak_password": "Пароль слишком слабый :( Попробуйте сделать его посложнее 🔐",
      "user_already_exists": "Такая почта уже используется... Попробуйте войти в свой аккаунт 😉",
      "disabled": "Регистрация временно недоступна... Повторите попытку позже 🕒",
      "cancelled": "Регистрация была отменена... Вы можете продолжить в любое время, когда будете готовы 😉",
      "internal_server": "Что-то сломалось на нашей стороне... Уже исправляем 🔧",
      "connection_timeout": "Нет соединения... Проверьте интернет и попробуйте снова 📡",
      "unexpected": "Произошла неожиданная ошибка... Мы уже разбираемся! 🚨"
    },
    "update_profile": {
      "internal_server": "Что-то сломалось на нашей стороне... Уже исправляем 🔧",
      "connection_timeout": "Нет соединения... Проверьте интернет и попробуйте снова 📡",
      "unexpected": "Произошла неожиданная ошибка... Мы уже разбираемся! 🚨"
    },
    "change_password": {
      "weak_password": "Хм, этот пароль слишком слабый... попробуйте что-то посильнее 🔐",
      "invalid_credentials": "Похоже, вы ввели неправильный пароль... проверьте ещё раз 😉",
      "internal_server": "Что-то сломалось на нашей стороне... Уже исправляем 🔧",
      "connection_timeout": "Нет соединения... Проверьте интернет и попробуйте снова 📡",
      "unexpected": "Произошла неожиданная ошибка... Мы уже разбираемся! 🚨"
    },
    "facts": {
      "explanation_reward_missing": "Нам не удалось подтвердить просмотр рекламы. Попробуйте ещё раз 🙏",
      "explanation_insufficient_stars": "У вас недостаточно звезд на балансе, чтобы открыть этот факт... Посмотрите рекламу, чтобы заработать больше 😔",
      "archive_limit_reached": "Достигнут лимит :( Удалите несколько фактов из архива или обновитесь до Premium для неограничённого доступа 📚",
      "internal_server": "Что-то сломалось на нашей стороне... Уже исправляем 🔧",
      "connection_timeout": "Нет соединения... Проверьте интернет и попробуйте снова 📡",
      "unexpected": "Произошла неожиданная ошибка... Мы уже разбираемся! 🚨",
      "no_ad_for_explanation": {
        "title": "Наши извинения 😔",
        "subtitle": "Нам жаль, что заставляем вас ждать, но сейчас нет доступных реклам... Пожалуйста, попробуйте через несколько минут :("
      }
    },
    "subscriptions": {
      "configuration": "Что-то пошло не так при оформлении покупки... Пожалуйста, попробуйте ещё раз 🙏",
      "purchase_not_allowed": "Ой... Похоже, покупки недоступны на этом устройстве или аккаунте 😕",
      "purchase_cancelled": "Покупка отменена... Ничего страшного, вы можете попробовать снова 🙂",
      "payment_pending": "Платёж всё ещё обрабатывается... Пожалуйста, подождите ⏳",
      "payment_failed": "Платёж не прошёл... Проверьте способ оплаты и попробуйте снова 💳",
      "already_subscribed": "У вас уже есть активная подписка 🎉",
      "subscription_not_found": "Активная подписка не найдена... Попробуйте восстановить или проверьте аккаунт 🙂",
      "insufficient_permissions": "Не удалось подтвердить покупку... Пожалуйста, восстановите или войдите снова 🔐",
      "internal_server": "Упс! Что-то пошло не так на нашей стороне... Мы уже исправляем ⚙️",
      "connection_timeout": "Не удалось подключиться... Проверьте интернет и попробуйте снова 📶",
      "unexpected": "Произошла непредвиденная ошибка... Мы уже разбираемся 🚨"
    },
    "common": {
      "internal_server": "Что-то сломалось на нашей стороне... Уже исправляем 🔧",
      "connection_timeout": "Нет соединения... Проверьте интернет и попробуйте снова 📡",
      "authorization": "Упс! Что-то пошло не так с авторизацией... Попробуйте выйти из аккаунта и войти снова 🔐",
      "too_many_requests": "Лимит запросов достигнут... Подождите немного и попробуйте снова 🔄",
      "unexpected": "Ого! У нас произошла неожиданная ошибка... Мы уже разбираемся! 🚨"
    },
    "email": {
      "failed_to_open_support": "Упс :( Нам не удалось открыть почтовое приложение... Но вы всегда можете написать нам на {} 💌"
    }
  },
  "info_message": {
    "password_change_success": "Пароль успешно изменён!",
    "password_reset_success": "Пароль успешно обновлен!",
    "password_mismatch": "Упс! Пароли не совпадают... Пожалуйста, перепроверьте их 🔂",
    "signup_success": "Добро пожаловать!",
    "no_results": {
      "title": "➡️ Упс, здесь пусто ⬅️",
      "daily_facts": "Ежедневные факты пока отсутствуют... Загляните позже, здесь появится что-то новое!",
      "facts_archive": "Ваш архив пуст — сохраните несколько фактов, и они появятся здесь!"
    },
    "agreeing_to_terms": "Продолжая, вы соглашаетесь с нашими\n<terms>Условиями</terms> и <privacy>Политикой</privacy>"
  },
  "dialog": {
    "session_expired": {
      "title": "С возвращением!",
      "subtitle": "Похоже, ваша сессия немного задремала... Пожалуйста, войдите в свой аккаунт чтобы взбодрить ее! 😴"
    },
    "account_delete": {
      "title": "Прощай :(",
      "subtitle": "Удаление аккаунта приведёт к безвозвратному удалению всех ваших данных... Это действие невозможно отменить ⛔️"
    },
    "permission": {
      "notifications": {
        "title": "Разрешение",
        "subtitle": {
          "basic": "Чтобы получать уведомления, предоставьте этому приложению разрешение",
          "in_settings": "Чтобы получать уведомления, предоставьте этому приложению разрешение в системных настройках"
        }
      },
      "photosAdd": {
        "title": "Разрешение",
        "subtitle": {
          "basic": "Чтобы сохранять и делиться файлами, предоставьте этому приложению разрешение",
          "in_settings": "Чтобы сохранять и делиться файлами, предоставьте этому приложению разрешение в системных настройках"
        }
      },
      "photosFull": {
        "title": "Разрешение",
        "subtitle": {
          "basic": "Чтобы сохранять и делиться файлами, разрешите приложению доступ к фотографиям",
          "in_settings": "Чтобы сохранять и делиться файлами, разрешите приложению доступ к фотографиям в системных настройках"
        }
      }
    },
    "ad_alert": {
      "title": "Печальные новости :(",
      "subtitle": "Чтобы сохранить эту функцию бесплатной для вас, нам нужно показать рекламу... Спасибо за понимание и поддержку!"
    },
    "reset_password_expired": {
      "title": "Ссылка истекла ⏳",
      "subtitle": "Срок действия ссылки для сброса пароля истёк... Пожалуйста, запросите новую, чтобы продолжить"
    },
    "reset_password_email_sent": {
      "title": "Проверьте почту 📬",
      "subtitle": "Мы отправили ссылку для сброса пароля на вашу почту... Следуйте инструкциям, чтобы установить новый пароль 🔑"
    },
    "select_notification_time": {
      "title": "Выберите время",
      "button": "Ok"
    },
    "reset_password_enter_email": {
      "title": "Сброс пароля",
      "subtitle": "Мы отправим ссылку для сброса пароля на вашу почту... Если письмо не появится, подождите 30 секунд и попробуйте ещё раз :)"
    },
    "success_purchase": {
      "title": "Всё готово!",
      "subtitle": "Ваш доступ Premium активен до {}. Огромное спасибо за вашу поддержку! ❤️"
    },
    "subscription_packages_switch": {
      "title": "Небольшое предупреждение!",
      "subtitle": "Когда вы меняете тариф, текущая подписка будет заменена, а оставшаяся стоимость будет применена к новому плану 😉"
    },
    "background_purchase_confirmation": {
      "title": "Юху!",
      "subtitle": "Хотите разблокировать этот фон за {} звёзд?"
    },
    "background_insufficient_balance": {
      "title": "Пока не хватает 🥺",
      "subtitle": "У вас пока недостаточно звёзд, чтобы разблокировать этот фон"
    },
    "background_insufficient_few_balance": {
      "title": "Еще чуть-чуть ⭐️",
      "subtitle": {
        "one": "Нужна всего {} звезда, чтобы разблокировать этот фон!",
        "other": "Нужно всего {} звёзд, чтобы разблокировать этот фон!"
      }
    },
    "email_change": {
      "title": "Небольшое уведомление!",
      "subtitle": "Пожалуйста, убедитесь, что у вас есть доступ к этой почте. Она будет использоваться для восстановления аккаунта 📧"
    },
    "signup_review_encourage": {
      "title": "Рады видеть вас здесь 🎉",
      "subtitle": "Спасибо, что пользуетесь Denwee! Если вам нравится приложение, короткий отзыв — отличный способ поддержать его. Желаем вам прекрасного дня! ❤️"
    }
  },
  "snackbar": {
    "badConnection": {
      "title": "Упс! Соединение пропало 📶",
      "description": "Проверьте сеть и попробуйте снова!"
    }
  }
};
static const Map<String,dynamic> _en = {
  "appTitle": "Denwee",
  "welcome": {
    "title": "Denwee",
    "subtitle": "Discover quick and memorable facts with clear explanations every day!",
    "begin_cta": "Explore",
    "have_an_account": "Have an account?"
  },
  "user_interest": {
    "history": "History",
    "science": "Science",
    "space": "Space",
    "nature": "Nature",
    "society": "Society",
    "human_body": "Human Body",
    "art": "Art",
    "movies_music": "Movies & Music",
    "mind": "Mind",
    "food": "Food",
    "technology": "Technology",
    "money": "Money",
    "habits": "Habits",
    "random_curiosities": "Random Facts"
  },
  "onboarding": {
    "select_interests": {
      "title": "What usually sparks your curiosity?",
      "subtitle": "Tell us what excites you the most",
      "cta": "Choose"
    },
    "select_notification_time": {
      "title": "A daily reminder to stay curious",
      "subtitle": "We’ll send you one fact every day",
      "time_selection_title": "Time",
      "dummy_notification": {
        "title": "🌙  Good evening!",
        "body": "The heart of a blue whale is so massive it can weigh over 180 kg and is about the size of a small car, beating only 8-10 times a minute!",
        "time_ago": "now"
      },
      "cta": "Enable"
    },
    "select_theme_colorations": {
      "title": "Find colors that feel right to you",
      "subtitle": "Personalize your experience with colors",
      "cta": "Apply"
    },
    "value_primer": {
      "title": "Turn curiosity into knowledge",
      "bullets": {
        "line_1": "Discover a short fact",
        "line_2": "Tap “{}” to go deeper",
        "line_3": "Learn the story behind the fact"
      },
      "cta": "Explore"
    }
  },
  "account": {
    "section": {
      "profile": {
        "title": "Profile"
      },
      "subscription": {
        "title": "Subscription"
      },
      "interests": {
        "title": "Interests"
      },
      "daily_facts": {
        "title": "Daily Facts",
        "items": {
          "receive_notification": "Receive notifications",
          "notification_time": "Notification time",
          "archive": "Archive"
        }
      },
      "background": {
        "title": "Background",
        "more": "More"
      },
      "theme": {
        "title": "Theme",
        "items": {
          "system": "System",
          "light": "Light",
          "dark": "Dark"
        }
      },
      "coloration": {
        "title": "Colorations"
      },
      "preferences": {
        "title": "Preferences",
        "items": {
          "language": "Language",
          "haptics": "Haptics"
        }
      },
      "more": {
        "title": "More",
        "items": {
          "about_app": "About app",
          "privacy_terms": "Privacy & Terms",
          "contact_support": "Contact support"
        }
      }
    },
    "statistics": {
      "stars": {
        "title": "Stars",
        "hint": "1 Ad = 1 Star\nUse stars to instantly unlock fact explanations without ads, or unlock new backgrounds :)"
      },
      "streak": {
        "title": "Streak",
        "hint": "Your streak shows how many days in a row you've unlocked at least one fact - Don't miss a day to keep it going!"
      },
      "facts": {
        "title": "Facts",
        "hint": "The number of facts you've already unlocked - Collect them all and expand your knowledge!"
      }
    },
    "profile": {
      "default_username": "Denwee User",
      "register_encourage_msg": "Sync your account across devices - Tap to begin",
      "logged_in_encourage_msg": "You're logged in! Tap to manage your profile",
      "personal": {
        "title": "Personal"
      },
      "subscription": {
        "title": "Subscription"
      },
      "more": {
        "title": "More",
        "change_password": "Change\npassword",
        "contact_support": "Contact\nsupport"
      }
    }
  },
  "subscription": {
    "basic_plan": "Denwee Basic",
    "premium_plan": "Premium",
    "active_plan": "Active plan",
    "upgrade_cta": "Upgrade",
    "trial_cta": "Try for free",
    "paywall": {
      "title": "Get more from every fact & explore without limits",
      "benefits": {
        "line_1": "Instant fact explanations",
        "line_2": "Unlock all backgrounds",
        "line_3": "No ads — ever",
        "ads_encourage_msg": {
          "one": "You’ve spent ~{} minute on ads. Save more time with Premium 🫶",
          "other": "You’ve spent ~{} minutes on ads. Save more time with Premium 🫶"
        }
      },
      "package": {
        "weekly": {
          "title": "3-Day Trial",
          "price_string": "then {} per week"
        },
        "monthly": {
          "title": "Monthly Plan",
          "price_string": "{} per month"
        },
        "yearly": {
          "title": "Annual Plan",
          "price_string": "{} per year",
          "discount_badge": "Save {}%"
        }
      },
      "footer": {
        "restore": "Restore",
        "privacy": "Privacy",
        "terms": "Terms"
      },
      "expiry": "Expiry"
    }
  },
  "backgrounds": {
    "selected": "Selected",
    "apply": "Apply",
    "unlock": "Unlock"
  },
  "showcase": {
    "title": "Your daily facts will be shown here",
    "subtitle": "Swipe left or right to explore!",
    "button": "Ok :)"
  },
  "fact_share": {
    "more": "More",
    "hide_watermark": "Hide watermark",
    "archive": {
      "archive": "Archive",
      "unarchive": "Unarchive"
    },
    "copy": {
      "copy": "Copy",
      "copied": "Copied"
    },
    "download": {
      "download": "Download",
      "saved": "Saved"
    },
    "resource": "Resource"
  },
  "validation": {
    "email": {
      "empty": "Please provide an email",
      "invalid": "Looks like the email you have provided is invalid"
    },
    "password": {
      "empty": "Please provide a password",
      "short": "Password is too short",
      "long": "Password is too long"
    },
    "username": {
      "empty": "Please provide some name",
      "short": "Name is too short",
      "long": "Name is too long"
    },
    "interests": {
      "not_enough": "Pick at least {} interests for the best experience"
    }
  },
  "input_field": {
    "hint": {
      "email": "Email",
      "password": "Password",
      "name": "Name",
      "old_password": "Old password",
      "new_password": "New password",
      "confirm_password": "Confirm password"
    }
  },
  "fact_unlock_method": {
    "ad": {
      "title": "Ad",
      "subtitle": "You can earn 1 Star and unlock the fact by watching an ad"
    },
    "star": {
      "title": "Star",
      "subtitle": "You can use 1 Star to unlock the fact without watching an ad"
    }
  },
  "label": {
    "login": "Login",
    "register": "Register",
    "change_password": "Change pass",
    "reset_password": "Reset pass",
    "create_an_account": "Create an account",
    "forgot_pass_question": "Forgot pass?",
    "dont_have_an_account_question": "Don't have an account?",
    "have_an_account_question": "Have an account?",
    "daily_facts": "Daily Facts",
    "oops": "Oops!"
  },
  "button": {
    "login": "Log in",
    "register": "Join",
    "logout": "Log out",
    "delete_account": "Delete account",
    "save": "Save",
    "change": "Change",
    "explain_fact": "Read More"
  },
  "loading": {
    "just_a_moment": "Just a moment..."
  },
  "error_generic_titles": {
    "title1": "Oops!",
    "title2": "Uh-oh!",
    "title3": "Whoops!",
    "title4": "Oh no!",
    "title5": "Hmm...",
    "title6": "Not now 😔",
    "title7": "Yikes!",
    "title8": "Oopsie!",
    "title9": "Tiny hiccup!",
    "title10": "Small glitch!",
    "title11": "Didn’t work 🥺"
  },
  "error_message": {
    "login": {
      "invalid_email": "That email doesn't look right... Could you please double-check it? 😉",
      "weak_password": "Hmm, that password is too easy to guess... Try something stronger 🔐",
      "user_not_found": "We couldn't find an account with those details... Did you sign up? 😉",
      "user_banned": "This account has been restricted... If you believe this is a mistake, please contact support 🙏",
      "cancelled": "Login was cancelled... You can try again whenever you’re ready 😉",
      "internal_server": "Oops! Something went wrong on our end... We're fixing it! 🔧",
      "connection_timeout": "Unable to connect... Please check your internet and try again 📶",
      "unexpected": "An unexpected issue occurred... We're looking into it! 🚨"
    },
    "register": {
      "invalid_email": "That email doesn’t look valid... Mind giving it another check? ✉️",
      "weak_password": "Oops, that password’s too weak... Try adding more strength to it 💪",
      "user_already_exists": "Looks like this email is already taken... Try logging in instead 😉",
      "disabled": "Registrations are currently closed... Please try again later 🕒",
      "cancelled": "Registration was cancelled... You can continue anytime when you’re ready 😉",
      "internal_server": "Something broke on our side... We're working on it 🔧",
      "connection_timeout": "No connection... Please check your internet and try again 📡",
      "unexpected": "Unexpected error happened... We're on it! 🚨"
    },
    "update_profile": {
      "internal_server": "Something broke on our side... We're working on it 🔧",
      "connection_timeout": "No connection... Please check your internet and try again 📡",
      "unexpected": "Unexpected error happened... We're on it! 🚨"
    },
    "change_password": {
      "weak_password": "Hmm, that password is too weak :( Try something stronger 🔐",
      "invalid_credentials": "Looks like your password isn’t quite right... Please double-check and try again 😉",
      "internal_server": "Oops! Something went wrong on our end... We're fixing it! ⚙️",
      "connection_timeout": "Unable to connect... Please check your internet and try again 📶",
      "unexpected": "An unexpected issue occurred... We're looking into it! 🚨"
    },
    "facts": {
      "explanation_reward_missing": "Oops! Something happened here... We couldn’t verify that the ad was completed. Please try again 🙏",
      "explanation_insufficient_stars": "You don't have enough stars on your balance to unlock this fact... Watch an ad to earn more 😔",
      "archive_limit_reached": "You’ve reached the archive limit... Remove some facts or upgrade to Premium for unlimited saves 📚",
      "internal_server": "Oops! Something went wrong on our end... We're fixing it! ⚙️",
      "connection_timeout": "We couldn't connect... Please check your internet and try again 📶",
      "unexpected": "An unexpected issue occurred... We're looking into it! 🚨",
      "no_ad_for_explanation": {
        "title": "Our apologies 😔",
        "subtitle": "We feel bad for keeping you waiting, but there are no ads available right now... Please try again in a few minutes :("
      }
    },
    "subscriptions": {
      "configuration": "Something went wrong while setting up your purchase... Please try again 🙏",
      "purchase_not_allowed": "Oh... Looks like purchases are not allowed on this device or account 😕",
      "purchase_cancelled": "Purchase was cancelled... No worries, you can try again anytime 🙂",
      "payment_pending": "Your payment is still being processed... Please wait a moment ⏳",
      "payment_failed": "Payment failed... Please check your payment method and try again 💳",
      "already_subscribed": "You already have an active subscription 🎉",
      "subscription_not_found": "No active subscription found... Try restoring again or check your account 🙂",
      "insufficient_permissions": "We couldn't verify your purchase... Please restore or sign in again 🔐",
      "internal_server": "Oops! Something went wrong on our end... We're fixing it! ⚙️",
      "connection_timeout": "We couldn't connect... Please check your internet and try again 📶",
      "unexpected": "An unexpected issue occurred... We're looking into it! 🚨"
    },
    "common": {
      "internal_server": "Something broke on our side... We're working on it 🔧",
      "connection_timeout": "No connection... Please check your internet and try again 📡",
      "authorization": "Looks like something went wrong with authorization... Could you please try logging out and logging back in? 🔐",
      "too_many_requests": "Request limit reached... Wait just a bit before giving it another go 🔄",
      "unexpected": "Oh! Some unexpected error happened... We're on it! 🚨"
    },
    "email": {
      "failed_to_open_support": "Whoops! We couldn’t open your email app... But you can reach us anytime by sending a message to {} 💌"
    }
  },
  "info_message": {
    "password_change_success": "Password changed successfully!",
    "password_reset_success": "Password updated successfully!",
    "password_mismatch": "Oops! The passwords don’t match... Please double-check 🔂",
    "signup_success": "Welcome aboard!",
    "no_results": {
      "title": "➡️ Oops, nothing here ⬅️",
      "daily_facts": "No daily facts yet... Check back later for something new!",
      "facts_archive": "Your archive is empty — save some facts and they’ll show up here!"
    },
    "agreeing_to_terms": "By continuing, you agree to our\n<terms>Terms</terms> and <privacy>Privacy</privacy>"
  },
  "dialog": {
    "session_expired": {
      "title": "Welcome back!",
      "subtitle": "Your session took a little nap... Please log in again to wake things up! 😴"
    },
    "account_delete": {
      "title": "Farewell :(",
      "subtitle": "Deleting your account will permanently remove your data... This action can’t be undone ⛔️"
    },
    "permission": {
      "notifications": {
        "title": "Permission",
        "subtitle": {
          "basic": "To receive notifications, make sure to allow permission for this app",
          "in_settings": "To receive notifications, make sure to allow permission for this app in the system settings"
        }
      },
      "photosAdd": {
        "title": "Permission",
        "subtitle": {
          "basic": "To save and share files, please allow storage access for this app",
          "in_settings": "To save and share files, please allow storage access for this app in the system settings"
        }
      },
      "photosFull": {
        "title": "Permission",
        "subtitle": {
          "basic": "To save and share files, please allow photos access for this app",
          "in_settings": "To save and share files, please allow photos access for this app in the system settings"
        }
      }
    },
    "ad_alert": {
      "title": "Sad news :(",
      "subtitle": "To keep this feature free for you, we need to show an ad... Thanks for understanding and supporting us!"
    },
    "reset_password_expired": {
      "title": "Link expired ⏳",
      "subtitle": "Your password reset link has expired... Please request a new one to continue securely"
    },
    "reset_password_email_sent": {
      "title": "Check your inbox 📬",
      "subtitle": "We’ve sent a password reset link to your email address... Follow the instructions inside to set a new password 🔑"
    },
    "select_notification_time": {
      "title": "Select time",
      "button": "Ok"
    },
    "reset_password_enter_email": {
      "title": "Reset password",
      "subtitle": "We’ll send a password reset link to your email... If nothing shows up, wait 30 seconds and try once more :)"
    },
    "success_purchase": {
      "title": "You’re all set!",
      "subtitle": "Your Premium access is now active until {}. Thanks a ton for your support! ❤️"
    },
    "subscription_packages_switch": {
      "title": "Just a heads up!",
      "subtitle": "When you change your plan, your current subscription will be replaced and any remaining value will be applied to the new plan 😉"
    },
    "background_purchase_confirmation": {
      "title": "Yahoo!",
      "subtitle": "Would you like to unlock this background for {} stars?"
    },
    "background_insufficient_balance": {
      "title": "Not enough yet 🥺",
      "subtitle": "You don’t have enough stars to unlock this background yet"
    },
    "background_insufficient_few_balance": {
      "title": "Almost there ⭐️",
      "subtitle": {
        "one": "You need just {} more star to unlock this background!",
        "other": "You need just {} more stars to unlock this background!"
      }
    },
    "email_change": {
      "title": "Just a heads up!",
      "subtitle": "Please make sure you have access to this email address. It will be used for account recovery 📧"
    },
    "signup_review_encourage": {
      "title": "Nice to see you here 🎉",
      "subtitle": "Thanks for using Denwee! If you enjoy the app, leaving a quick review is a great way to support it. Wishing you an awesome day ahead! ❤️"
    }
  },
  "snackbar": {
    "badConnection": {
      "title": "Oops! Connection dropped 📶",
      "description": "Please check your network and give it another try!"
    }
  }
};
static const Map<String,dynamic> _it = {
  "appTitle": "Denwee",
  "welcome": {
    "title": "Denwee",
    "subtitle": "Scopri ogni giorno fatti rapidi e memorabili con spiegazioni chiare!",
    "begin_cta": "Esplora",
    "have_an_account": "Hai un account?"
  },
  "user_interest": {
    "history": "Storia",
    "science": "Scienza",
    "space": "Spazio",
    "nature": "Natura",
    "society": "Società",
    "human_body": "Corpo umano",
    "art": "Arte",
    "movies_music": "Film e musica",
    "mind": "Mente",
    "food": "Cibo",
    "technology": "Tecnologia",
    "money": "Denaro",
    "habits": "Abitudini",
    "random_curiosities": "Fatti casuali"
  },
  "onboarding": {
    "select_interests": {
      "title": "Cosa accende la tua curiosità?",
      "subtitle": "Dicci cosa ti entusiasma di più",
      "cta": "Scegli"
    },
    "select_notification_time": {
      "title": "Un promemoria per restare curioso",
      "subtitle": "Ti invieremo un fatto ogni giorno",
      "time_selection_title": "Ora",
      "dummy_notification": {
        "title": "🌙  Buona sera!",
        "body": "Il cuore di una balena blu può pesare oltre 180 kg ed è delle dimensioni di un’auto piccola, battendo solo 8–10 volte al minuto!",
        "time_ago": "ora"
      },
      "cta": "Attiva"
    },
    "select_theme_colorations": {
      "title": "Trova i colori che fanno per te",
      "subtitle": "Personalizza l’esperienza con i colori",
      "cta": "Applica"
    },
    "value_primer": {
      "title": "Trasforma la curiosità in conoscenza",
      "bullets": {
        "line_1": "Scopri un fatto breve",
        "line_2": "Tocca «{}»",
        "line_3": "Scopri la storia dietro al fatto"
      },
      "cta": "Esplora"
    }
  },
  "account": {
    "section": {
      "profile": {
        "title": "Profilo"
      },
      "subscription": {
        "title": "Abbonamento"
      },
      "interests": {
        "title": "Interessi"
      },
      "daily_facts": {
        "title": "Fatti Giornalieri",
        "items": {
          "receive_notification": "Ricevi notifiche",
          "notification_time": "Orario notifica",
          "archive": "Archivio"
        }
      },
      "background": {
        "title": "Sfondo",
        "more": "Altro"
      },
      "theme": {
        "title": "Tema",
        "items": {
          "system": "Sistema",
          "light": "Chiaro",
          "dark": "Scuro"
        }
      },
      "coloration": {
        "title": "Colorazioni"
      },
      "preferences": {
        "title": "Preferenze",
        "items": {
          "language": "Lingua",
          "haptics": "Feedback aptico"
        }
      },
      "more": {
        "title": "Altro",
        "items": {
          "about_app": "Info sull'app",
          "privacy_terms": "Privacy & Termini",
          "contact_support": "Contatta supporto"
        }
      }
    },
    "statistics": {
      "stars": {
        "title": "Stelle",
        "hint": "1 Annuncio = 1 Stella\nUsa le stelle per sbloccare subito le spiegazioni dei fatti senza pubblicità oppure sbloccare nuovi sfondi :)"
      },
      "streak": {
        "title": "Serie",
        "hint": "La tua serie mostra quanti giorni consecutivi hai sbloccato almeno un fatto - Non saltare un giorno per mantenerla!"
      },
      "facts": {
        "title": "Fatti",
        "hint": "Il numero di fatti che hai già sbloccato - Collezionali tutti e amplia la tua conoscenza!"
      }
    },
    "profile": {
      "default_username": "Utente Denwee",
      "register_encourage_msg": "Sincronizza il tuo account su più dispositivi - Tocca per iniziare",
      "logged_in_encourage_msg": "Sei connesso! Tocca per gestire il tuo profilo",
      "personal": {
        "title": "Personale"
      },
      "subscription": {
        "title": "Abbonamento"
      },
      "more": {
        "title": "Altro",
        "change_password": "Cambia\npassword",
        "contact_support": "Contatta\nsupporto"
      }
    }
  },
  "subscription": {
    "basic_plan": "Denwee Basic",
    "premium_plan": "Premium",
    "active_plan": "Piano attivo",
    "upgrade_cta": "Passa",
    "trial_cta": "Prova gratis",
    "paywall": {
      "title": "Ottieni di più da ogni fatto senza limiti",
      "benefits": {
        "line_1": "Spiegazioni immediate",
        "line_2": "Sblocca tutti gli sfondi",
        "line_3": "Niente più pubblicità",
        "ads_encourage_msg": {
          "one": "Hai passato ~{} minuto sugli annunci. Risparmia più tempo con Premium 🫶",
          "other": "Hai passato ~{} minuti sugli annunci. Risparmia più tempo con Premium 🫶"
        }
      },
      "package": {
        "weekly": {
          "title": "Prova di 3 giorni",
          "price_string": "poi {} a settimana"
        },
        "monthly": {
          "title": "Mensile",
          "price_string": "{} / mese"
        },
        "yearly": {
          "title": "Annuale",
          "price_string": "{} / anno",
          "discount_badge": "Sconto {}%"
        }
      },
      "footer": {
        "restore": "Ripristina",
        "privacy": "Privacy",
        "terms": "Termini"
      },
      "expiry": "Scadenza"
    }
  },
  "backgrounds": {
    "selected": "Selezionato",
    "apply": "Applica",
    "unlock": "Sblocca"
  },
  "showcase": {
    "title": "I tuoi fatti giornalieri verranno mostrati qui",
    "subtitle": "Scorri a sinistra o a destra per esplorare!",
    "button": "Ok :)"
  },
  "fact_share": {
    "more": "Altro",
    "hide_watermark": "Nascondi filigrana",
    "archive": {
      "archive": "Archivia",
      "unarchive": "Rimuovi dall’archivio"
    },
    "copy": {
      "copy": "Copia",
      "copied": "Copiato"
    },
    "download": {
      "download": "Scarica",
      "saved": "Salvato"
    },
    "resource": "Risorsa"
  },
  "validation": {
    "email": {
      "empty": "Per favore inserisci un'email",
      "invalid": "Sembra che l'email fornita non sia valida"
    },
    "password": {
      "empty": "Per favore inserisci una password",
      "short": "La password è troppo corta",
      "long": "La password è troppo lunga"
    },
    "username": {
      "empty": "Per favore inserisci un nome",
      "short": "Il nome è troppo corto",
      "long": "Il nome è troppo lungo"
    },
    "interests": {
      "not_enough": "Scegli almeno {} interessi per un'esperienza migliore"
    }
  },
  "input_field": {
    "hint": {
      "email": "Email",
      "password": "Password",
      "name": "Nome",
      "old_password": "Vecchia password",
      "new_password": "Nuova password",
      "confirm_password": "Conferma password"
    }
  },
  "fact_unlock_method": {
    "ad": {
      "title": "Pubblicità",
      "subtitle": "Può guadagnare 1 Stella e sbloccare il fatto guardando una pubblicità"
    },
    "star": {
      "title": "Stella",
      "subtitle": "Può usare 1 Stella per sbloccare il fatto senza guardare una pubblicità"
    }
  },
  "label": {
    "login": "Accedi",
    "register": "Registrati",
    "change_password": "Cambia pass",
    "reset_password": "Resetta pass",
    "create_an_account": "Crea un account",
    "forgot_pass_question": "Hai dimenticato la password?",
    "dont_have_an_account_question": "Non hai un account?",
    "have_an_account_question": "Hai un account?",
    "daily_facts": "Fatti Giornalieri",
    "oops": "Ops!"
  },
  "button": {
    "login": "Accedi",
    "register": "Unisciti",
    "logout": "Esci",
    "delete_account": "Elimina account",
    "save": "Salva",
    "change": "Cambia",
    "explain_fact": "Scopri di più"
  },
  "loading": {
    "just_a_moment": "Un attimo..."
  },
  "error_generic_titles": {
    "title1": "Ops!",
    "title2": "Oh-oh!",
    "title3": "Oops!",
    "title4": "Oh no!",
    "title5": "Mmm...",
    "title6": "Non ora 😔",
    "title7": "Accidenti!",
    "title8": "Opss!",
    "title9": "Piccolo intoppo!",
    "title10": "Mini errore!",
    "title11": "Non è andata 🥺"
  },
  "error_message": {
    "login": {
      "invalid_email": "Quell'email non sembra corretta... Puoi ricontrollarla? 😉",
      "weak_password": "Hmm, quella password è troppo facile da indovinare... Prova con qualcosa di più sicuro 🔐",
      "user_not_found": "Non abbiamo trovato un account con quei dati... Ti sei registrato? 😉",
      "user_banned": "Questo account è stato limitato... Se pensi sia un errore, contatta il supporto 🙏",
      "cancelled": "L’accesso è stato annullato... Puoi riprovare quando sei pronto 😉",
      "internal_server": "Ops! Qualcosa è andato storto da parte nostra... Stiamo sistemando! 🔧",
      "connection_timeout": "Impossibile connettersi... Controlla la tua connessione e riprova 📶",
      "unexpected": "Si è verificato un problema imprevisto... Lo stiamo controllando! 🚨"
    },
    "register": {
      "invalid_email": "Quell'email non sembra valida... Puoi ricontrollarla? ✉️",
      "weak_password": "Ops, quella password è troppo debole... Prova a renderla più sicura 💪",
      "user_already_exists": "Sembra che questa email sia già in uso... Prova a effettuare il login 😉",
      "disabled": "Le registrazioni sono attualmente chiuse... Riprova più tardi 🕒",
      "cancelled": "La registrazione è stata annullata... Puoi continuare quando sei pronto 😉",
      "internal_server": "Qualcosa si è rotto da parte nostra... Stiamo lavorando per sistemarlo 🔧",
      "connection_timeout": "Nessuna connessione... Controlla la tua rete e riprova 📡",
      "unexpected": "Si è verificato un errore imprevisto... Stiamo lavorando! 🚨"
    },
    "update_profile": {
      "internal_server": "Qualcosa si è rotto da parte nostra... Stiamo lavorando per sistemarlo 🔧",
      "connection_timeout": "Nessuna connessione... Controlla la tua rete e riprova 📡",
      "unexpected": "Si è verificato un errore imprevisto... Stiamo lavorando! 🚨"
    },
    "change_password": {
      "weak_password": "Hmm, quella password è troppo debole :( Prova qualcosa di più sicuro 🔐",
      "invalid_credentials": "Sembra che la tua password non sia corretta... Ricontrolla e riprova 😉",
      "internal_server": "Ops! Qualcosa è andato storto da parte nostra... Stiamo sistemando! ⚙️",
      "connection_timeout": "Impossibile connettersi... Controlla la tua connessione e riprova 📶",
      "unexpected": "Si è verificato un problema imprevisto... Lo stiamo controllando! 🚨"
    },
    "facts": {
      "explanation_reward_missing": "Ops! Qualcosa è successo... Non siamo riusciti a verificare che l'annuncio sia stato completato. Riprova 🙏",
      "explanation_insufficient_stars": "Non hai abbastanza stelle per sbloccare questo fatto... Guarda un annuncio per guadagnarne altre 😔",
      "archive_limit_reached": "Hai raggiunto il limite dell’archivio... Rimuovi alcuni contenuti o passa a Premium per salvataggi illimitati 📚",
      "internal_server": "Ops! Qualcosa è andato storto da parte nostra... Stiamo sistemando! ⚙️",
      "connection_timeout": "Non siamo riusciti a connetterci... Controlla la tua rete e riprova 📶",
      "unexpected": "Si è verificato un problema imprevisto... Lo stiamo controllando! 🚨",
      "no_ad_for_explanation": {
        "title": "Le nostre scuse 😔",
        "subtitle": "Ci dispiace di farti aspettare, ma al momento non ci sono annunci disponibili... Riprova tra qualche minuto :("
      }
    },
    "subscriptions": {
      "configuration": "Qualcosa è andato storto durante l'acquisto... Per favore riprova 🙏",
      "purchase_not_allowed": "Oh... Sembra che gli acquisti non siano consentiti su questo dispositivo o account 😕",
      "purchase_cancelled": "Acquisto annullato... Nessun problema, puoi riprovare quando vuoi 🙂",
      "payment_pending": "Il pagamento è ancora in elaborazione... Attendi un momento ⏳",
      "payment_failed": "Pagamento non riuscito... Controlla il metodo di pagamento e riprova 💳",
      "already_subscribed": "Hai già un abbonamento attivo 🎉",
      "subscription_not_found": "Nessun abbonamento attivo trovato... Prova a ripristinare o controlla l’account 🙂",
      "insufficient_permissions": "Non siamo riusciti a verificare l'acquisto... Prova a ripristinare o ad accedere di nuovo 🔐",
      "internal_server": "Ops! Qualcosa è andato storto da parte nostra... Stiamo sistemando ⚙️",
      "connection_timeout": "Impossibile connettersi... Controlla la connessione e riprova 📶",
      "unexpected": "Si è verificato un problema imprevisto... Stiamo indagando 🚨"
    },
    "common": {
      "internal_server": "Qualcosa si è rotto da parte nostra... Stiamo lavorando per sistemarlo 🔧",
      "connection_timeout": "Nessuna connessione... Controlla la tua rete e riprova 📡",
      "authorization": "Sembra che ci sia stato un problema con l'autorizzazione... Prova a disconnetterti e riconnetterti 🔐",
      "too_many_requests": "Limite di richieste raggiunto... Aspetta un attimo prima di riprovare 🔄",
      "unexpected": "Oh! Si è verificato un errore imprevisto... Stiamo lavorando! 🚨"
    },
    "email": {
      "failed_to_open_support": "Ops! Non siamo riusciti ad aprire l'app email... Ma puoi contattarci in qualsiasi momento scrivendo a {} 💌"
    }
  },
  "info_message": {
    "password_change_success": "Password cambiata con successo!",
    "password_reset_success": "Password aggiornata con successo!",
    "password_mismatch": "Ops! Le password non coincidono... Ricontrolla 🔂",
    "signup_success": "Benvenuto a bordo!",
    "no_results": {
      "title": "➡️ Ops, niente qui ⬅️",
      "daily_facts": "Ancora nessun fatto giornaliero... Riprova più tardi per qualcosa di nuovo!",
      "facts_archive": "Il tuo archivio è vuoto — salva alcuni fatti e appariranno qui!"
    },
    "agreeing_to_terms": "Continuando, accetti i nostri\n<terms>Termini</terms> e la nostra <privacy>Privacy</privacy>"
  },
  "dialog": {
    "session_expired": {
      "title": "Bentornato!",
      "subtitle": "La tua sessione ha fatto un piccolo pisolino... Accedi di nuovo per svegliarla! 😴"
    },
    "account_delete": {
      "title": "Addio :(",
      "subtitle": "Eliminare il tuo account rimuoverà permanentemente i tuoi dati... Questa azione non può essere annullata ⛔️"
    },
    "permission": {
      "notifications": {
        "title": "Permesso",
        "subtitle": {
          "basic": "Per ricevere notifiche, assicurati di permettere l'accesso a questa app",
          "in_settings": "Per ricevere notifiche, assicurati di permettere l'accesso a questa app nelle impostazioni di sistema"
        }
      },
      "photosAdd": {
        "title": "Permesso",
        "subtitle": {
          "basic": "Per salvare e condividere i file, consenti l’accesso alla memoria per questa app",
          "in_settings": "Per salvare e condividere i file, consenti l’accesso alla memoria per questa app nelle impostazioni di sistema"
        }
      },
      "photosFull": {
        "title": "Permesso",
        "subtitle": {
          "basic": "Per salvare e condividere i file, consenti l’accesso alle foto per questa app",
          "in_settings": "Per salvare e condividere i file, consenti l’accesso alle foto per questa app nelle impostazioni di sistema"
        }
      }
    },
    "ad_alert": {
      "title": "Brutta notizia :(",
      "subtitle": "Per mantenere questa funzione gratuita, dobbiamo mostrare un annuncio... Grazie per la comprensione e il supporto!"
    },
    "reset_password_expired": {
      "title": "Link scaduto ⏳",
      "subtitle": "Il link per reimpostare la password è scaduto... Richiedine uno nuovo per continuare in sicurezza"
    },
    "reset_password_email_sent": {
      "title": "Controlla la tua casella 📬",
      "subtitle": "Abbiamo inviato un link per reimpostare la password al tuo indirizzo email... Segui le istruzioni per impostarne una nuova 🔑"
    },
    "select_notification_time": {
      "title": "Seleziona orario",
      "button": "Ok"
    },
    "reset_password_enter_email": {
      "title": "Reimposta la password",
      "subtitle": "Ti invieremo un link per reimpostare la password alla tua email... Se non arriva nulla, aspetta 30 secondi e riprova :)"
    },
    "success_purchase": {
      "title": "È tutto pronto!",
      "subtitle": "Il tuo accesso Premium è attivo fino al {}. Grazie mille per il tuo supporto! ❤️"
    },
    "subscription_packages_switch": {
      "title": "Solo un avviso!",
      "subtitle": "Quando cambi piano, l’abbonamento attuale verrà sostituito e il valore rimanente sarà applicato al nuovo piano 😉"
    },
    "background_purchase_confirmation": {
      "title": "Evviva!",
      "subtitle": "Vuoi sbloccare questo sfondo per {} stelle?"
    },
    "background_insufficient_balance": {
      "title": "Non ancora 🥺",
      "subtitle": "Non hai ancora abbastanza stelle per sbloccare questo sfondo"
    },
    "background_insufficient_few_balance": {
      "title": "Ci sei quasi ⭐️",
      "subtitle": {
        "one": "Ti serve solo {} stella in più per sbloccare questo sfondo!",
        "other": "Ti servono solo {} stelle in più per sbloccare questo sfondo!"
      }
    },
    "email_change": {
      "title": "Solo un avviso!",
      "subtitle": "Assicurati di avere accesso a questo indirizzo email. Verrà utilizzato per il recupero dell’account 📧"
    },
    "signup_review_encourage": {
      "title": "Che bello vederti qui 🎉",
      "subtitle": "Grazie per usare Denwee! Se ti piace l’app, lasciare una breve recensione è un ottimo modo per supportarla. Ti auguriamo una giornata fantastica! ❤️"
    }
  },
  "snackbar": {
    "badConnection": {
      "title": "Ops! Connessione interrotta 📶",
      "description": "Controlla la tua rete e riprova!"
    }
  }
};
static const Map<String,dynamic> _fr = {
  "appTitle": "Denwee",
  "welcome": {
    "title": "Denwee",
    "subtitle": "Découvrez chaque jour des faits rapides et mémorables avec des explications claires !",
    "begin_cta": "Explorer",
    "have_an_account": "Vous avez un compte ?"
  },
  "user_interest": {
    "history": "Histoire",
    "science": "Science",
    "space": "Espace",
    "nature": "Nature",
    "society": "Société",
    "human_body": "Corps humain",
    "art": "Art",
    "movies_music": "Films et musique",
    "mind": "Esprit",
    "food": "Nourriture",
    "technology": "Technologie",
    "money": "Argent",
    "habits": "Habitudes",
    "random_curiosities": "Faits aléatoires"
  },
  "onboarding": {
    "select_interests": {
      "title": "Qu’est-ce qui éveille ta curiosité ?",
      "subtitle": "Dis-nous ce qui t’intéresse le plus",
      "cta": "Choisir"
    },
    "select_notification_time": {
      "title": "Un rappel quotidien pour rester curieux",
      "subtitle": "Un fait envoyé chaque jour",
      "time_selection_title": "Heure",
      "dummy_notification": {
        "title": "🌙  Bonsoir !",
        "body": "Le cœur d’une baleine bleue peut peser plus de 180 kg et est de la taille d’une petite voiture, battant seulement 8–10 fois par minute !",
        "time_ago": "maintenant"
      },
      "cta": "Activer"
    },
    "select_theme_colorations": {
      "title": "Choisis des couleurs qui te ressemblent",
      "subtitle": "Personnalise ton expérience",
      "cta": "Appliquer"
    },
    "value_primer": {
      "title": "Transformer la curiosité en savoir",
      "bullets": {
        "line_1": "Découvre un fait court",
        "line_2": "Appuie sur «{}»",
        "line_3": "Découvre l’histoire"
      },
      "cta": "Explorer"
    }
  },
  "account": {
    "section": {
      "profile": {
        "title": "Profil"
      },
      "subscription": {
        "title": "Abonnement"
      },
      "interests": {
        "title": "Centres d'intérêt"
      },
      "daily_facts": {
        "title": "Faits quotidiens",
        "items": {
          "receive_notification": "Recevoir des notifications",
          "notification_time": "Heure de notification",
          "archive": "Archive"
        }
      },
      "background": {
        "title": "Fond",
        "more": "Plus"
      },
      "theme": {
        "title": "Thème",
        "items": {
          "system": "Système",
          "light": "Clair",
          "dark": "Sombre"
        }
      },
      "coloration": {
        "title": "Colorations"
      },
      "preferences": {
        "title": "Préférences",
        "items": {
          "language": "Langue",
          "haptics": "Retour haptique"
        }
      },
      "more": {
        "title": "Plus",
        "items": {
          "about_app": "À propos de l'application",
          "privacy_terms": "Confidentialité & Conditions",
          "contact_support": "Contacter le support"
        }
      }
    },
    "statistics": {
      "stars": {
        "title": "Étoiles",
        "hint": "1 Pub = 1 Étoile\nUtilisez des étoiles pour débloquer instantanément les explications sans publicité ou débloquer de nouveaux arrière-plans :)"
      },
      "streak": {
        "title": "Série",
        "hint": "Votre série montre combien de jours consécutifs vous avez débloqué au moins un fait - Ne manquez pas un jour pour la maintenir !"
      },
      "facts": {
        "title": "Faits",
        "hint": "Le nombre de faits que vous avez déjà débloqués - Collectionnez-les tous et augmentez vos connaissances !"
      }
    },
    "profile": {
      "default_username": "Utilisateur Denwee",
      "register_encourage_msg": "Synchronisez votre compte sur plusieurs appareils - Appuyez pour commencer",
      "logged_in_encourage_msg": "Vous êtes connecté ! Appuyez pour gérer votre profil",
      "personal": {
        "title": "Personnel"
      },
      "subscription": {
        "title": "Abonnement"
      },
      "more": {
        "title": "Plus",
        "change_password": "Changer\nle mot de passe",
        "contact_support": "Contacter\nle support"
      }
    }
  },
  "subscription": {
    "basic_plan": "Denwee Basic",
    "premium_plan": "Premium",
    "active_plan": "Forfait actif",
    "upgrade_cta": "Passer",
    "trial_cta": "Essai gratuit",
    "paywall": {
      "title": "Profitez de chaque fait sans aucune limite",
      "benefits": {
        "line_1": "Explications instantanées",
        "line_2": "Débloquez tous les fonds",
        "line_3": "Plus aucune publicité",
        "ads_encourage_msg": {
          "one": "Vous avez passé ~{} minute sur les pubs. Gagnez plus de temps avec Premium 🫶",
          "other": "Vous avez passé ~{} minutes sur les pubs. Gagnez plus de temps avec Premium 🫶"
        }
      },
      "package": {
        "weekly": {
          "title": "Essai de 3 jours",
          "price_string": "puis {} par semaine"
        },
        "monthly": {
          "title": "Mensuel",
          "price_string": "{} par mois"
        },
        "yearly": {
          "title": "Annuel",
          "price_string": "{} par an",
          "discount_badge": "Réduc. {}%"
        }
      },
      "footer": {
        "restore": "Restaurer",
        "privacy": "Confidentialité",
        "terms": "Conditions"
      },
      "expiry": "Expiration"
    }
  },
  "backgrounds": {
    "selected": "Sélectionné",
    "apply": "Appliquer",
    "unlock": "Débloquer"
  },
  "showcase": {
    "title": "Vos faits quotidiens s'afficheront ici",
    "subtitle": "Glissez à gauche ou à droite pour explorer !",
    "button": "Ok :)"
  },
  "fact_share": {
    "more": "Plus",
    "hide_watermark": "Masquer le filigrane",
    "archive": {
      "archive": "Archiver",
      "unarchive": "Désarchiver"
    },
    "copy": {
      "copy": "Copier",
      "copied": "Copié"
    },
    "download": {
      "download": "Télécharger",
      "saved": "Enregistré"
    },
    "resource": "Ressource"
  },
  "validation": {
    "email": {
      "empty": "Veuillez fournir un e-mail",
      "invalid": "L'e-mail fourni semble invalide"
    },
    "password": {
      "empty": "Veuillez fournir un mot de passe",
      "short": "Le mot de passe est trop court",
      "long": "Le mot de passe est trop long"
    },
    "username": {
      "empty": "Veuillez fournir un nom",
      "short": "Le nom est trop court",
      "long": "Le nom est trop long"
    },
    "interests": {
      "not_enough": "Choisissez au moins {} centres d’intérêt pour une meilleure expérience"
    }
  },
  "input_field": {
    "hint": {
      "email": "E-mail",
      "password": "Mot de passe",
      "name": "Nom",
      "old_password": "Ancien mot de passe",
      "new_password": "Nouveau mot de passe",
      "confirm_password": "Confirmer le mot de passe"
    }
  },
  "fact_unlock_method": {
    "ad": {
      "title": "Publicité",
      "subtitle": "Vous pouvez gagner 1 Étoile et débloquer le fait en regardant une publicité"
    },
    "star": {
      "title": "Étoile",
      "subtitle": "Vous pouvez utiliser 1 Étoile pour débloquer le fait sans regarder de publicité"
    }
  },
  "label": {
    "login": "Connexion",
    "register": "S'inscrire",
    "change_password": "Changer le mot de passe",
    "reset_password": "Réinitialiser le mot de passe",
    "create_an_account": "Créer un compte",
    "forgot_pass_question": "Mot de passe oublié ?",
    "dont_have_an_account_question": "Vous n'avez pas de compte ?",
    "have_an_account_question": "Vous avez un compte ?",
    "daily_facts": "Faits quotidiens",
    "oops": "Oups !"
  },
  "button": {
    "login": "Se connecter",
    "register": "Rejoindre",
    "logout": "Se déconnecter",
    "delete_account": "Supprimer le compte",
    "save": "Enregistrer",
    "change": "Changer",
    "explain_fact": "En savoir plus"
  },
  "loading": {
    "just_a_moment": "Un instant..."
  },
  "error_generic_titles": {
    "title1": "Oups !",
    "title2": "Oh-oh !",
    "title3": "Oops !",
    "title4": "Oh non !",
    "title5": "Hmm...",
    "title6": "Pas maintenant 😔",
    "title7": "Aïe !",
    "title8": "Oupsy !",
    "title9": "Petit souci !",
    "title10": "Mini bug !",
    "title11": "Ça n’a pas marché 🥺"
  },
  "error_message": {
    "login": {
      "invalid_email": "Cet e-mail ne semble pas correct... Pouvez-vous le vérifier ? 😉",
      "weak_password": "Hmm, ce mot de passe est trop facile à deviner... Essayez quelque chose de plus fort 🔐",
      "user_not_found": "Nous n'avons pas trouvé de compte avec ces informations... Vous êtes inscrit ? 😉",
      "user_banned": "Ce compte a été restreint... Si vous pensez que c'est une erreur, contactez le support 🙏",
      "cancelled": "La connexion a été annulée... Vous pouvez réessayer quand vous serez prêt 😉",
      "internal_server": "Oups ! Quelque chose s'est mal passé de notre côté... Nous réparons ça ! 🔧",
      "connection_timeout": "Impossible de se connecter... Vérifiez votre Internet et réessayez 📶",
      "unexpected": "Un problème inattendu est survenu... Nous examinons cela ! 🚨"
    },
    "register": {
      "invalid_email": "Cet e-mail ne semble pas valide... Pouvez-vous le vérifier à nouveau ? ✉️",
      "weak_password": "Oups, ce mot de passe est trop faible... Essayez quelque chose de plus fort 💪",
      "user_already_exists": "Il semble que cet e-mail soit déjà utilisé... Essayez de vous connecter 😉",
      "disabled": "Les inscriptions sont actuellement fermées... Veuillez réessayer plus tard 🕒",
      "cancelled": "L’inscription a été annulée... Vous pouvez continuer quand vous serez prêt 😉",
      "internal_server": "Quelque chose s'est mal passé de notre côté... Nous travaillons dessus 🔧",
      "connection_timeout": "Pas de connexion... Vérifiez votre Internet et réessayez 📡",
      "unexpected": "Une erreur inattendue est survenue... Nous nous en occupons ! 🚨"
    },
    "update_profile": {
      "internal_server": "Quelque chose s'est mal passé de notre côté... Nous travaillons dessus 🔧",
      "connection_timeout": "Pas de connexion... Vérifiez votre Internet et réessayez 📡",
      "unexpected": "Une erreur inattendue est survenue... Nous nous en occupons ! 🚨"
    },
    "change_password": {
      "weak_password": "Hmm, ce mot de passe est trop faible :( Essayez quelque chose de plus fort 🔐",
      "invalid_credentials": "Il semble que votre mot de passe ne soit pas correct... Veuillez vérifier et réessayer 😉",
      "internal_server": "Oups ! Quelque chose s'est mal passé de notre côté... Nous réparons ça ! ⚙️",
      "connection_timeout": "Impossible de se connecter... Vérifiez votre Internet et réessayez 📶",
      "unexpected": "Un problème inattendu est survenu... Nous examinons cela ! 🚨"
    },
    "facts": {
      "explanation_reward_missing": "Oups ! Quelque chose s'est produit ici... Nous n'avons pas pu vérifier que la publicité était terminée. Veuillez réessayer 🙏",
      "explanation_insufficient_stars": "Vous n'avez pas assez d'étoiles pour débloquer ce fait... Regardez une annonce pour en obtenir plus 😔",
      "archive_limit_reached": "Vous avez atteint la limite d’archivage... Supprimez quelques éléments ou passez à Premium pour des sauvegardes illimitées 📚",
      "internal_server": "Oups ! Quelque chose s'est mal passé de notre côté... Nous réparons ça ! ⚙️",
      "connection_timeout": "Impossible de se connecter... Vérifiez votre Internet et réessayez 📶",
      "unexpected": "Un problème inattendu est survenu... Nous examinons cela ! 🚨",
      "no_ad_for_explanation": {
        "title": "Nos excuses 😔",
        "subtitle": "Nous sommes désolés de vous faire attendre, mais il n'y a pas d'annonces disponibles pour le moment... Veuillez réessayer dans quelques minutes :("
      }
    },
    "subscriptions": {
      "configuration": "Un problème est survenu lors de la configuration de votre achat... Veuillez réessayer 🙏",
      "purchase_not_allowed": "Oh... Il semble que les achats ne soient pas autorisés sur cet appareil ou ce compte 😕",
      "purchase_cancelled": "Achat annulé... Pas d’inquiétude, vous pouvez réessayer quand vous voulez 🙂",
      "payment_pending": "Votre paiement est en cours de traitement... Veuillez patienter ⏳",
      "payment_failed": "Le paiement a échoué... Veuillez vérifier votre moyen de paiement 💳",
      "already_subscribed": "Vous avez déjà un abonnement actif 🎉",
      "subscription_not_found": "Aucun abonnement actif trouvé... Essayez de restaurer ou vérifiez votre compte 🙂",
      "insufficient_permissions": "Impossible de vérifier l'achat... Veuillez restaurer ou vous reconnecter 🔐",
      "internal_server": "Oups ! Un problème est survenu de notre côté... Nous y travaillons ⚙️",
      "connection_timeout": "Impossible de se connecter... Vérifiez votre connexion 📶",
      "unexpected": "Une erreur inattendue s'est produite... Nous enquêtons 🚨"
    },
    "common": {
      "internal_server": "Quelque chose s'est mal passé de notre côté... Nous travaillons dessus 🔧",
      "connection_timeout": "Pas de connexion... Vérifiez votre Internet et réessayez 📡",
      "authorization": "Il semble y avoir un problème d'autorisation... Veuillez vous déconnecter et vous reconnecter 🔐",
      "too_many_requests": "Limite de requêtes atteinte... Attendez un instant avant de réessayer 🔄",
      "unexpected": "Oh ! Une erreur inattendue est survenue... Nous nous en occupons ! 🚨"
    },
    "email": {
      "failed_to_open_support": "Oups ! Nous n'avons pas pu ouvrir votre application e-mail... Mais vous pouvez nous contacter à tout moment en envoyant un message à {} 💌"
    }
  },
  "info_message": {
    "password_change_success": "Mot de passe changé avec succès !",
    "password_reset_success": "Mot de passe mis à jour avec succès !",
    "password_mismatch": "Oups ! Les mots de passe ne correspondent pas... Veuillez vérifier 🔂",
    "signup_success": "Bienvenue à bord !",
    "no_results": {
      "title": "➡️ Oups, rien ici ⬅️",
      "daily_facts": "Pas encore de faits quotidiens... Revenez plus tard pour découvrir quelque chose de nouveau !",
      "facts_archive": "Votre archive est vide — enregistrez quelques faits et ils apparaîtront ici !"
    },
    "agreeing_to_terms": "En continuant, vous acceptez nos\n<terms>Conditions</terms> et notre <privacy>Confidentialité</privacy>"
  },
  "dialog": {
    "session_expired": {
      "title": "Bon retour !",
      "subtitle": "Votre session a fait une petite sieste... Veuillez vous reconnecter pour la réveiller ! 😴"
    },
    "account_delete": {
      "title": "Adieu :(",
      "subtitle": "La suppression de votre compte supprimera définitivement vos données... Cette action est irréversible ⛔️"
    },
    "permission": {
      "notifications": {
        "title": "Autorisation",
        "subtitle": {
          "basic": "Pour recevoir des notifications, assurez-vous d'autoriser cette application",
          "in_settings": "Pour recevoir des notifications, assurez-vous d'autoriser cette application dans les paramètres du système"
        }
      },
      "photosAdd": {
        "title": "Autorisation",
        "subtitle": {
          "basic": "Pour enregistrer et partager des fichiers, veuillez autoriser l’accès au stockage pour cette application",
          "in_settings": "Pour enregistrer et partager des fichiers, veuillez autoriser l’accès au stockage pour cette application dans les paramètres système"
        }
      },
      "photosFull": {
        "title": "Autorisation",
        "subtitle": {
          "basic": "Pour enregistrer et partager des fichiers, veuillez autoriser l’accès aux photos pour cette application",
          "in_settings": "Pour enregistrer et partager des fichiers, veuillez autoriser l’accès aux photos pour cette application dans les paramètres système"
        }
      }
    },
    "ad_alert": {
      "title": "Triste nouvelle :(",
      "subtitle": "Pour que cette fonctionnalité reste gratuite, nous devons afficher une publicité... Merci pour votre compréhension et votre soutien !"
    },
    "reset_password_expired": {
      "title": "Lien expiré ⏳",
      "subtitle": "Votre lien de réinitialisation de mot de passe a expiré... Veuillez en demander un nouveau pour continuer en toute sécurité"
    },
    "reset_password_email_sent": {
      "title": "Vérifiez votre boîte mail 📬",
      "subtitle": "Nous avons envoyé un lien de réinitialisation de mot de passe à votre adresse e-mail... Suivez les instructions pour définir un nouveau mot de passe 🔑"
    },
    "select_notification_time": {
      "title": "Sélectionner l'heure",
      "button": "Ok"
    },
    "reset_password_enter_email": {
      "title": "Réinitialiser le mot de passe",
      "subtitle": "Nous t’enverrons un lien pour réinitialiser ton mot de passe par e-mail... Si rien n’arrive, attends 30 secondes et réessaie :)"
    },
    "success_purchase": {
      "title": "C’est fait !",
      "subtitle": "Votre accès Premium est actif jusqu’au {}. Merci beaucoup pour votre soutien ! ❤️"
    },
    "subscription_packages_switch": {
      "title": "Petit rappel !",
      "subtitle": "Lorsque vous changez de formule, votre abonnement actuel sera remplacé et la valeur restante sera appliquée au nouveau plan 😉"
    },
    "background_purchase_confirmation": {
      "title": "Youpi !",
      "subtitle": "Débloquer ce fond pour {} étoiles ?"
    },
    "background_insufficient_balance": {
      "title": "Pas encore 🥺",
      "subtitle": "Vous n’avez pas encore assez d’étoiles pour débloquer ce fond"
    },
    "background_insufficient_few_balance": {
      "title": "Presque fini ⭐️",
      "subtitle": {
        "one": "Il vous manque seulement {} étoile pour débloquer ce fond !",
        "other": "Il vous manque seulement {} étoiles pour débloquer ce fond !"
      }
    },
    "email_change": {
      "title": "Petite information !",
      "subtitle": "Assurez-vous d’avoir accès à cette adresse e-mail. Elle sera utilisée pour la récupération du compte 📧"
    },
    "signup_review_encourage": {
      "title": "Ravi de te voir ici 🎉",
      "subtitle": "Merci d’utiliser Denwee ! Si tu apprécies l’application, laisser un petit avis est un excellent moyen de la soutenir. Nous te souhaitons une excellente journée ! ❤️"
    }
  },
  "snackbar": {
    "badConnection": {
      "title": "Oups ! Connexion perdue 📶",
      "description": "Veuillez vérifier votre réseau et réessayer !"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"zh": _zh, "de": _de, "ru": _ru, "en": _en, "it": _it, "fr": _fr};
}
