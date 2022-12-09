enum Routes {
  launch,
  login,
  slider,
  qrscaner,
  webview,
  registration,
  creatempin,
  verifympin,
  homeScreen,
  bottomBar,
  profilePage,
  payPage,
  myBillsPage,
  callUsPage,
  selfiePage,
}

extension path on Routes {
  String get name {
    switch (this) {
      case Routes.launch:
        return '/';
      case Routes.login:
        return '/login';
      case Routes.slider:
        return '/slider';
      case Routes.qrscaner:
        return '/qrscaner';
      case Routes.webview:
        return '/webview';
      case Routes.registration:
        return '/registration';
      case Routes.creatempin:
        return '/creatempin';
      case Routes.verifympin:
        return '/verifympin';
      case Routes.homeScreen:
        return '/homeScreen';
      case Routes.bottomBar:
        return '/bottomBar';
      case Routes.profilePage:
        return '/profilePage';
      case Routes.payPage:
        return '/payPage';
      case Routes.myBillsPage:
        return '/myBillsPage';
      case Routes.callUsPage:
        return '/callUsPage';
      case Routes.selfiePage:
        return '/selfiePage';

      default:
        return "/";
    }
  }
}
