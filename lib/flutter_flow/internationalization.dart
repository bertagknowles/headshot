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
      'en': 'AI Headshot Generator',
      'de': 'KI-Kopfschussgenerator',
      'es': 'Generador de disparos en la cabeza con IA',
      'fr': 'Générateur de headshots IA',
      'it': 'Generatore di colpi alla testa dell\'IA',
      'nl': 'AI Headshot-generator',
      'pl': 'Generator strzałów w głowę AI',
      'pt': 'Gerador de tiro na cabeça de IA',
      'ru': 'Генератор выстрелов в голову с искусственным интеллектом',
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
      'en': 'Add Pose Image',
      'de': 'Posenbild hinzufügen',
      'es': 'Agregar imagen de pose',
      'fr': 'Ajouter une image de pose',
      'it': 'Aggiungi immagine di posa',
      'nl': 'Pose-afbeelding toevoegen',
      'pl': 'Dodaj obraz pozy',
      'pt': 'Adicionar imagem de pose',
      'ru': 'Добавить изображение позы',
    },
    'fjpxjd4v': {
      'en': 'Enter prompt',
      'de': 'Eingabeaufforderung eingeben',
      'es': 'Introduzca el mensaje',
      'fr': 'Entrez l\'invite',
      'it': 'Inserisci la richiesta',
      'nl': 'Voer prompt in',
      'pl': 'Wprowadź monit',
      'pt': 'Digite o prompt',
      'ru': 'Введите подсказку',
    },
    'jquywzjb': {
      'en': 'a portrait of a man wearing a suit',
      'de': 'ein Porträt eines Mannes im Anzug',
      'es': 'un retrato de un hombre vestido con traje',
      'fr': 'un portrait d\'un homme portant un costume',
      'it': 'un ritratto di un uomo che indossa un abito',
      'nl': 'een portret van een man in pak',
      'pl': 'portret mężczyzny w garniturze',
      'pt': 'um retrato de um homem vestindo um terno',
      'ru': 'портрет мужчины в костюме',
    },
    'g6qxjodl': {
      'en':
          'AI processing may take 1 to 5 minutes depending on server loads. Please be patient.',
      'de':
          'Die KI-Verarbeitung kann je nach Serverauslastung 1 bis 5 Minuten dauern. Bitte haben Sie Geduld.',
      'es':
          'El procesamiento de IA puede tardar de 1 a 5 minutos dependiendo de la carga del servidor. Por favor sea paciente.',
      'fr':
          'Le traitement de l\'IA peut prendre 1 à 5 minutes en fonction de la charge du serveur. S\'il vous plaît soyez patient.',
      'it':
          'L\'elaborazione AI può richiedere da 1 a 5 minuti a seconda dei carichi del server. Per favore sii paziente.',
      'nl':
          'Afhankelijk van de serverbelasting kan de AI-verwerking 1 tot 5 minuten duren. Wees alstublieft geduldig.',
      'pl':
          'Przetwarzanie AI może zająć od 1 do 5 minut w zależności od obciążenia serwera. Proszę być cierpliwym.',
      'pt':
          'O processamento da IA ​​pode levar de 1 a 5 minutos, dependendo da carga do servidor. Por favor, seja paciente.',
      'ru':
          'Обработка AI может занять от 1 до 5 минут в зависимости от нагрузки на сервер. Пожалуйста, будьте терпеливы.',
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
      'en': 'Generate',
      'de': 'Generieren',
      'es': 'Generar',
      'fr': 'Générer',
      'it': 'creare',
      'nl': 'Genereer',
      'pl': 'Generować',
      'pt': 'Gerar',
      'ru': 'Генерировать',
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
          'AI Headshot Generator\n\nIntroducing \"AI Headshot Generator\", an extraordinary app that magically puts a new spin on your selfies! Immerse yourself in a world of mesmerizing transformations as cutting-edge AI technology seamlessly generates headshot photos in minutes! Whether you\'re after a burst of laughter or a dash of creativity, \"AI Headshot Generator\" has got you covered! Enhance your personal or professional portfolio with captivating headshots that will make heads turn.',
      'de':
          'KI-Kopfschussgenerator\n\nWir stellen Ihnen „AI Headshot Generator“ vor, eine außergewöhnliche App, die Ihren Selfies auf magische Weise eine neue Note verleiht! Tauchen Sie ein in eine Welt faszinierender Transformationen, während modernste KI-Technologie in wenigen Minuten nahtlos Porträtfotos generiert! Egal, ob Sie auf der Suche nach einem Ausbruch aus Lachen oder einer Prise Kreativität sind, „AI Headshot Generator“ ist genau das Richtige für Sie! Bereichern Sie Ihr persönliches oder berufliches Portfolio mit fesselnden Portraitfotos, die für Aufsehen sorgen.',
      'es':
          'Generador de disparos en la cabeza con IA\n\n¡Presentamos \"AI Headshot Generator\", una aplicación extraordinaria que mágicamente le da un nuevo giro a tus selfies! ¡Sumérjase en un mundo de transformaciones fascinantes mientras la tecnología de inteligencia artificial de vanguardia genera sin problemas fotografías de rostros en minutos! Ya sea que busques una carcajada o una pizca de creatividad, ¡el \"Generador de disparos en la cabeza con IA\" lo tiene cubierto! Mejore su portafolio personal o profesional con cautivadores retratos que llamarán la atención.',
      'fr':
          'Générateur de headshots IA\n\nPrésentation de « AI Headshot Generator », une application extraordinaire qui donne comme par magie une nouvelle tournure à vos selfies ! Plongez-vous dans un monde de transformations fascinantes grâce à la technologie d\'IA de pointe qui génère de manière transparente des photos de tête en quelques minutes ! Que vous recherchiez un éclat de rire ou un soupçon de créativité, \"AI Headshot Generator\" est là pour vous ! Améliorez votre portfolio personnel ou professionnel avec des portraits captivants qui feront tourner les têtes.',
      'it':
          'Generatore di colpi alla testa dell\'IA\n\nTi presentiamo \"AI Headshot Generator\", un\'app straordinaria che magicamente dà una nuova svolta ai tuoi selfie! Immergiti in un mondo di trasformazioni affascinanti mentre la tecnologia AI all\'avanguardia genera facilmente foto di primi piani in pochi minuti! Che tu stia cercando uno scoppio di risate o un pizzico di creatività, \"AI Headshot Generator\" è quello che fa per te! Migliora il tuo portfolio personale o professionale con accattivanti colpi alla testa che faranno girare la testa.',
      'nl':
          'AI Headshot-generator\n\nMaak kennis met \"AI Headshot Generator\", een buitengewone app die op magische wijze een nieuwe draai aan je selfies geeft! Dompel jezelf onder in een wereld vol betoverende transformaties terwijl de allernieuwste AI-technologie binnen enkele minuten naadloos portretfoto\'s genereert! Of je nu op zoek bent naar een lachbui of een vleugje creativiteit, \"AI Headshot Generator\" heeft wat je zoekt! Verbeter uw persoonlijke of professionele portfolio met boeiende portretfoto\'s die de aandacht zullen trekken.',
      'pl':
          'Generator strzałów w głowę AI\n\nPrzedstawiamy „Generator strzałów w głowę AI”, niezwykłą aplikację, która w magiczny sposób nadaje nowy charakter Twoim selfie! Zanurz się w świecie hipnotyzujących przemian, ponieważ najnowocześniejsza technologia AI płynnie generuje zdjęcia głowy w ciągu kilku minut! Niezależnie od tego, czy szukasz wybuchu śmiechu, czy odrobiny kreatywności, „Generator strzałów w głowę AI” zapewni Ci wszystko! Wzbogać swoje osobiste lub zawodowe portfolio o urzekające zdjęcia głowy, które przyciągną wzrok.',
      'pt':
          'Gerador de tiro na cabeça de IA\n\nApresentando o \"AI Headshot Generator\", um aplicativo extraordinário que magicamente dá um novo toque às suas selfies! Mergulhe em um mundo de transformações fascinantes, pois a tecnologia de IA de ponta gera fotos de rosto em minutos! Esteja você atrás de uma gargalhada ou de uma pitada de criatividade, o \"AI Headshot Generator\" tem o que você precisa! Aprimore seu portfólio pessoal ou profissional com fotos cativantes que farão girar as cabeças.',
      'ru':
          'Генератор выстрелов в голову с искусственным интеллектом\n\nПредставляем «AI Headshot Generator», необычное приложение, которое волшебным образом придаст вашим селфи новый вид! Погрузитесь в мир завораживающих трансформаций, поскольку передовая технология искусственного интеллекта позволяет создавать фотографии в голову за считанные минуты! Если вам нужен взрыв смеха или творческий подход, «AI Headshot Generator» поможет вам! Украсьте свое личное или профессиональное портфолио захватывающими фотографиями, которые заставят обратить на себя внимание.',
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
      'en': '✨ AI Headshot Swap ',
      'de': '✨ KI-Kopfschuss-Tausch',
      'es': '✨ Intercambio de disparos en la cabeza con IA',
      'fr': '✨ Échange de photos de l\'IA',
      'it': '✨ Scambio colpi alla testa dell\'IA',
      'nl': '✨ AI-headshotwissel',
      'pl': '✨ Zamiana strzałów w głowę AI',
      'pt': '✨ Troca de tiro na cabeça com IA',
      'ru': '✨ Обмен выстрелами в голову с помощью ИИ',
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
          'Allow photo library access to process images for swapping headshots. Without this permission, headshot swap process will not function.',
      'de':
          'Erlauben Sie den Zugriff auf die Fotobibliothek, um Bilder zum Austauschen von Porträtaufnahmen zu verarbeiten. Ohne diese Berechtigung funktioniert der Headshot-Swap-Prozess nicht.',
      'es':
          'Permita el acceso a la biblioteca de fotografías para procesar imágenes e intercambiar tomas de rostro. Sin este permiso, el proceso de intercambio de fotografías no funcionará.',
      'fr':
          'Autorisez l’accès à la bibliothèque de photos pour traiter les images pour échanger des photos à la tête. Sans cette autorisation, le processus d’échange de photos ne fonctionnera pas.',
      'it':
          'Consenti l\'accesso alla libreria di foto per elaborare le immagini per lo scambio di colpi alla testa. Senza questa autorizzazione, il processo di scambio dell\'headshot non funzionerà.',
      'nl':
          'Geef toegang tot de fotobibliotheek om afbeeldingen te verwerken voor het uitwisselen van portretfoto\'s. Zonder deze toestemming functioneert het headshot-wisselproces niet.',
      'pl':
          'Zezwól na dostęp do biblioteki zdjęć w celu przetwarzania obrazów w celu wymiany zdjęć w głowę. Bez tego pozwolenia proces wymiany strzałów w głowę nie będzie działał.',
      'pt':
          'Permitir acesso à biblioteca de fotos para processar imagens para troca de fotos. Sem esta permissão, o processo de troca de headshot não funcionará.',
      'ru':
          'Разрешите доступ к библиотеке фотографий для обработки изображений для замены снимков головы. Без этого разрешения процесс замены хедшотов работать не будет.',
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
