import 'package:flutter/material.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/constants/strings.dart';
import 'package:kartenz/provider/AuctionProvider.dart';
import 'package:kartenz/provider/PurchaseProvider.dart';
import 'package:kartenz/provider/SubmittedCarsProvider.dart';
import 'package:kartenz/provider/auth_provider.dart';
import 'package:provider/provider.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    initData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/111.png",),
                SizedBox(height: 8,),
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        )
    );
  }


  void initData() async {
    AuthProvider authProvider = Provider.of(context, listen: false);
    AuctionProvider auctionProvider = Provider.of(context, listen: false);
    PurchaseProvider purchaseProvider=Provider.of(context,listen: false);
    SubmittedCarsProvider submittedCarsProvider=Provider.of(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      bool isLoggedIN  = await authProvider.checkLoginLocal();
      String initialRoute = LOGIN_PAGE;
      if(isLoggedIN){
        initialRoute =  HOME_PAGE;
        auctionProvider.getAuctionsBuyAll(authProvider.loginModel.token,authProvider.loginModel.id);
        auctionProvider.getTransaction(authProvider.loginModel.id, authProvider.loginModel.token);
        auctionProvider.getBuyAllPurchase( authProvider.loginModel.token,authProvider.loginModel.id);
        auctionProvider.getStateList(authProvider.loginModel.token);
        purchaseProvider.postBuyCode(authProvider.loginModel.token, "10kCd9RZZ");
        purchaseProvider.postAuctionCode(authProvider.loginModel.token, "10kCd9RZZ");
        auctionProvider.postListRt(authProvider.loginModel.token, "5fd8459b3121f4001fe2722b");
        submittedCarsProvider.getSubmittedCars(authProvider.loginModel.token);
        auctionProvider.postUploadNewCar(authProvider.loginModel.token);
      }
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, initialRoute);
    });
  }
}
