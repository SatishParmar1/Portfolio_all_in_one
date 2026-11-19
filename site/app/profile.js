export const site = 'https://www.satish.studio'
export const email = 'satishparmarparmar486@gmail.com'
export const github = 'https://github.com/SatishParmar1'
export const linkedin = 'https://www.linkedin.com/in/satish-parmar-ak978312/'
export const brand = 'Who is Satish'
export const siteTitle = 'Who is Satish | Satish Parmar, Mobile & IoT Developer'
export const description = 'Satish Parmar is a mobile and IoT developer in Jaipur, India. Explore his Flutter and React Native apps, IoT prototypes, open-source Dart packages, and freelance services.'

export const projects = [
  {
    slug: 'tyrebook',
    name: 'TyreBook',
    category: 'Fleet operations',
    image: '/images/tyrebook-store.webp',
    alt: 'TyreBook screenshot from Google Play',
    storeImage: true,
    screenshotCount: 7,
    summary: 'A tyre ERP and marketplace built from scratch for fleet owners and dealers.',
    detail: 'TyreBook tracks tyres through inventory, inspection, fitment, removal, retreading, and claims. I built real-time Firestore synchronisation and role-based access for three or more user roles. I used Provider to address unnecessary re-renders in concurrent sessions and integrated Firebase Analytics and Crashlytics for production monitoring.',
    stack: ['Flutter', 'Dart', 'Firestore', 'Provider'],
    href: 'https://play.google.com/store/apps/details?id=com.quick_erp_flutter_app.tyrebook',
    action: 'View on Google Play',
  },
  {
    slug: 'tyremitra',
    name: 'TyreMitra',
    category: 'Field operations',
    image: '/images/tyremitra-store.webp',
    alt: 'TyreMitra field operations app screenshot from Google Play',
    storeImage: true,
    screenshotCount: 9,
    summary: 'A lead-capture app with meeting logs and a dedicated portal for freelancers.',
    detail: 'I built TyreMitra from scratch for Regrip India. The app helps field teams capture leads across five customer categories, log meetings for follow-up, and gives freelancers their own portal to submit leads.',
    stack: ['Flutter', 'Dart'],
    href: 'https://play.google.com/store/apps/details?id=com.regrip.crms.internal.app',
    action: 'View Regrip’s Google Play listing',
  },
  {
    slug: 'onol',
    name: 'ONOL',
    category: 'Screen-time insights',
    image: '/images/onol-store.webp',
    alt: 'ONOL screen-time app screenshot from Google Play',
    storeImage: true,
    screenshotCount: 6,
    summary: 'An offline app that turns screen time into daily roasts, weekly stories, and personal usage insights.',
    detail: 'ONOL turns device-usage data into screen-time summaries, personality cards, and badges. Users can set daily limits for individual apps. All analysis takes place on the device, with no account or internet permission required.',
    stack: ['Flutter', 'Dart', 'On-device processing'],
    href: 'https://play.google.com/store/apps/details?id=com.tractal.onol',
    action: 'View on Google Play',
  },
  {
    slug: 'regrip-facility',
    name: 'Tyre Management ERP',
    category: 'Tyre service operations',
    image: '/images/screenshots/regrip-facility/01.webp',
    alt: 'Tyre Management ERP screenshot from Google Play',
    storeImage: true,
    screenshotCount: 5,
    summary: 'Regrip India’s app for tyre refurbishment, maintenance, and inspections across service locations.',
    detail: 'I maintain the Flutter app at Regrip India. It supports tyre refurbishment, periodic maintenance, and inspection workflows across service locations.',
    stack: ['Flutter', 'Dart'],
    href: 'https://play.google.com/store/apps/details?id=com.bhairavasoft.regrip.facility&hl=en',
    action: 'View on Google Play',
  },
  {
    slug: 'shree-sai-chemist',
    name: 'Shree Sai Chemist',
    category: 'Mobile commerce',
    image: '/images/shreesai.jpg',
    alt: 'Shree Sai Chemist mobile app preview',
    summary: 'A Flutter app for ordering medicines and everyday products from a local chemist.',
    detail: 'The app brings a local pharmacy’s catalogue and ordering flow to mobile, giving customers one place to browse products and place an order.',
    stack: ['Flutter', 'Dart'],
  },
  {
    slug: 'proflamingo',
    name: 'Proflamingo',
    category: 'Education platform',
    image: '/images/flamingo.jpg',
    alt: 'Proflamingo education platform preview',
    summary: 'A web platform for educators to run tests and students to prepare for placements.',
    detail: 'Proflamingo gives teachers a space to conduct assessments and gives students a place to practice for campus recruitment.',
    stack: ['Flutter', 'Dart', 'Web'],
  },
  {
    slug: 'assistive-knee-guard',
    name: 'Assistive Knee Guard',
    category: 'IoT prototype',
    image: '/images/iot1.jpg',
    alt: 'Illustration of connected IoT devices',
    summary: 'A wearable prototype that alerts people with visual impairments to nearby obstacles.',
    detail: 'The wearable uses ultrasonic sensors to detect obstacles and a vibration motor to provide haptic feedback. An ESP8266 connects the hardware to a Flutter app that provides audio alerts.',
    stack: ['Flutter', 'ESP8266', 'Sensors'],
  },
  {
    slug: 'trend-wave',
    name: 'Trend Wave',
    category: 'News app',
    image: '/images/trend-wave.webp',
    alt: 'Trend Wave app preview',
    summary: 'A Flutter app that brings current news from the Open News API into a mobile reading interface.',
    detail: 'Trend Wave fetches current stories from the Open News API and displays them in a Flutter interface for reading on mobile.',
    stack: ['Flutter', 'Dart', 'REST API'],
  },
  {
    slug: 'sky-view',
    name: 'Sky View',
    category: 'Weather app',
    image: '/images/sky-view.webp',
    alt: 'Sky View weather app preview',
    summary: 'Location-based forecasts built with Flutter and the OpenWeather API.',
    detail: 'Sky View uses the device’s coordinates to request weather data from OpenWeather and present local conditions in a Flutter interface.',
    stack: ['Flutter', 'Dart', 'OpenWeather API'],
  },
]

