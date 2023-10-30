import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() =>
      ['en', 'de', 'es', 'nl', 'fr', 'it', 'pt', 'ru', 'pl'];

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
    String? deText = '',
    String? esText = '',
    String? nlText = '',
    String? frText = '',
    String? itText = '',
    String? ptText = '',
    String? ruText = '',
    String? plText = '',
  }) =>
      [
        enText,
        deText,
        esText,
        nlText,
        frText,
        itText,
        ptText,
        ruText,
        plText
      ][languageIndex] ??
      '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'zxfqn9tc': {
      'en': 'AI Headshot Swap',
      'de': 'KI-Kopfschuss-Tausch',
      'es': 'Intercambio de disparos en la cabeza con IA',
      'fr': 'Échange de tir à la tête de l\'IA',
      'it': 'Scambio colpi alla testa dell\'IA',
      'nl': 'AI-headshotwissel',
      'pl': 'Zamiana strzałów w głowę AI',
      'pt': 'Troca de tiro na cabeça com IA',
      'ru': 'Замена ИИ в голову',
    },
    '2fk1obt1': {
      'en': 'Add Selfie/Source Image with Clear Face',
      'de': 'Selfie/Quellbild mit klarem Gesicht hinzufügen',
      'es': 'Agregar selfie/imagen fuente con cara clara',
      'fr': 'Ajouter un selfie/une image source avec Clear Face',
      'it': 'Aggiungi selfie/immagine sorgente con volto chiaro',
      'nl': 'Voeg een selfie-/bronafbeelding toe met een helder gezicht',
      'pl': 'Dodaj zdjęcie selfie/źródłowe z wyraźną twarzą',
      'pt': 'Adicionar selfie/imagem de origem com rosto claro',
      'ru': 'Добавьте селфи/исходное изображение с чистым лицом',
    },
    'gh1hdu1h': {
      'en': '(Only .jpg, jpeg accepted)',
      'de': '(Nur .jpg, jpeg akzeptiert)',
      'es': '(Solo se aceptan .jpg, jpeg)',
      'fr': '(Uniquement .jpg, jpeg acceptés)',
      'it': '(Solo .jpg, jpeg accettato)',
      'nl': '(Alleen .jpg, jpeg geaccepteerd)',
      'pl': '(Akceptowane są tylko pliki .jpg i JPEG)',
      'pt': '(Somente .jpg, jpeg aceito)',
      'ru': '(Принимаются только .jpg, jpeg)',
    },
    'ud5i66ne': {
      'en': 'Add Target Headshot Template',
      'de': 'Ziel-Headshot-Vorlage hinzufügen',
      'es': 'Agregar plantilla de retrato de objetivo',
      'fr': 'Ajouter un modèle de photo cible',
      'it': 'Aggiungi modello di colpo alla testa del bersaglio',
      'nl': 'Doel-headshot-sjabloon toevoegen',
      'pl': 'Dodaj szablon strzału w głowę celu',
      'pt': 'Adicionar modelo de tiro na cabeça do alvo',
      'ru': 'Добавить шаблон целевого выстрела в голову',
    },
    'voc0oo10': {
      'en': 'Or add custom headshot as target',
      'de':
          'Oder fügen Sie einen benutzerdefinierten Kopfschuss als Ziel hinzu',
      'es': 'O agregue un disparo a la cabeza personalizado como objetivo',
      'fr': 'Ou ajoutez une photo personnalisée comme cible',
      'it': 'Oppure aggiungi un colpo alla testa personalizzato come bersaglio',
      'nl': 'Of voeg een aangepaste portretfoto toe als doelwit',
      'pl': 'Lub dodaj niestandardowy strzał w głowę jako cel',
      'pt': 'Ou adicione um headshot personalizado como alvo',
      'ru': 'Или добавьте собственный снимок головы в качестве цели.',
    },
    'g6qxjodl': {
      'en':
          'AI processing is compute intensive and may take some time depending on server loads. ',
      'de':
          'Die KI-Verarbeitung ist rechenintensiv und kann je nach Serverauslastung einige Zeit dauern.',
      'es':
          'El procesamiento de IA requiere un uso intensivo de computación y puede llevar algún tiempo dependiendo de las cargas del servidor.',
      'fr':
          'Le traitement de l\'IA nécessite beaucoup de calcul et peut prendre un certain temps en fonction de la charge du serveur.',
      'it':
          'L\'elaborazione dell\'intelligenza artificiale richiede un utilizzo intensivo del calcolo e potrebbe richiedere del tempo a seconda dei carichi del server.',
      'nl':
          'AI-verwerking is rekenintensief en kan enige tijd duren, afhankelijk van de serverbelasting.',
      'pl':
          'Przetwarzanie AI wymaga dużej mocy obliczeniowej i może zająć trochę czasu w zależności od obciążenia serwera.',
      'pt':
          'O processamento de IA exige muita computação e pode levar algum tempo dependendo das cargas do servidor.',
      'ru':
          'Обработка ИИ требует больших вычислительных ресурсов и может занять некоторое время в зависимости от нагрузки на сервер.',
    },
    '4lhkpvc2': {
      'en': 'Processing Images....',
      'de': 'Bilder verarbeiten....',
      'es': 'Procesando imágenes....',
      'fr': 'Traitement des images....',
      'it': 'Elaborazione delle immagini....',
      'nl': 'Afbeeldingen verwerken....',
      'pl': 'Przetwarzanie obrazów....',
      'pt': 'Processando imagens....',
      'ru': 'Обработка изображений....',
    },
    'oi9xgmw6': {
      'en': 'Swap Headshot',
      'de': 'Kopfschuss tauschen',
      'es': 'Intercambiar foto en la cabeza',
      'fr': 'Échanger la photo du visage',
      'it': 'Scambia il colpo alla testa',
      'nl': 'Wissel van hoofdfoto',
      'pl': 'Zamień strzał w głowę',
      'pt': 'Trocar foto na cabeça',
      'ru': 'Обмен выстрелами в голову',
    },
    '4llcj4n0': {
      'en': 'Reset/Clear Image',
      'de': 'Bild zurücksetzen/löschen',
      'es': 'Restablecer/Borrar imagen',
      'fr': 'Réinitialiser/Effacer l\'image',
      'it': 'Reimposta/Cancella immagine',
      'nl': 'Reset/helder beeld',
      'pl': 'Zresetuj/wyczyść obraz',
      'pt': 'Redefinir/limpar imagem',
      'ru': 'Сбросить/очистить изображение',
    },
    'dwotuuw6': {
      'en': 'Remaining Credits: ',
      'de': 'Verbleibendes Restguthaben:',
      'es': 'Créditos restantes:',
      'fr': 'Crédits restants :',
      'it': 'Crediti rimanenti:',
      'nl': 'Resterende tegoeden:',
      'pl': 'Pozostałe kredyty:',
      'pt': 'Créditos restantes:',
      'ru': 'Оставшиеся кредиты:',
    },
    'p3ahwtrn': {
      'en': 'Out of Credits? Come back after 24 hrs :)',
      'de': 'Keine Credits mehr? Komm nach 24 Stunden wieder :)',
      'es': '¿Sin créditos? Vuelve después de 24 hrs :)',
      'fr': 'Plus de crédits ? Revenez après 24 heures :)',
      'it': 'Hai finito i crediti? Torna dopo 24 ore :)',
      'nl': 'Geen krediet meer? Kom na 24 uur terug :)',
      'pl': 'Brak kredytów? Wróć po 24 godzinach :)',
      'pt': 'Sem créditos? Volte depois de 24 horas :)',
      'ru': 'Закончились кредиты? Возвращайтесь через 24 часа :)',
    },
    '0x1jqzy0': {
      'en': 'Or Start Subscription Plan',
      'de': 'Oder starten Sie ein Abonnement',
      'es': 'O iniciar el plan de suscripción',
      'fr': 'Ou démarrer le plan d\'abonnement',
      'it': 'Oppure avvia il piano di abbonamento',
      'nl': 'Of start een abonnement',
      'pl': 'Lub Rozpocznij plan subskrypcji',
      'pt': 'Ou inicie o plano de assinatura',
      'ru': 'Или начать план подписки',
    },
    '7awe92m3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'nl': 'Thuis',
      'pl': 'Dom',
      'pt': 'Lar',
      'ru': 'Дом',
    },
  },
  // Welcome01
  {
    'sjtrc588': {
      'en': 'Get Started',
      'de': 'Loslegen',
      'es': 'Empezar',
      'fr': 'Commencer',
      'it': 'Iniziare',
      'nl': 'Begin',
      'pl': 'Zaczynaj',
      'pt': 'Iniciar',
      'ru': 'Начать',
    },
    '38nar5dm': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'nl': 'Thuis',
      'pl': 'Dom',
      'pt': 'Lar',
      'ru': 'Дом',
    },
  },
  // Profile
  {
    '8q1xqkpl': {
      'en': 'Upgrade to Premium',
      'de': 'Auf Premium upgraden',
      'es': 'Mejorado a Premium',
      'fr': 'Passer à la version premium',
      'it': 'Passa a Premium',
      'nl': 'Upgrade naar premium',
      'pl': 'Uaktualnij do wersji Premium',
      'pt': 'Atualizar para Premium',
      'ru': 'Обновите до Премиум',
    },
    '8kwqlasj': {
      'en': 'More AI Tools',
      'de': 'Weitere KI-Tools',
      'es': 'Más herramientas de IA',
      'fr': 'Plus d\'outils d\'IA',
      'it': 'Altri strumenti IA',
      'nl': 'Meer AI-tools',
      'pl': 'Więcej narzędzi AI',
      'pt': 'Mais ferramentas de IA',
      'ru': 'Дополнительные инструменты искусственного интеллекта',
    },
    '92o5wiis': {
      'en': 'Contact Us',
      'de': 'Kontaktiere uns',
      'es': 'Contáctenos',
      'fr': 'Contactez-nous',
      'it': 'Contattaci',
      'nl': 'Neem contact met ons op',
      'pl': 'Skontaktuj się z nami',
      'pt': 'Contate-nos',
      'ru': 'Связаться с нами',
    },
    'yleouq5f': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
      'nl': 'Privacybeleid',
      'pl': 'Polityka prywatności',
      'pt': 'política de Privacidade',
      'ru': 'политика конфиденциальности',
    },
    '1993zr2t': {
      'en': 'Terms of Service',
      'de': 'Nutzungsbedingungen',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
      'it': 'Termini di servizio',
      'nl': 'Servicevoorwaarden',
      'pl': 'Warunki usługi',
      'pt': 'Termos de serviço',
      'ru': 'Условия использования',
    },
    'umc1fy0d': {
      'en':
          'AI Headshot Swap\n\nIntroducing \"AI Headshot Swap\", an extraordinary app that magically puts a new spin on your headshot photos! Immerse yourself in a world of mesmerizing transformations as cutting-edge AI technology seamlessly swaps faces in a blink of an eye! Whether you\'re after a burst of laughter or a dash of creativity, \"AI Headshot Swap\" has got you covered! Enhance your personal or professional portfolio with captivating headshot swaps that will make heads turn.',
      'de':
          'KI-Kopfschuss-Tausch\n\nWir stellen Ihnen „AI Headshot Swap“ vor, eine außergewöhnliche App, die Ihren Headshot-Fotos auf magische Weise eine neue Note verleiht! Tauchen Sie ein in eine Welt faszinierender Transformationen, während modernste KI-Technologie im Handumdrehen nahtlos Gesichter tauscht! Egal, ob Sie auf der Suche nach einem Ausbruch aus Lachen oder einer Prise Kreativität sind, „AI Headshot Swap“ ist genau das Richtige für Sie! Bereichern Sie Ihr persönliches oder berufliches Portfolio mit fesselnden Headshot-Swaps, die für Aufsehen sorgen.',
      'es':
          'Intercambio de disparos en la cabeza con IA\n\n¡Presentamos \"AI Headshot Swap\", una aplicación extraordinaria que mágicamente le da un nuevo giro a tus fotos de rostros! ¡Sumérgete en un mundo de transformaciones fascinantes mientras la tecnología de inteligencia artificial de vanguardia cambia caras sin problemas en un abrir y cerrar de ojos! Ya sea que busques una carcajada o una pizca de creatividad, ¡\"AI Headshot Swap\" lo tiene cubierto! Mejore su cartera personal o profesional con cautivadores intercambios de fotografías que llamarán la atención.',
      'fr':
          'Échange de tir à la tête de l\'IA\n\nPrésentation de \"AI Headshot Swap\", une application extraordinaire qui donne comme par magie une nouvelle tournure à vos photos ! Plongez-vous dans un monde de transformations fascinantes grâce à la technologie d\'IA de pointe qui échange les visages de manière transparente en un clin d\'œil ! Que vous recherchiez un éclat de rire ou un soupçon de créativité, \"AI Headshot Swap\" est là pour vous ! Améliorez votre portfolio personnel ou professionnel avec des échanges de portraits captivants qui feront tourner les têtes.',
      'it':
          'Scambio colpi alla testa dell\'IA\n\nTi presentiamo \"AI Headshot Swap\", un\'app straordinaria che magicamente dà una nuova svolta alle tue foto dei colpi alla testa! Immergiti in un mondo di trasformazioni affascinanti mentre la tecnologia AI all\'avanguardia scambia i volti senza soluzione di continuità in un batter d\'occhio! Che tu stia cercando uno scoppio di risate o un pizzico di creatività, \"AI Headshot Swap\" è quello che fa per te! Migliora il tuo portfolio personale o professionale con accattivanti scambi di headshot che faranno girare la testa.',
      'nl':
          'AI-headshotwissel\n\nMaak kennis met \"AI Headshot Swap\", een buitengewone app die op magische wijze een nieuwe draai aan je portretfoto\'s geeft! Dompel jezelf onder in een wereld vol betoverende transformaties terwijl de allernieuwste AI-technologie in een oogwenk naadloos van gezicht wisselt! Of je nu op zoek bent naar een lachbui of een vleugje creativiteit, \"AI Headshot Swap\" heeft wat je zoekt! Verbeter uw persoonlijke of professionele portfolio met boeiende headshot-swaps die de aandacht zullen trekken.',
      'pl':
          'Zamiana strzałów w głowę AI\n\nPrzedstawiamy „AI Headshot Swap”, niezwykłą aplikację, która w magiczny sposób nadaje nowy charakter Twoim zdjęciom wykonanym w głowę! Zanurz się w świecie hipnotyzujących przemian, gdy najnowocześniejsza technologia AI płynnie zamienia twarze w mgnieniu oka! Niezależnie od tego, czy szukasz wybuchu śmiechu, czy odrobiny kreatywności, „AI Headshot Swap” zapewni Ci wszystko! Wzbogać swoje osobiste lub zawodowe portfolio dzięki urzekającym wymianom zdjęć w głowę, które przyciągną wzrok.',
      'pt':
          'Troca de tiro na cabeça com IA\n\nApresentando o \"AI Headshot Swap\", um aplicativo extraordinário que magicamente dá um novo toque às suas fotos de headshot! Mergulhe em um mundo de transformações fascinantes enquanto a tecnologia de IA de ponta troca de rosto em um piscar de olhos! Esteja você atrás de uma explosão de risadas ou de uma pitada de criatividade, \"AI Headshot Swap\" tem o que você precisa! Aprimore seu portfólio pessoal ou profissional com trocas cativantes de headshots que farão girar as cabeças.',
      'ru':
          'Замена ИИ в голову\n\nПредставляем «AI Headshot Swap», необычное приложение, которое волшебным образом придаст новый вид вашим фотографиям! Погрузитесь в мир завораживающих трансформаций, когда передовая технология искусственного интеллекта плавно меняет лица в мгновение ока! Если вам нужен взрыв смеха или творческий подход, «AI Headshot Swap» поможет вам! Улучшите свое личное или профессиональное портфолио с помощью увлекательных снимков головы, которые заставят обратить на себя внимание.',
    },
    'v8923zu8': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'it': 'Impostazioni',
      'nl': 'Instellingen',
      'pl': 'Ustawienia',
      'pt': 'Configurações',
      'ru': 'Настройки',
    },
    'n1akdsjk': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'it': 'Impostazioni',
      'nl': 'Instellingen',
      'pl': 'Ustawienia',
      'pt': 'Configurações',
      'ru': 'Настройки',
    },
  },
  // paywallPage
  {
    '74idqw0x': {
      'en': 'Continue with limited access',
      'de': 'Fahren Sie mit eingeschränktem Zugriff fort',
      'es': 'Continuar con acceso limitado',
      'fr': 'Continuer avec un accès limité',
      'it': 'Continua con l\'accesso limitato',
      'nl': 'Ga door met beperkte toegang',
      'pl': 'Kontynuuj z ograniczonym dostępem',
      'pt': 'Continuar com acesso limitado',
      'ru': 'Продолжить с ограниченным доступом',
    },
    '4kv2rjca': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'nl': 'Thuis',
      'pl': 'Dom',
      'pt': 'Lar',
      'ru': 'Дом',
    },
  },
  // RevenueCatSubsriptionPaywall
  {
    'n84eobvz': {
      'en': '✨ AI Face Swap Photo',
      'de': '✨ AI Face Swap Foto',
      'es': '✨ Foto de intercambio de cara AI',
      'fr': '✨ Photo d\'échange de visage AI',
      'it': '✨ Foto di scambio volto AI',
      'nl': '✨ AI Face Swap-foto',
      'pl': '✨ Zdjęcie zamiany twarzy AI',
      'pt': '✨ Foto de troca de rosto AI',
      'ru': '✨ Фото замены лица с помощью ИИ',
    },
    'h73inq1v': {
      'en': 'Unlimited access\nHigh server priority\nLess waiting time ',
      'de': 'Unbegrenzter Zugang\nHohe Serverpriorität\nWeniger Wartezeit',
      'es':
          'Acceso ilimitado\nAlta prioridad del servidor\nMenos tiempo de espera',
      'fr':
          'Accès illimité\nPriorité élevée du serveur\nMoins de temps d\'attente',
      'it':
          'Accesso illimitato\nAlta priorità del server\nMeno tempo di attesa',
      'nl': 'Onbeperkt toegang\nHoge serverprioriteit\nMinder wachttijd',
      'pl':
          'Nielimitowany dostęp\nWysoki priorytet serwera\nKrótszy czas oczekiwania',
      'pt':
          'Acesso ilimitado\nAlta prioridade do servidor\nMenos tempo de espera',
      'ru':
          'Неограниченный доступ\nВысокий приоритет сервера\nМеньше времени ожидания',
    },
    'e83pr17u': {
      'en': 'Please review the options below and subscribe.',
      'de': 'Bitte überprüfen Sie die Optionen unten und abonnieren Sie.',
      'es': 'Revise las opciones a continuación y suscríbase.',
      'fr': 'Veuillez consulter les options ci-dessous et vous abonner.',
      'it': 'Controlla le opzioni qui sotto e iscriviti.',
      'nl': 'Bekijk de onderstaande opties en abonneer u.',
      'pl': 'Przejrzyj poniższe opcje i zasubskrybuj.',
      'pt': 'Por favor, revise as opções abaixo e assine.',
      'ru': 'Пожалуйста, просмотрите варианты ниже и подпишитесь.',
    },
    'xxsf35i7': {
      'en': 'Subscribe Now',
      'de': 'Abonniere jetzt',
      'es': 'Suscríbase ahora',
      'fr': 'Abonnez-vous maintenant',
      'it': 'Iscriviti ora',
      'nl': 'Abonneer nu',
      'pl': 'Zapisz się teraz',
      'pt': 'Inscreva-se agora',
      'ru': 'Подпишись сейчас',
    },
    '9qbnksal': {
      'en': 'Subscribe Now',
      'de': 'Abonniere jetzt',
      'es': 'Suscríbase ahora',
      'fr': 'Abonnez-vous maintenant',
      'it': 'Iscriviti ora',
      'nl': 'Abonneer nu',
      'pl': 'Zapisz się teraz',
      'pt': 'Inscreva-se agora',
      'ru': 'Подпишись сейчас',
    },
    'y2dwnzki': {
      'en': 'Continue with limited access',
      'de': 'Fahren Sie mit eingeschränktem Zugriff fort',
      'es': 'Continuar con acceso limitado',
      'fr': 'Continuer avec un accès limité',
      'it': 'Continua con l\'accesso limitato',
      'nl': 'Ga door met beperkte toegang',
      'pl': 'Kontynuuj z ograniczonym dostępem',
      'pt': 'Continuar com acesso limitado',
      'ru': 'Продолжить с ограниченным доступом',
    },
    '17qx36j5': {
      'en': 'Restore Purchases',
      'de': 'Einkäufe wiederherstellen',
      'es': 'Restaurar las compras',
      'fr': 'Restaurer les achats',
      'it': 'Ripristinare gli acquisti',
      'nl': 'Aankopen herstellen',
      'pl': 'Przywróć zakupy',
      'pt': 'Restaurar compras',
      'ru': 'Восстановить покупки',
    },
    'rarghd8q': {
      'en': 'Terms of Use',
      'de': 'Nutzungsbedingungen',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
      'it': 'Termini di utilizzo',
      'nl': 'Gebruiksvoorwaarden',
      'pl': 'Warunki korzystania',
      'pt': 'Termos de uso',
      'ru': 'Условия эксплуатации',
    },
    'oxgiaoao': {
      'en': 'Privacy Policy',
      'de': 'Datenschutzrichtlinie',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
      'nl': 'Privacybeleid',
      'pl': 'Polityka prywatności',
      'pt': 'política de Privacidade',
      'ru': 'политика конфиденциальности',
    },
  },
  // Template_Gallery
  {
    '9gfev4ss': {
      'en': 'Applying Template...',
      'de': 'Vorlage anwenden...',
      'es': 'Aplicando plantilla...',
      'fr': 'Application du modèle...',
      'it': 'Applicazione del modello...',
      'nl': 'Sjabloon toepassen...',
      'pl': 'Stosowanie szablonu...',
      'pt': 'Aplicando modelo...',
      'ru': 'Применение шаблона...',
    },
  },
  // GenertaedArt
  {
    'fqtzk5wl': {
      'en': 'Generated Result',
      'de': 'Generiertes Ergebnis',
      'es': 'Resultado generado',
      'fr': 'Résultat généré',
      'it': 'Risultato generato',
      'nl': 'Gegenereerd resultaat',
      'pl': 'Wygenerowany wynik',
      'pt': 'Resultado Gerado',
      'ru': 'Сгенерированный результат',
    },
    'de39pg4j': {
      'en': 'Please wait while the image loads...',
      'de': 'Bitte warten Sie, während das Bild geladen wird...',
      'es': 'Espere mientras se carga la imagen...',
      'fr': 'Veuillez patienter pendant le chargement de l\'image...',
      'it': 'Si prega di attendere il caricamento dell\'immagine...',
      'nl': 'Een ogenblik geduld terwijl de afbeelding wordt geladen...',
      'pl': 'Proszę czekać, aż obraz się załaduje...',
      'pt': 'Aguarde enquanto a imagem carrega...',
      'ru': 'Пожалуйста, подождите, пока загрузится изображение...',
    },
  },
  // Miscellaneous
  {
    'qecw3yee': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'll3dppzb': {
      'en':
          'Allow photo library access to process images for swapping faces. Without this permission, face swap process will not function.',
      'de':
          'Erlauben Sie den Zugriff auf die Fotobibliothek, um Bilder zum Austauschen von Gesichtern zu verarbeiten. Ohne diese Erlaubnis funktioniert der Face-Swap-Prozess nicht.',
      'es':
          'Permita el acceso a la biblioteca de fotografías para procesar imágenes e intercambiar caras. Sin este permiso, el proceso de intercambio de caras no funcionará.',
      'fr':
          'Autorisez l\'accès à la photothèque pour traiter les images pour échanger les visages. Sans cette autorisation, le processus d\'échange de visage ne fonctionnera pas.',
      'it':
          'Consenti l\'accesso alla libreria di foto per elaborare le immagini per lo scambio di volti. Senza questa autorizzazione, il processo di scambio dei volti non funzionerà.',
      'nl':
          'Geef toegang tot de fotobibliotheek om afbeeldingen te verwerken voor het wisselen van gezichten. Zonder deze toestemming functioneert het face-swapproces niet.',
      'pl':
          'Zezwól na dostęp do biblioteki zdjęć w celu przetwarzania obrazów w celu zamiany twarzy. Bez tego pozwolenia proces zamiany twarzy nie będzie działał.',
      'pt':
          'Permitir acesso à biblioteca de fotos para processar imagens para troca de rostos. Sem esta permissão, o processo de troca de rosto não funcionará.',
      'ru':
          'Разрешите доступ к библиотеке фотографий, чтобы обрабатывать изображения для замены лиц. Без этого разрешения процесс замены лиц работать не будет.',
    },
    '9jafympo': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'mxbi2mm9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'p89wrvdp': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    '5827lxuk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    's9nsr8dv': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'mnlcrat2': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'b3479y2l': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'ale9lli9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    '37ki3adu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    '2qnpwe25': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'bazhab5z': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    '0p1tki8g': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    '4q0mbz5h': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'xg32d16d': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'q0daumrx': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    '8hjzp6th': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'o2cus8fd': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'a26qdhug': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'rnhl897h': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'frqlljfs': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'jyxgl666': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'ctt4z7kn': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
    'pc3oc6dt': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'pl': '',
      'pt': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
