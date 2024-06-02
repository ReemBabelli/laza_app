// import 'package:go_router/go_router.dart';
// import 'package:laza_app/core/screens/starter_screen.dart';
// import 'package:laza_app/features/auth/presentation/pages/forgot_password_screen.dart';
// import 'package:laza_app/features/auth/presentation/pages/new_password_screen.dart';
// import 'package:laza_app/features/auth/presentation/pages/sign_in_screen.dart';
// import 'package:laza_app/features/auth/presentation/pages/sign_up_screen.dart';
// import 'package:laza_app/features/auth/presentation/pages/start_with_screen.dart';
// import 'package:laza_app/features/auth/presentation/pages/verification_screen.dart';
// import 'package:laza_app/features/products/domain/entities/product_entity.dart';
// import 'package:laza_app/features/products/domain/entities/products_entity.dart';
// import 'package:laza_app/features/products/presentation/pages/adding_review_screen.dart';
// import 'package:laza_app/features/products/presentation/pages/brand_screen.dart';
// import 'package:laza_app/features/products/presentation/pages/home_screen.dart';
// import 'package:laza_app/features/products/presentation/pages/product_details_screen.dart';
// import 'package:laza_app/features/products/presentation/pages/reviews_screen.dart';
// import 'package:laza_app/core/screens/splash_screen.dart';
//
// class MyRouter1 {
//   static const splash = '/';
//   static const starter = 'starter';
//   static const startWith = 'start_with';
//   static const signIn = 'sign_in';
//   static const signUp = 'sign_up';
//   static const forgotPassword = 'forgot_password';
//   static const verification = 'verification';
//   static const newPassword = 'new_password';
//   static const home = 'home';
//   static const productDetails = 'product_details';
//   static const brand = 'brand';
//   static const reviews = 'reviews';
//   static const addingReview = 'adding_review';
//
//   static GoRouter router = GoRouter(routes: [
//     GoRoute(
//       path: '/',
//       name: splash,
//       builder: (context, state) {
//         return const SplashScreen();
//       },
//       routes: [
//         GoRoute(
//             path: starter,
//             name: starter,
//             builder: (context, state) {
//               return const StarterScreen();
//             },
//             routes: [
//               GoRoute(
//                   path: startWith,
//                   name: startWith,
//                   builder: (context, state) {
//                     return const StartWithScreen();
//                   },
//                   routes: [
//                     GoRoute(
//                         path: signUp,
//                         name: signUp,
//                         builder: (context, state) {
//                           return const SignUpScreen();
//                         },
//                         routes: [
//                           GoRoute(
//                               path: "signIn",
//                               name: signIn,
//                               builder: (context, state) {
//                                 return  SignInScreen(email: state.uri.queryParameters["email"],);
//                               },
//                               routes: [
//                                 GoRoute(
//                                     path: forgotPassword,
//                                     name: forgotPassword,
//                                     builder: (context, state) {
//                                       return const ForgotPasswordScreen();
//                                     },
//                                     routes: [
//                                       GoRoute(
//                                           path: verification,
//                                           name: verification,
//                                           builder: (context, state) {
//                                             return const VerificationScreen();
//                                           },
//                                           routes: [
//                                             GoRoute(
//                                                 path: newPassword,
//                                                 name: newPassword,
//                                                 builder: (context, state) {
//                                                   return const NewPasswordScreen();
//                                                 })
//                                           ])
//                                     ]),
//                                 GoRoute(
//                                     path: "$home/:username",
//                                     name: home,
//                                     builder: (context, state) {
//                                       return HomeScreen(
//                                           username: state
//                                               .pathParameters['username']!);
//                                     },
//                                     routes: [
//                                       GoRoute(
//                                           path: "$brand/:brandImage",
//                                           name: brand,
//                                           builder: (context, state) {
//                                             return BrandScreen(
//                                                 brandImage: state
//                                                     .pathParameters['brandImage']!,
//                                                 productsEntity: state
//                                                     .extra as ProductsEntity);
//                                           }),
//                                       GoRoute(
//                                           path: "$productDetails/:totalPrice",
//                                           name: productDetails,
//                                           builder: (context, state) {
//                                             return ProductDetailsScreen(
//                                                 productEntity: state
//                                                     .extra as ProductEntity,
//                                                 totalPrice: state
//                                                     .pathParameters["totalPrice"]!);
//                                           },
//                                           routes: [
//                                             GoRoute(
//                                                 path: "$reviews/:productEntity/:totalRating",
//                                                 name: reviews,
//                                                 builder: (context, state) {
//                                                   return ReviewsScreen(
//                                                       productEntity: state
//                                                           .pathParameters["productEntity"]! as ProductEntity,
//                                                       totalRating: state
//                                                           .pathParameters["totalRating"]! as double);
//                                                 },
//                                                 routes: [
//                                                   GoRoute(
//                                                       path: "$addingReview/:productId",
//                                                       name: addingReview,
//                                                       builder: (context,
//                                                           state) {
//                                                         return AddingReviewScreen(
//                                                             productId: state
//                                                                 .pathParameters["productId"]!);
//                                                       })
//                                                 ])
//                                           ]),
//
//                                     ])
//                               ])
//                         ])
//                   ])
//             ]
//         )
//       ],
//     ),
//   ]);
// }