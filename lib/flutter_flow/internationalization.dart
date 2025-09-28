import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? ptText = '',
  }) =>
      [enText, esText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'f9al2jiq': {
      'en': 'The experience of buying food quickly',
      'es': 'La experiencia de comprar comida rápidamente',
      'pt': 'A experiência de comprar comida rapidamente',
    },
    'q7mzy88d': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'pt':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2egoby3b': {
      'en': 'Find and Get Your Best Food',
      'es': 'Encuentre y obtenga su mejor comida',
      'pt': 'Encontre e obtenha sua melhor comida',
    },
    'neuxxcug': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'pt':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    'rijctza1': {
      'en': 'Foodie’s courier send with love',
      'es': 'El mensajero de Foodie envía con amor.',
      'pt': 'O Foodie Messenger envia com amor.',
    },
    '5cdcpcqz': {
      'en':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'pt':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2044raxp': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'pt': 'Criar uma conta',
    },
    'kvk96b9a': {
      'en': 'Already Have an Account',
      'es': 'Ya tienes una cuenta',
      'pt': 'Você já tem uma conta',
    },
    'e9n9xv7z': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // CreateAccount
  {
    'fqhfxosd': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'pt': 'Criar uma conta',
    },
    '8r2ftoyt': {
      'en': 'Start learning with create your account',
      'es': 'Comience a aprender con crear su cuenta',
      'pt': 'Comece a aprender criando sua conta',
    },
    'w8fbq6qd': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'pt': 'Nome de usuário',
    },
    'qyz8jn8k': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'pt': 'Crie seu nome de usuário',
    },
    '5ejt2igx': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'pt': 'E-mail ou número de telefone',
    },
    '1k2s07d4': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': 'Digite seu e-mail ou número de telefone',
    },
    '8hrnyurr': {
      'en': 'Password',
      'es': 'Contraseña',
      'pt': 'Senha',
    },
    '5ta75wx9': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'pt': 'Crie sua senha',
    },
    '7318gst0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'pt': 'Criar uma conta',
    },
    '291f7n60': {
      'en': 'Or using other method',
      'es': 'O usando otro método',
      'pt': 'Ou usando outro método',
    },
    'n6i4hebd': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
      'pt': 'Cadastre-se com o Google',
    },
    'tj5ofugi': {
      'en': 'Have an acccount',
      'es': 'Tener una cuenta',
      'pt': 'Ter uma conta',
    },
    '96k4zm5b': {
      'en': 'Login',
      'es': 'Acceso',
      'pt': 'Acesso',
    },
    'i6bq0pen': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // Verification
  {
    'lnxzjexp': {
      'en': 'Verification',
      'es': 'Verificación',
      'pt': 'Verificação',
    },
    'm8vt32wl': {
      'en': 'Verification Code',
      'es': 'Código de verificación',
      'pt': 'Código de verificação',
    },
    'j0wt8bqq': {
      'en':
          'We have to sent the code verification 1234, Please enter the code to move forward',
      'es':
          'Tenemos que enviar el código de verificación 1234. Ingrese el código para seguir adelante.',
      'pt':
          'Precisamos enviar o código de verificação 1234. Digite o código para continuar.',
    },
    'ou77jxtd': {
      'en': 'demo@email.com',
      'es': 'demostración@correo electrónico.com',
      'pt': 'demo@email.com',
    },
    'vfbmvgvb': {
      'en': 'Verify',
      'es': 'Verificar',
      'pt': 'Verificar',
    },
    '5iqum420': {
      'en': 'Didn\'t recceive the code? ',
      'es': '¿No recibiste el código?',
      'pt': 'Não recebeu o código?',
    },
    '7axmi8vz': {
      'en': 'Resend',
      'es': 'Reenviar',
      'pt': 'Avançar',
    },
    'hvh480nv': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // LoginAccount
  {
    'absgjmyr': {
      'en': 'Login Account',
      'es': 'Iniciar sesión cuenta',
      'pt': 'Entre na sua conta',
    },
    '7yyc6yio': {
      'en': 'Please login with registered account',
      'es': 'Por favor inicie sesión con una cuenta registrada',
      'pt': 'Por favor, faça login com uma conta registrada',
    },
    '0y1a56v9': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'pt': 'E-mail ou número de telefone',
    },
    'xq55heau': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': 'Digite seu e-mail ou número de telefone',
    },
    'iyk0cszg': {
      'en': 'Password',
      'es': 'Contraseña',
      'pt': 'Senha',
    },
    'tec1pifi': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'pt': 'Crie sua senha',
    },
    '0c1sk3ec': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'pt': 'Esqueceu sua senha?',
    },
    '58ybobvm': {
      'en': 'Signin',
      'es': 'Iniciar sesión',
      'pt': 'Conecte-se',
    },
    'oio6unbm': {
      'en': 'Or using other method',
      'es': 'O usando otro método',
      'pt': 'Ou usando outro método',
    },
    'bemrezoy': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
      'pt': 'Cadastre-se com o Google',
    },
    '9ftxk5xj': {
      'en': 'Don\'t have an acccount',
      'es': 'No tengo una cuenta',
      'pt': 'Eu não tenho uma conta',
    },
    'jlqha2r3': {
      'en': 'Signup',
      'es': 'Inscribirse',
      'pt': 'Registrar',
    },
    '84xsjzjp': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // MyOrder
  {
    '5dnqugbt': {
      'en': 'My Order',
      'es': 'Mi pedido',
      'pt': 'Meu pedido',
    },
    '42hehwip': {
      'en': 'History',
      'es': 'Historial',
      'pt': 'História',
    },
    '460io703': {
      'en': 'My Orders',
      'es': 'Mis ordenes',
      'pt': 'Meus pedidos',
    },
  },
  // Notifications
  {
    '7xeyt3wn': {
      'en': 'Notification',
      'es': 'Notificación',
      'pt': '',
    },
    'v9zj1lqj': {
      'en': 'Today',
      'es': 'Hoy',
      'pt': '',
    },
    'oqbwrpnh': {
      'en': 'Discount voucher!',
      'es': '¡Vale de descuento!',
      'pt': '',
    },
    'h1prwlxt': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
      'pt': '',
    },
    'etwd1z7n': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
      'pt': '',
    },
    'v0ypysbt': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
      'pt': '',
    },
    'geyy08x6': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
      'pt': '',
    },
    'sg7ky4vq': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
      'pt': '',
    },
    'lehiwmn2': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'pt': '',
    },
    '8ccbuyp1': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'pt': '',
    },
    'wh324nbh': {
      'en': 'Yesterday',
      'es': 'Ayer',
      'pt': '',
    },
    'k3pnpz7c': {
      'en': 'Discount voucher!',
      'es': '¡Vale de descuento!',
      'pt': '',
    },
    '544pu051': {
      'en': '5min ago',
      'es': 'Hace 5 minutos',
      'pt': '',
    },
    'a7l0sc65': {
      'en': 'New update! Ver 1.87',
      'es': '¡Nueva actualización! Versión 1.87',
      'pt': '',
    },
    'g3f0az5d': {
      'en': '20min ago',
      'es': 'Hace 20 minutos',
      'pt': '',
    },
    '2to6yrso': {
      'en': 'New message from Chris',
      'es': 'Nuevo mensaje de Chris',
      'pt': '',
    },
    'o2xb50hb': {
      'en': '35min ago',
      'es': 'Hace 35 minutos',
      'pt': '',
    },
    '514iimtt': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'pt': '',
    },
    'hspwuxdq': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'pt': '',
    },
    'j6d49hyr': {
      'en': 'Discount voucher! 50%',
      'es': '¡Vale de descuento! 50%',
      'pt': '',
    },
    'fggqlhln': {
      'en': '2hour 60min ago',
      'es': 'Hace 2 horas 60 minutos',
      'pt': '',
    },
    'p9pn3mm5': {
      'en': 'Favorite',
      'es': 'Favorito',
      'pt': '',
    },
  },
  // Setting
  {
    '82jnfyxo': {
      'en': 'Setting',
      'es': 'Configuración',
      'pt': 'Configuração',
    },
    'k9p4o7mq': {
      'en': 'General',
      'es': 'General',
      'pt': 'Em geral',
    },
    'huf27lxh': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'pt': 'Editar perfil',
    },
    '3vea7j2p': {
      'en': 'Language',
      'es': 'Idioma',
      'pt': 'Linguagem',
    },
    'cow5ksut': {
      'en': 'Preferencess',
      'es': 'Preferencias',
      'pt': 'Preferências',
    },
    'ivdshgsr': {
      'en': 'Legal and Policies',
      'es': 'Legales y Políticas',
      'pt': 'Jurídico e Políticas',
    },
    '33gpjjpl': {
      'en': 'Help & Support',
      'es': 'Servicio de asistencia',
      'pt': 'Ajuda e Suporte',
    },
    '4k922abp': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'pt': 'Sair',
    },
    'ihvwbj05': {
      'en': 'Zendy Version 1.0.0 2025',
      'es': 'Foodcort Versión 1.0.12 Compilación 24',
      'pt': '',
    },
    'tpcxi4d9': {
      'en': 'Setting',
      'es': 'Configuración',
      'pt': '',
    },
  },
  // EditProfile
  {
    '36zgxj4d': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'pt': 'Nome de usuário',
    },
    '3ia1b2s1': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'pt': 'Crie seu nome de usuário',
    },
    'y62t4x4v': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'pt': 'E-mail',
    },
    'qoq8rd90': {
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico',
      'pt': 'Digite seu e-mail',
    },
    'u028e6t7': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'pt': 'Número de telefone',
    },
    'bw6y46l9': {
      'en': 'Enter your phone number',
      'es': 'Introduce tu número de teléfono',
      'pt': 'Digite seu número de telefone',
    },
    'vrtr6uvq': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'pt': 'Salvar alterações',
    },
    'ubo5xh9z': {
      'en': 'Profile',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // ChangePassword
  {
    'qta47nw1': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'pt': '',
    },
    'm44q6y3o': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'pt': '',
    },
    'ytk5ba6l': {
      'en': 'Enter new password',
      'es': 'Ingrese nueva clave',
      'pt': '',
    },
    '8dzaf869': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'pt': '',
    },
    '8q91wovk': {
      'en': 'Confirm your new password',
      'es': 'Confirma tu nueva contraseña',
      'pt': '',
    },
    'hi2yymxk': {
      'en': 'Chnage Now',
      'es': 'Cambiar ahora',
      'pt': '',
    },
    '92rkz0wl': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // Language
  {
    '54vikyjk': {
      'en': 'Search language',
      'es': 'Idioma de búsqueda',
      'pt': 'Idioma de pesquisa',
    },
    '6x0nymve': {
      'en': 'English',
      'es': 'Inglés',
      'pt': 'Inglês',
    },
    'lwrdsvca': {
      'en': 'Spanish',
      'es': 'Español',
      'pt': 'Espanhol',
    },
    'h8koak8c': {
      'en': 'Portuguese',
      'es': 'Portugués',
      'pt': 'Português',
    },
    '3sa48wmg': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // NotificationSetting
  {
    'pv5ygd8b': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'pt': '',
    },
    'inr065ip': {
      'en': 'Payment',
      'es': 'Pago',
      'pt': '',
    },
    'ltse1dpj': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'pt': '',
    },
    'ma7hjc40': {
      'en': 'Complete Order',
      'es': 'Orden completa',
      'pt': '',
    },
    'ohk8lp29': {
      'en': 'Notification',
      'es': 'Notificación',
      'pt': '',
    },
    'vmced3si': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // Security
  {
    'xsh3ud2y': {
      'en': 'Security',
      'es': 'Seguridad',
      'pt': '',
    },
    '0cxkq1k7': {
      'en': 'Face ID',
      'es': 'identificación facial',
      'pt': '',
    },
    'vf4xbxza': {
      'en': 'Remember Password',
      'es': 'Recordar contraseña',
      'pt': '',
    },
    'rhp8x8nn': {
      'en': 'Touch ID',
      'es': 'identifición de toque',
      'pt': '',
    },
    '9e2s3fhc': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // HelpandSupport
  {
    'pwzylnu2': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'pt': '',
    },
    '0hxomwjo': {
      'en': 'Search',
      'es': 'Buscar',
      'pt': '',
    },
    'u7zay0at': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'pt': '',
    },
    'iq6peolc': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'pt': '',
    },
    'iku16ozk': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'pt': '',
    },
    '70iqrdwa': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'pt': '',
    },
    '5j0pbo9z': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'pt': '',
    },
    'm803mq12': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'pt': '',
    },
    'dhwvt3h7': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'pt': '',
    },
    'bkjcz8kj': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'pt': '',
    },
    'clq57ljv': {
      'en': 'Support title',
      'es': 'Título de soporte',
      'pt': '',
    },
    'vvpixpr1': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'pt': '',
    },
    'leiu5g56': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // LegalAndPolicies
  {
    'vkgb4h04': {
      'en': 'Legal and Policies',
      'es': 'Legales y Políticas',
      'pt': '',
    },
    'icfwkxvp': {
      'en': 'Terms',
      'es': 'Términos',
      'pt': '',
    },
    'd216tz8f': {
      'en':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Al utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.\n\nTérminos, no debes utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'pt': '',
    },
    'mf4seg4j': {
      'en': 'Changes to the Service and/or Terms:',
      'es': 'Cambios al Servicio y/o Términos:',
      'pt': '',
    },
    '4aolvysc': {
      'en':
          'This application is provided to you \"as is,\" and we make no express or implied warranties whatsoever with respect to its functionality, operability, or use, including, without limitation.\n\nAny implied warranties of merchantability, fitness for a particular purpose, or infringement. We expressly disclaim any liability whatsoever for any direct, indirect, consequential, incidental or special damages, including, without limitation, lost revenues, lost profits, losses resulting from business interruption or loss of \n\ndata, regardless of the form of action or legal theory under which the liability may be asserted, even if advised of the possibility or likelihood of such damages.\n\n\nBy using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Esta aplicación se le proporciona \"tal cual\" y no ofrecemos garantía expresa o implícita de ningún tipo con respecto a su funcionalidad, operatividad o uso, incluidos, entre otros.\n\nCualquier garantía implícita de comerciabilidad, idoneidad para un propósito particular o infracción. Renunciamos expresamente a cualquier responsabilidad por daños directos, indirectos, consecuentes, incidentales o especiales, incluidos, entre otros, pérdida de ingresos, pérdida de ganancias, pérdidas resultantes de la interrupción del negocio o la pérdida de\n\ndatos, independientemente de la forma de acción o teoría jurídica bajo la cual se pueda hacer valer la responsabilidad, incluso si se le advierte de la posibilidad o probabilidad de tales daños.\n\n\nAl utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'pt': '',
    },
    'x014ew2n': {
      'en': 'Terms',
      'es': 'Términos',
      'pt': '',
    },
    'o3qpa1ln': {
      'en':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Al utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.\n\nTérminos, no debes utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'pt': '',
    },
    '8uluwyex': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // Home
  {
    'ncawyiss': {
      'en': '3',
      'es': '3',
      'pt': '',
    },
    'blokfgt9': {
      'en': 'Today',
      'es': 'Hoy',
      'pt': 'Hoje',
    },
    '5jy14s2f': {
      'en': '500 UYU',
      'es': '500 UYU',
      'pt': '500 UYU',
    },
    '77r7n4m3': {
      'en': 'FoodCort  Menu',
      'es': 'Menú de FoodCort',
      'pt': '',
    },
    's1rt0jn9': {
      'en': 'Voucher',
      'es': 'Vale',
      'pt': '',
    },
    'mxoadezv': {
      'en': '2',
      'es': '2',
      'pt': '',
    },
    'nxq5qh7x': {
      'en': 'Chat',
      'es': 'Charlar',
      'pt': '',
    },
    '10pz7u4b': {
      'en': '23',
      'es': '23',
      'pt': '',
    },
    'azd6vzly': {
      'en': 'History',
      'es': 'Historia',
      'pt': '',
    },
    '1ur0r530': {
      'en': '14',
      'es': '14',
      'pt': '',
    },
    '7c4nkw28': {
      'en': 'Setting',
      'es': 'Configuración',
      'pt': '',
    },
    'hpczukzr': {
      'en': '1',
      'es': '1',
      'pt': '',
    },
    'jv02ciyh': {
      'en': 'Magdalena Succrose',
      'es': 'Magdalena Sacarosa',
      'pt': '',
    },
    '1orxpuhk': {
      'en': 'Good Morning',
      'es': 'Buen día',
      'pt': '',
    },
    'nfkublcp': {
      'en': 'Help',
      'es': 'Ayuda',
      'pt': '',
    },
    'r78nb6bv': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'pt': '',
    },
    '33xm309e': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // DeliveryMap
  {
    'fpfpjbay': {
      'en': 'Select Location',
      'es': 'Seleccionar ubicación',
      'pt': 'Selecione a localização',
    },
    '11aqlsz0': {
      'en': 'Save',
      'es': 'Guardar',
      'pt': 'Salvar',
    },
    '9o112cy7': {
      'en': 'Location out of delivery range',
      'es': 'Ubicación fuera del rango de entrega',
      'pt': 'Localização fora do alcance de entrega',
    },
    'cidh6stt': {
      'en': 'Make sure to enter a location within the image area.',
      'es': 'Asegúrese de ingresar una ubicacion dentro de area de la imagen',
      'pt': 'Certifique-se de inserir um local dentro da área da imagem.',
    },
    'nu12k5fb': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // AddNewCard
  {
    'h5xz9foe': {
      'en': 'Add New Card',
      'es': 'Agregar nueva tarjeta',
      'pt': '',
    },
    'cvbtp37n': {
      'en': 'Card Number',
      'es': 'Número de tarjeta',
      'pt': '',
    },
    '430j6jsh': {
      'en': 'Enter Card Number',
      'es': 'Ingrese el número de tarjeta',
      'pt': '',
    },
    'l9fawioa': {
      'en': 'Card Holder Name',
      'es': 'Nombre del titular de la tarjeta',
      'pt': '',
    },
    '40v3hfoq': {
      'en': 'Enter Holder Name',
      'es': 'Ingrese el nombre del titular',
      'pt': '',
    },
    'ab4rq80l': {
      'en': 'Expired',
      'es': 'Venció',
      'pt': '',
    },
    'awdejgu9': {
      'en': 'MM/YY',
      'es': 'MM/AA',
      'pt': '',
    },
    'xxb87ruc': {
      'en': 'CVV Code',
      'es': 'codigo CVV',
      'pt': '',
    },
    'siu7345y': {
      'en': 'CCV',
      'es': 'CCV',
      'pt': '',
    },
    '4fdn5wdo': {
      'en': 'Add Card',
      'es': 'Agregar tarjeta',
      'pt': '',
    },
    'uykbxpdf': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // StopMap
  {
    'xglkc9w6': {
      'en': 'Select Location',
      'es': 'Seleccionar ubicación',
      'pt': 'Selecione a localização',
    },
    'wbk6p7ps': {
      'en': 'Save',
      'es': 'Guardar',
      'pt': 'Salvar',
    },
    'zffair28': {
      'en': 'Location out of delivery range',
      'es': 'Ubicación fuera del rango de entrega',
      'pt': 'Localização fora do alcance de entrega',
    },
    'pe4j6lcb': {
      'en': 'Make sure to enter a location within the image area.',
      'es': 'Asegúrese de ingresar una ubicacion dentro de area de la imagen',
      'pt': 'Certifique-se de inserir um local dentro da área da imagem.',
    },
    'hrge018b': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // DeltailsDelivery
  {
    'l38eafst': {
      'en': 'See',
      'es': 'Ver',
      'pt': 'Ver',
    },
    'zjssbk8u': {
      'en': 'Rute',
      'es': 'Ruta',
      'pt': 'Rota',
    },
    '5ay2jhmt': {
      'en': 'Estimated time',
      'es': 'Tiempo estimado',
      'pt': 'Tempo estimado',
    },
    'n5iiv8og': {
      'en': 'Distance',
      'es': 'Distancia',
      'pt': 'Distância',
    },
    'fdidyov6': {
      'en': 'Number of stops',
      'es': 'Número de paradas',
      'pt': 'Número de paradas',
    },
    'fqh3ri8u': {
      'en': 'Number of packages',
      'es': 'Número de paquetes',
      'pt': 'Número de pacotes',
    },
    'nmz0h3pa': {
      'en': '11:23 AM, 1/12/2025',
      'es': 'los Angeles',
      'pt': '',
    },
    '5bzcota6': {
      'en': '11:23 AM- 1/12/2025',
      'es': '11:23 AM- 1/12/2025',
      'pt': '11:23 AM- 1/12/2025',
    },
    '8ghovk3k': {
      'en': 'Status',
      'es': 'Estado',
      'pt': 'Estado',
    },
    'ldgr06r6': {
      'en': 'Driver',
      'es': 'Conductor',
      'pt': 'Motorista',
    },
    'kpnrnl64': {
      'en': 'Assigning...',
      'es': 'Asignando...',
      'pt': 'Atribuindo...',
    },
    '2zsc4bam': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // DetailsStop
  {
    'jp0k1auy': {
      'en': 'Detalis',
      'es': 'Detalle',
      'pt': 'Detalhe',
    },
    'rm7kbajw': {
      'en': 'You can view your history at any time',
      'es': 'Puedes ver tu historial en cualquier momento',
      'pt': 'Você pode visualizar seu histórico a qualquer momento',
    },
    '9iyjnm20': {
      'en': 'Recipient\'s name',
      'es': 'Nombre del destinatario',
      'pt': 'Nome do destinatário',
    },
    's3e9x470': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'itrs528x': {
      'en': 'Enter full name',
      'es': 'Ingrese el nombre completo',
      'pt': 'Digite o nome completo',
    },
    'rw81v1jd': {
      'en': 'Recipient\'s phone number',
      'es': 'Número de teléfono del destinatario',
      'pt': 'Número de telefone do destinatário',
    },
    '80m18jmg': {
      'en': 'Enter phone number',
      'es': 'Introduzca el número de teléfono',
      'pt': 'Digite o número de telefone',
    },
    'ky5wwoep': {
      'en': 'Package tag',
      'es': 'Etiqueta del paquete',
      'pt': 'Etiqueta da embalagem',
    },
    'e647aovn': {
      'en': 'Enter tag',
      'es': 'Introducir etiqueta',
      'pt': 'Digite a tag',
    },
    '5w11w7kb': {
      'en': 'Comment',
      'es': 'Comentario',
      'pt': 'Comentário',
    },
    'oc8dchxy': {
      'en': 'Optional instructions',
      'es': 'Instrucciones opcionales',
      'pt': 'Instruções opcionais',
    },
    'ywm2y1zd': {
      'en': 'Apt',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    'd9i73s93': {
      'en': 'receiver_name is required',
      'es': '',
      'pt': '',
    },
    '6fbo22mq': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'aq40p8np': {
      'en': 'reciver_email is required',
      'es': '',
      'pt': '',
    },
    '09wzbifx': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'kneqbhv3': {
      'en': 'receiver_phonenumber is required',
      'es': '',
      'pt': '',
    },
    '1hb6gpr8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'xlc036z0': {
      'en': 'produc_tag is required',
      'es': '',
      'pt': '',
    },
    'wqjul4mg': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    '1r2ymp9f': {
      'en': 'comments is required',
      'es': '',
      'pt': '',
    },
    '22l6xx6t': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'kavfnblw': {
      'en': 'apt is required',
      'es': '',
      'pt': '',
    },
    'chyello9': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    '1mkq47cz': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // DetailsMap
  {
    '0i5vm8a3': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // CreateProfile
  {
    '69yasdz9': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'pt': 'Número de telefone',
    },
    'whwqu2p2': {
      'en': 'Enter your phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    'l34rxkcg': {
      'en': '+56',
      'es': 'demostración@correo electrónico.com',
      'pt': '',
    },
    'qlf3zfi9': {
      'en': 'Enter your phone number is required',
      'es': '',
      'pt': '',
    },
    'kszuo2la': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'd72g8a0t': {
      'en': 'Next',
      'es': 'Siguiente',
      'pt': 'Próxima',
    },
    '1djmkqq9': {
      'en': 'Profile',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // DetailsMapRoute
  {
    '7tayakdn': {
      'en': '50%',
      'es': '',
      'pt': '',
    },
    'sxwisdlu': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': '',
    },
  },
  // registerSuccess_modal
  {
    'vkxriblo': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'pt': '',
    },
    'h2xdozlk': {
      'en':
          'Congratulation! your account already created.\nPlease login to get amazing experience.',
      'es':
          '¡Felicitaciones! su cuenta ya creada.\nInicie sesión para obtener una experiencia increíble.',
      'pt': '',
    },
    't4tt10im': {
      'en': 'Go to Home',
      'es': 'Ir a casa',
      'pt': '',
    },
  },
  // ForgotPasswordPopup
  {
    '68da8o48': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'pt': '',
    },
    't0wp5kyz': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'pt': '',
    },
    'laq1e1na': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'pt': '',
    },
    '4wi8kjyp': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    '4ligppz0': {
      'en': 'Send Code',
      'es': 'Enviar código',
      'pt': '',
    },
  },
  // newPassword_modal
  {
    'rkilnmjw': {
      'en': 'Create New Password',
      'es': 'Crear nueva contraseña',
      'pt': '',
    },
    'ud34pzj3': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'pt': '',
    },
    '96yt5u83': {
      'en': 'Password',
      'es': 'Contraseña',
      'pt': '',
    },
    '6xsz8kht': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'pt': '',
    },
    'w8i0tlah': {
      'en': 'Password',
      'es': 'Contraseña',
      'pt': '',
    },
    '667e4ujp': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'pt': '',
    },
    'ucakz1il': {
      'en': 'Change Password',
      'es': 'Cancelar',
      'pt': '',
    },
  },
  // HotDealsCardItem
  {
    '5fyms2xp': {
      'en': '4.5',
      'es': '4.5',
      'pt': '',
    },
    'dxto6avb': {
      'en': 'Roast beef with black pepper',
      'es': 'Carne asada con pimienta negra',
      'pt': '',
    },
    '0i4n5ela': {
      'en': '\$ ',
      'es': 'ps',
      'pt': '',
    },
    'wsxtfrt1': {
      'en': '9.67',
      'es': '9.67',
      'pt': '',
    },
  },
  // TopOfWeekItem
  {
    'k7parin2': {
      'en': 'Grilled meat with kepunari sauce',
      'es': 'Carne a la parrilla con salsa kepunari',
      'pt': '',
    },
    'ueizz2wr': {
      'en': '4.4',
      'es': '4.4',
      'pt': '',
    },
    'uwy2rjgg': {
      'en': '12 Minute',
      'es': '12 minutos',
      'pt': '',
    },
    'a1nj6sno': {
      'en': '\$ ',
      'es': 'ps',
      'pt': '',
    },
    'dswoy0wv': {
      'en': '12.05',
      'es': '12.05',
      'pt': '',
    },
  },
  // FilterPopup
  {
    '8jo71kve': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'pt': '',
    },
    '8eo5q4gq': {
      'en': 'Sort by',
      'es': 'Ordenar por',
      'pt': '',
    },
    'qm6mzjkr': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'pt': '',
    },
    '2s5gpezj': {
      'en': 'Nearest',
      'es': 'Más cercano',
      'pt': '',
    },
    'iclmvv58': {
      'en': 'Fastest',
      'es': 'Lo más rápido',
      'pt': '',
    },
    'ra08b12o': {
      'en': 'Categories',
      'es': 'Categorías',
      'pt': '',
    },
    '9f5qk755': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'pt': '',
    },
    'eicbxmen': {
      'en': 'Pizza',
      'es': 'Pizza',
      'pt': '',
    },
    '1wc8f4us': {
      'en': 'Cookies',
      'es': 'Galletas',
      'pt': '',
    },
    'q4amxetw': {
      'en': 'Price Ranges',
      'es': 'Rangos de precios',
      'pt': '',
    },
    'hnv04kes': {
      'en': 'Apply Filter',
      'es': 'Aplicar filtro',
      'pt': '',
    },
  },
  // NearestLocationItem
  {
    'msl8hzk9': {
      'en': 'Delaska RIsaka',
      'es': 'Delaska RIsaka',
      'pt': '',
    },
    '5kn33zd0': {
      'en': '4.8',
      'es': '4.8',
      'pt': '',
    },
    '0lvbcm6x': {
      'en': 'Close 10.45 PM',
      'es': 'Cierre 22:45',
      'pt': '',
    },
  },
  // confirm_modal
  {
    'wss38bpn': {
      'en': 'Are you sure you want to activate your location?',
      'es': '¿Estás seguro de que quieres activar tu ubicación?',
      'pt': 'Tem certeza de que deseja ativar sua localização?',
    },
    '29xlhpns': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'pt': 'Cancelar',
    },
    'zuga39cj': {
      'en': 'Yes, Enable',
      'es': 'Sí, habilitar',
      'pt': 'Sim, habilitar',
    },
  },
  // addToCard_modal
  {
    'lqsllr27': {
      'en': 'Noodles',
      'es': 'Fideos',
      'pt': '',
    },
    'a2p37cxh': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'pt': '',
    },
    'fa7ttb41': {
      'en': '\$ ',
      'es': 'ps',
      'pt': '',
    },
    '2h9d34og': {
      'en': '6,17',
      'es': '6,17',
      'pt': '',
    },
    '4qzgey7i': {
      'en': 'Add Extra Ingredients',
      'es': 'Agregue ingredientes adicionales',
      'pt': '',
    },
    'akeff4oi': {
      'en': 'Mustard',
      'es': 'Mostaza',
      'pt': '',
    },
    '03fv0zz3': {
      'en': '1 Grm',
      'es': '1 gr',
      'pt': '',
    },
    'k9ldv5en': {
      'en': 'Onion',
      'es': 'Cebolla',
      'pt': '',
    },
    'jv08oelk': {
      'en': '1 Clove',
      'es': '1 diente',
      'pt': '',
    },
    'fas1uqhn': {
      'en': 'Note',
      'es': 'Nota',
      'pt': '',
    },
    'cchz1fp1': {
      'en': 'Write your note here',
      'es': 'Escribe tu nota aquí',
      'pt': '',
    },
    '2afi00zd': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'pt': '',
    },
  },
  // AddToCartItem
  {
    'u3pgx5vv': {
      'en': 'Noodles',
      'es': 'Fideos',
      'pt': '',
    },
    'uxac6ovs': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'pt': '',
    },
    '6ov4bl4b': {
      'en': '\$ ',
      'es': 'ps',
      'pt': '',
    },
    'bw669zmp': {
      'en': '6,17',
      'es': '6,17',
      'pt': '',
    },
  },
  // AddExtraItem
  {
    '4wms16ni': {
      'en': 'Beef',
      'es': 'Carne de res',
      'pt': '',
    },
    'ejo6z1g1': {
      'en': '1 Slice',
      'es': '1 rebanada',
      'pt': '',
    },
  },
  // MyCartItem
  {
    'acxq8c0g': {
      'en': 'Fresh prawns fried with extra onions',
      'es': 'Gambas frescas fritas con extra de cebolla',
      'pt': '',
    },
    'z0atyn19': {
      'en': '\$ ',
      'es': 'ps',
      'pt': '',
    },
    'bkk2t9yp': {
      'en': '6.17',
      'es': '6.17',
      'pt': '',
    },
  },
  // changePaymentMethod_modal
  {
    'vdt5chjy': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'pt': '',
    },
    'zt4sy9vi': {
      'en': 'Paypall',
      'es': 'pago',
      'pt': '',
    },
    'omu8rwmb': {
      'en': 'sask****@mail.com',
      'es': 'sask****@mail.com',
      'pt': '',
    },
    '4ujur370': {
      'en': 'Add Payment Method',
      'es': 'Añadir método de pago',
      'pt': '',
    },
    'yx6c24gu': {
      'en': 'Upply the payment method',
      'es': 'Subir el método de pago',
      'pt': '',
    },
  },
  // PaymentMethodItem
  {
    'clpxilmk': {
      'en': 'Mastercard',
      'es': 'Tarjeta MasterCard',
      'pt': '',
    },
    '7547er0v': {
      'en': '4827 8472 7424 ****',
      'es': '4827 8472 7424 ****',
      'pt': '',
    },
  },
  // orderSuccess_modal
  {
    'ai8qoftl': {
      'en': 'Order Successfully',
      'es': 'Ordene con éxito',
      'pt': 'Pedido realizado con éxito',
    },
    '8w3ex41n': {
      'en':
          'Happy! Your food will be made immediately and we will send it after it\'s finished by the courier, please wait a moment.',
      'es':
          '¡Feliz! Su comida se preparará inmediatamente y la enviaremos una vez que el mensajero la haya terminado, espere un momento.',
      'pt': '',
    },
    'znwujg1g': {
      'en': 'Order Tracking',
      'es': 'Seguimiento de pedidos',
      'pt': 'Rastreamento de pedidos',
    },
  },
  // MyOrderItem
  {
    'ul6qwuuh': {
      'en': 'Date',
      'es': 'Fecha',
      'pt': 'Fecha',
    },
    'v2q7ytxk': {
      'en': 'Earned',
      'es': 'Ganado',
      'pt': 'Merecido',
    },
    'x14ewvta': {
      'en': 'Distance',
      'es': 'Distancia',
      'pt': 'Distância',
    },
    'p1ci0hje': {
      'en': 'Details',
      'es': 'Detalles',
      'pt': 'Detalhes',
    },
  },
  // FavoriteItem
  {
    '10hcqqzp': {
      'en': 'Premium vegetable salad',
      'es': 'Ensalada de verduras premium',
      'pt': '',
    },
    '3ipz56iu': {
      'en': '4.4',
      'es': '4.4',
      'pt': '',
    },
    'h937j6qa': {
      'en': '12 Minute',
      'es': '12 minutos',
      'pt': '',
    },
    't8839z31': {
      'en': '\$ ',
      'es': 'ps',
      'pt': '',
    },
    'vr8mv808': {
      'en': '6.17',
      'es': '6.17',
      'pt': '',
    },
  },
  // VoucherItem
  {
    'swpl0p0m': {
      'en': 'FoodCort Discount',
      'es': 'Descuento en FoodCort',
      'pt': '',
    },
    '3qc1a3vq': {
      'en': '40% discount for purchases over ',
      'es': '40% de descuento por compras superiores',
      'pt': '',
    },
    'x19lsosk': {
      'en': '\$30 ',
      'es': '\$30',
      'pt': '',
    },
    'ug615tq2': {
      'en': ', valid for today only',
      'es': ', válido solo por hoy',
      'pt': '',
    },
    'himear42': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'pt': '',
    },
    'u1f04mcl': {
      'en': '3',
      'es': '3',
      'pt': '',
    },
  },
  // logOut_modal
  {
    '38q11wq9': {
      'en': 'Are you sure you want to logout?',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'pt': 'Tem certeza de que deseja sair?',
    },
    'mpj8eknt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'pt': 'Cancelar',
    },
    'p19zdwc8': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'pt': 'Sair',
    },
  },
  // DetailStopModal
  {
    '492m2elv': {
      'en': 'Stop number',
      'es': 'Número de parada',
      'pt': 'Número de parada',
    },
    '0f0hxoq9': {
      'en': '11:23 AM- 1/12/2025',
      'es': '11:23 AM- 1/12/2025',
      'pt': '11:23 AM- 1/12/2025',
    },
    '0jz4dnfn': {
      'en': 'See  details',
      'es': 'Ver los detalles',
      'pt': 'Ver detalhes',
    },
    'b8vqacu8': {
      'en': 'Go',
      'es': 'Ir',
      'pt': 'Ir',
    },
  },
  // UpdateAddress_modal
  {
    '960x0lse': {
      'en': 'Update package',
      'es': 'Crear nueva contraseña',
      'pt': '',
    },
    'dkf8mbfz': {
      'en': 'Make sure you enter the data correctly',
      'es': 'Ingrese su correo o número de teléfono',
      'pt': '',
    },
    'eu8w465b': {
      'en': 'Recipient\'s name',
      'es': 'Contraseña',
      'pt': '',
    },
    '4zlz9zya': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'aculnwjz': {
      'en': 'Enter full name',
      'es': 'Crea tu nombre de usuario',
      'pt': '',
    },
    'p2hqlp50': {
      'en': 'Recipient\'s email',
      'es': 'Contraseña',
      'pt': '',
    },
    'y4xfvikb': {
      'en': 'Enter email',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    '9p5u2qoc': {
      'en': 'Recipient\'s phone number',
      'es': 'Contraseña',
      'pt': '',
    },
    '40245zsl': {
      'en': 'Enter phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    'kcjbs2m5': {
      'en': 'Package tag',
      'es': 'Contraseña',
      'pt': '',
    },
    'gkqpe592': {
      'en': 'Enter tag',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    '3wg10msm': {
      'en': 'Comment',
      'es': 'Contraseña',
      'pt': '',
    },
    '6wqc8xag': {
      'en': 'Optional instructions',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    'qr3tr84b': {
      'en': 'Apt',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'pt': '',
    },
    'svdzl540': {
      'en': 'receiver_name is required',
      'es': '',
      'pt': '',
    },
    '1dqqu78u': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'da51q2t2': {
      'en': 'reciver_email is required',
      'es': '',
      'pt': '',
    },
    '0p8i9jhu': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'uz40jzqg': {
      'en': 'receiver_phonenumber is required',
      'es': '',
      'pt': '',
    },
    'xehz6qf6': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    '97epvwaq': {
      'en': 'produc_tag is required',
      'es': '',
      'pt': '',
    },
    'yhs89w24': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'xzt2xbly': {
      'en': 'comments is required',
      'es': '',
      'pt': '',
    },
    '5czlwzdn': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'iyg9tlg2': {
      'en': 'apt is required',
      'es': '',
      'pt': '',
    },
    '9263wug4': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'pt': '',
    },
    'xc637rp1': {
      'en': 'Save',
      'es': 'Cancelar',
      'pt': '',
    },
  },
  // error_modal
  {
    'eqn29t1t': {
      'en': 'Accept',
      'es': 'Aceptar',
      'pt': 'Aceitar',
    },
  },
  // AceptRoute
  {
    'pqzm3czf': {
      'en': '400 UYU',
      'es': '400 UYU',
      'pt': '400 UYU',
    },
    '8zktcdqs': {
      'en': 'packages to be delivered',
      'es': ' paquetes a entregar',
      'pt': 'pacotes a serem entregues',
    },
  },
  // goPickup
  {
    'y5vx0nzo': {
      'en': 'Navigate',
      'es': 'Navegar',
      'pt': 'Navegar',
    },
    'b52kthrm': {
      'en': 'I have arrived',
      'es': 'He llegado',
      'pt': 'Eu cheguei',
    },
  },
  // colectePackageModal
  {
    '4tg40gsk': {
      'en': 'All packages',
      'es': 'Todos los paquetes',
      'pt': 'Todos os pacotes',
    },
  },
  // goDelivery
  {
    'tmpiura7': {
      'en': 'Navigate',
      'es': 'Navegar',
      'pt': 'Navegar',
    },
    '2l6w2kv9': {
      'en': 'Enter the PIN for order delivery',
      'es': 'Ingresa el PIN de entrega del pedido',
      'pt': 'Digite o PIN para entrega do pedido',
    },
    'oufzols5': {
      'en': 'Accept',
      'es': 'Aceptar',
      'pt': 'Aceitar',
    },
    '6vljz9g6': {
      'en': 'Incorrect PIN',
      'es': 'PIN incorrecto',
      'pt': 'PIN incorreto',
    },
    'mm4zfp1a': {
      'en': 'You only have 5 attempts',
      'es': 'Solo tiene 5 intentos',
      'pt': 'Você só tem 5 tentativas',
    },
  },
  // deliverySuccess_modal
  {
    '87mpjs9x': {
      'en': 'Successful delivery',
      'es': 'Entrega exitosa',
      'pt': 'Entrega bem-sucedida',
    },
    'gjhr7r19': {
      'en': 'Go to Home',
      'es': 'Ir al inicio',
      'pt': 'Vá para o começo',
    },
  },
  // activeDriver
  {
    'qh02qfk8': {
      'en': 'Start',
      'es': 'Iniciar',
      'pt': 'Começar',
    },
    '8jb6wizy': {
      'en': 'Finish',
      'es': 'Finalizar',
      'pt': 'Finalizar',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'en': 'Create Account',
      'es': 'Cancelar',
      'pt': '',
    },
    'ctqamqlc': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'pt': '',
    },
    'umpm3yh5': {
      'en': 'Sign Up with Google',
      'es': 'Verificar',
      'pt': '',
    },
    'u17s3o3i': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'pt': '',
    },
    'm470nw6c': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'pt': '',
    },
    'tkq1nhez': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'pt': '',
    },
    'amak33fx': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'pt': '',
    },
    '5hctr45y': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'pt': '',
    },
    'fazi37bo': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'pt': '',
    },
    '6on3f8zv': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'pt': '',
    },
    'vc3k7k6z': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'pt': '',
    },
    'cvmlykt8': {
      'en': 'On Progress',
      'es': 'En progreso',
      'pt': '',
    },
    'ogz0ss6o': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'pt': '',
    },
    'c6ys6sgh': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '8l5qm73d': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'o3iybnv1': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'cpbcsw9m': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'zi2yt9e7': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'vnau18bv': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'lktg3dy4': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'fjabeg9r': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '7yw004o2': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'xsjq375t': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'xiyzhulx': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'm3u1mw7e': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'puz8t19e': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'may9zjuf': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'dvzeat75': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '4bdekwbm': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'rvm9rdle': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '3uxb43tw': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'g8ay9flm': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '0raeaqd3': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'j3d762mc': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'jzepjy1z': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'dlctomaa': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'fdy7k4vs': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'o37sr5xj': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'v8s1znh7': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'jg3a7edz': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'pcwstkno': {
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
