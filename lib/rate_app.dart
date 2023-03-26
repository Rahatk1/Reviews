import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class AppRating {
  rateApp(BuildContext context) {
    RateMyApp rateMyApp = RateMyApp(
      preferencesPrefix: "RateMyApp_",
      minDays: 0,
      minLaunches: 2,
      remindDays: 0,
      remindLaunches: 1,
      // googlePlayIdentifier: ""
      // appStoreIdentifier: ""
    );
    rateMyApp.init().then((_) => {
          if (rateMyApp.shouldOpenDialog)
            {
              rateMyApp.showRateDialog(
                context,
                title: "are you enjoying this app",
                message: "if you like our app, please rate it! ",
                rateButton: "RATE NOW",
                noButton: "NO",
                laterButton: "Not Now LATER",
                listener: (button) {
                  switch (button) {
                    case RateMyAppDialogButton.rate:
                      print("clicked on rate");
                      break;
                    case RateMyAppDialogButton.no:
                      print("click on no");
                      break;
                    case RateMyAppDialogButton.later:
                      print("click on later");
                      break;
                  }
                  return true;
                },
                dialogStyle: const DialogStyle(),
                onDismissed: () =>
                    rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
              )
            }
        });
  }
}
