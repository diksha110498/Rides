import 'export.dart';
import 'home_module/view/vehicle_detail.dart';
 class AppPagesView{
   final homeRoute=homeroute;

   final List<GetPage> appages=[
    GetPage(name: homeroute, page:()=> HomeScreen(),
        binding: HomeBinding()),
     GetPage(name: homeDetailRoute, page:()=> VehicleDetailScreen(),
        binding: HomeBinding())
  ];
}