import 'package:go_router/go_router.dart';
import 'package:laza_app/core/screens/splash_screen.dart';
import 'package:laza_app/core/screens/starter_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/cart_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/new_password_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/start_with_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/verification_screen.dart';
import 'package:laza_app/features/auth/presentation/pages/wishlist_screen.dart';
import 'package:laza_app/features/products/data/models/brands_model.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';
import 'package:laza_app/features/products/presentation/pages/adding_review_screen.dart';
import 'package:laza_app/features/products/presentation/pages/brand_screen.dart';
import 'package:laza_app/features/products/presentation/pages/brands_screen.dart';
import 'package:laza_app/features/products/presentation/pages/home_screen.dart';
import 'package:laza_app/features/products/presentation/pages/product_details_screen.dart';
import 'package:laza_app/features/products/presentation/pages/reviews_screen.dart';
import 'package:laza_app/features/products/presentation/pages/search_screen.dart';

class MyRouter1 {
  static const splash = '/';
  static const starter = 'starter';
  static const startWith = 'start_with';
  static const signIn = 'sign_in';
  static const signUp = 'sign_up';
  static const resetPassword = 'reset_password';
  static const forgotPassword = 'forgot_password';
  static const verification = 'verification';
  static const newPassword = 'new_password';
  static const home = 'home';
  static const search = 'search';
  static const brands = 'brands';
  static const productDetails = 'product_details';
  static const brand = 'brand';
  static const reviews = 'reviews';
  static const addingReview = 'adding_review';
  static const wishList = 'wishList';
  static const cart = 'cart';

  static GoRouter router = GoRouter(
      routes: [
    GoRoute(
      path: '/',
      name: splash,
      builder: (context, state) {
        return const SplashScreen();
      },
      routes: [
        GoRoute(
            path: starter,
            name: starter,
            builder: (context, state) {
              return const StarterScreen();
            },
            routes: [
              GoRoute(
                  path: startWith,
                  name: startWith,
                  builder: (context, state) {
                    return const StartWithScreen();
                  },
                  routes: [
                    GoRoute(
                        path: signUp,
                        name: signUp,
                        builder: (context, state) {
                          return const SignUpScreen();
                        },
                        routes: [
                          GoRoute(
                              path: signIn,
                              name: signIn,
                              builder: (context, state) {
                                return SignInScreen(
                                  email: state.uri.queryParameters["email"],
                                );
                              },
                              routes: [
                                GoRoute(
                                    path: forgotPassword,
                                    name: forgotPassword,
                                    builder: (context, state) {
                                      return const ForgotPasswordScreen();
                                    },
                                ),//forgotPassword
                                GoRoute(
                                    path: verification,
                                    name: verification,
                                    builder: (context, state) {
                                      return const VerificationScreen();
                                    },
                                    routes: [
                                      GoRoute(
                                        path: newPassword,
                                        name: newPassword,
                                        builder: (context, state) {
                                          return const NewPasswordScreen();
                                        },

                                      )
                                    ])

                              ])
                        ])
                  ])
            ]),
        GoRoute(
            path: home,
            name: home,
            builder: (context, state) {
              return const HomeScreen();
            },
            routes: [
              GoRoute(
                path: search,
                name: search,
                builder: (context, state) {
                  return const SearchScreen();
                },
              ),//search
              GoRoute(
                  path: cart,
                  name: cart,
                  builder: (context, state) {
                    return const CartScreen();
                  }),//cart
              GoRoute(
                path: resetPassword,
                name: resetPassword,
                builder: (context, state) {
                  return const ResetPasswordScreen();
                },
              ),//resetPassword
              GoRoute(
                  path: wishList,
                  name: wishList,
                  builder: (context, state) {
                    return const WishlistScreen();
                  }),//wishList
              GoRoute(
                  path: brands,
                  name: brands,
                  builder: (context, state) {
                    return BrandsScreen(brands: state.extra as BrandsModel);
                  },
              ),//brands
              GoRoute(
                path: "$brand/:brandImage",
                name: brand,
                builder: (context, state) {
                  return BrandScreen(
                      brandImage:
                      state.pathParameters[
                      'brandImage']!,
                      productsEntity: state.extra
                      as ProductsEntity);
                },

              ),//brand
              GoRoute(
                  path: productDetails,
                  name: productDetails,
                  builder: (context, state) {
                    return ProductDetailsScreen(
                      productEntity:
                      state.extra as ProductEntity,
                    );
                  },
                  routes: [
                    GoRoute(
                        path: reviews,
                        name: reviews,
                        builder: (context, state) {
                          return ReviewsScreen(
                            productEntity: state.extra
                            as ProductEntity,
                          );
                        },
                        routes: [
                          GoRoute(
                              path: addingReview,
                              name: addingReview,
                              builder:
                                  (context, state) {
                                return AddingReviewScreen(
                                  productEntity: state
                                      .extra
                                  as ProductEntity,
                                );
                              })
                        ])
                  ]),//product


            ])
      ],
    ),
  ]);
}
