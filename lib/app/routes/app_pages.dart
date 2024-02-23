import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/views/category_edit.dart';
import 'package:learn_getx/app/modules/category/views/category_show.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/bottom_menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom_menu/views/bottom_menu_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/invoice/bindings/invoice_binding.dart';
import '../modules/invoice/views/invoice_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
        name: _Paths.UpdateCategory,
        page: () => UpdateCategory(category: Get.arguments)),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => BottomMenuView(),
      binding: BottomMenuBinding(),
    ),
    GetPage(
        name: _Paths.DetailCategory,
        page: () => ShowCategoryView(
              category: Get.arguments,
            ))
  ];
}