export const packages = [
  {
    name: 'api_network_logger',
    title: 'API Network Logger',
    category: 'Network debugging',
    repository: `${github}/Api_Network_Logger`,
    description: 'Inspect Dio and http traffic, queue telemetry in SQLite, and redact credentials before they reach your logs.',
    useCase: 'Useful when you need to inspect requests on a device or see what happened when connectivity dropped.',
    features: [
      ['Request inspection', 'Capture network activity through adapters for Dio and the http package.'],
      ['Offline queue', 'Keep events in a local SQLite queue when the device is offline.'],
      ['Credential redaction', 'Remove sensitive values from logged network data.'],
    ],
  },
  {
    name: 'page_navigation_transition',
    title: 'Page Navigation Transition',
    category: 'Flutter navigation',
    repository: `${github}/page_navigation_transition`,
    description: 'Configurable Flutter route transitions with Hero-aware animations, named routes, and custom curves.',
    useCase: 'Useful when a Flutter app needs consistent transitions between screens, with different motion options for different routes.',
    features: [
      ['Navigation integration', 'Use transitions with Navigator, extension methods, or named routes.'],
      ['Motion presets', 'Choose prebuilt transitions and tune their duration and curves.'],
      ['Shared elements', 'Coordinate route transitions with Flutter Hero animations and use reduced-motion options.'],
    ],
  },
  {
    name: 'photo_opener_view',
    title: 'Photo Opener View',
    category: 'Media viewing',
    repository: `${github}/Photo_Opening_Package`,
    description: 'Image and video viewing with zoom, swipe gestures, gallery navigation, and customizable controls.',
    useCase: 'Useful for galleries, feeds, and apps that need to open images or videos without building their own media viewer.',
    features: [
      ['Image gestures', 'Support pinch-to-zoom, double-tap zoom, rotation, and swipe-to-dismiss.'],
      ['Gallery navigation', 'Browse multiple images with captions and an optional slideshow.'],
      ['Video controls', 'Support playback, seeking, speed adjustments, and inline previews.'],
    ],
  },
  {
    name: 'smart_review_prompter',
    title: 'Smart Review Prompter',
    category: 'In-app reviews',
    repository: `${github}/smart_review_prompter`,
    description: 'Control when to request store reviews using app opens or time since installation.',
    useCase: 'Useful when you want to wait until users have had a chance to use the app before requesting a review.',
    features: [
      ['App-open threshold', 'Wait for a configurable number of launches before requesting a review.'],
      ['Install-age threshold', 'Use days since installation to decide when to prompt.'],
      ['Prompt timing', 'Configure both thresholds as part of your Flutter app’s review flow.'],
    ],
  },
]

export const experience = [
  {
    role: 'Flutter Developer',
    company: 'Regrip India Pvt. Ltd.',
    dates: 'Feb 2025 – Present',
    details: [
      'Built TyreBook and TyreMitra from scratch and maintain the Regrip Tyre Management App in Flutter and Riims in React Native.',
      'Implemented role-based Firestore sync and integrated Firebase Analytics and Crashlytics.',
    ],
  },
  {
    role: 'Flutter Developer Intern',
    company: 'Digi Astro Technologies',
    dates: 'Jul – Aug 2024',
    details: [
      'Refactored Provider state updates and resolved Flutter UI bugs, reducing UI re-render lag by about 40%.',
      'Shipped five features and reduced the Firebase crash rate by 35%.',
    ],
  },
  {
    role: 'Flutter Developer Intern',
    company: 'Learn and Build by Techinest',
    dates: 'Jun – Aug 2023',
    details: [
      'Built Flutter interfaces, implemented Firebase Authentication, and integrated the OpenWeather API for location-based forecasts.',
    ],
  },
]

export const skills = [
  ['Mobile', 'Flutter, Dart, Provider, BLoC, React Native'],
  ['Data and integration', 'Firestore, Firebase Authentication, REST APIs, Dio, SQLite'],
  ['IoT', 'ESP8266, ultrasonic sensing, haptic feedback'],
  ['Quality and release', 'Crashlytics, Firebase Analytics, unit testing, Git, Google Play Console'],
]
