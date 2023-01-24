import 'package:get/get.dart';
import '../screens/products_details_screen.dart';
import '../widgets/navigation.dart';

class RouterHelper {
  // static String initial= AuthController.instance.initialScreen(user);

  static String initial = "/";
  static String myHomePage = "/my-home-page";
  static String homePage = "/home-page";
  static String popularproductDetails = "/popukar-products-details";

  // static String jobDetails = "/jobDetails";
  // static String jobList = "/jobList";

  static String getInitialPage() => initial;
  static String getMyHomePage() => myHomePage;
  static String getHomePage() => homePage;
  static String getPopularProductDetails(int pageId) =>
      "$popularproductDetails?pageId=$pageId";
  // static String getJobDetails(int pageId) => "$jobDetails?pageId=$pageId";
  // static String getJobList() => jobList;

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => const MyHomepage(),
        transition: Transition.fadeIn),
    // GetPage(
    //     name: myHomePage,
    //     page: () {
    //       var email = Get.parameters['email'];
    //       return MyHomepage();
    //     },
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: logInPage,
    //     page: () => const LogInPage(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: signUpPage,
    //     page: () => const SignUpPage(),
    //     transition: Transition.fadeIn),
    GetPage(
        name: popularproductDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularproductDetails(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
  ];
}
