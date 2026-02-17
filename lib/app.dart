import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/screens/home_screen.dart';
import 'package:my_vehicles/screens/vehicle/vehicle_list_screen.dart';
import 'package:my_vehicles/screens/vehicle/vehicle_detail_screen.dart';
import 'package:my_vehicles/screens/vehicle/add_vehicle_screen.dart';
import 'package:my_vehicles/screens/vehicle/vehicle_info_screen.dart';
import 'package:my_vehicles/screens/emergency/breakdown_screen.dart';
import 'package:my_vehicles/screens/emergency/accident_screen.dart';
import 'package:my_vehicles/screens/emergency/stopped_screen.dart';
import 'package:my_vehicles/screens/service/service_history_screen.dart';
import 'package:my_vehicles/screens/service/add_service_screen.dart';
import 'package:my_vehicles/screens/mot/mot_history_screen.dart';
import 'package:my_vehicles/screens/mot/add_mot_screen.dart';
import 'package:my_vehicles/screens/profile/driver_profile_screen.dart';
import 'package:my_vehicles/screens/profile/profile_detail_screen.dart';
import 'package:my_vehicles/screens/profile/edit_profile_screen.dart';
import 'package:my_vehicles/screens/documents/documents_screen.dart';
import 'package:my_vehicles/screens/vehicle/breakdown_info_screen.dart';
import 'package:my_vehicles/screens/vehicle/recovery_info_screen.dart';
import 'package:my_vehicles/screens/vehicle/insurance_info_screen.dart';
import 'package:my_vehicles/screens/vehicle/purchase_info_screen.dart';
import 'package:my_vehicles/screens/vehicle/car_tax_info_screen.dart';
import 'package:my_vehicles/screens/settings/settings_screen.dart';
import 'package:my_vehicles/screens/settings/about_screen.dart';
import 'package:my_vehicles/theme/app_theme.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/vehicles',
      builder: (context, state) => const VehicleListScreen(),
    ),
    GoRoute(
      path: '/vehicle/:id',
      builder: (context, state) => VehicleDetailScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/add-vehicle',
      builder: (context, state) => const AddVehicleScreen(),
    ),
    GoRoute(
      path: '/edit-vehicle/:id',
      builder: (context, state) => AddVehicleScreen(
        editVehicleId: state.pathParameters['id'],
      ),
    ),
    GoRoute(
      path: '/vehicle-info/:id',
      builder: (context, state) => VehicleInfoScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/emergency/breakdown/:id',
      builder: (context, state) => BreakdownScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/emergency/accident/:id',
      builder: (context, state) => AccidentScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/emergency/stopped/:id',
      builder: (context, state) => StoppedScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/service-history/:vehicleId',
      builder: (context, state) => ServiceHistoryScreen(
        vehicleId: state.pathParameters['vehicleId']!,
      ),
    ),
    GoRoute(
      path: '/add-service/:vehicleId',
      builder: (context, state) => AddServiceScreen(
        vehicleId: state.pathParameters['vehicleId']!,
      ),
    ),
    GoRoute(
      path: '/edit-service/:vehicleId/:id',
      builder: (context, state) => AddServiceScreen(
        vehicleId: state.pathParameters['vehicleId']!,
        editEntryId: state.pathParameters['id'],
      ),
    ),
    GoRoute(
      path: '/mot-history/:vehicleId',
      builder: (context, state) => MOTHistoryScreen(
        vehicleId: state.pathParameters['vehicleId']!,
      ),
    ),
    GoRoute(
      path: '/add-mot/:vehicleId',
      builder: (context, state) => AddMOTScreen(
        vehicleId: state.pathParameters['vehicleId']!,
      ),
    ),
    GoRoute(
      path: '/edit-mot/:vehicleId/:id',
      builder: (context, state) => AddMOTScreen(
        vehicleId: state.pathParameters['vehicleId']!,
        editRecordId: state.pathParameters['id'],
      ),
    ),
    GoRoute(
      path: '/breakdown-info/:id',
      builder: (context, state) => BreakdownInfoScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/recovery-info/:id',
      builder: (context, state) => RecoveryInfoScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/insurance-info/:id',
      builder: (context, state) => InsuranceInfoScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/ownership-info/:id',
      builder: (context, state) => PurchaseInfoScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/car-tax-info/:id',
      builder: (context, state) => CarTaxInfoScreen(
        vehicleId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const DriverProfileScreen(),
    ),
    GoRoute(
      path: '/profile/:id',
      builder: (context, state) => ProfileDetailScreen(
        profileId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/edit-profile/:id',
      builder: (context, state) => EditProfileScreen(
        profileId: state.pathParameters['id'],
      ),
    ),
    GoRoute(
      path: '/documents',
      builder: (context, state) => const DocumentsScreen(),
    ),
    GoRoute(
      path: '/documents/:parentType/:parentId',
      builder: (context, state) => DocumentsScreen(
        parentType: state.pathParameters['parentType'],
        parentId: state.pathParameters['parentId'],
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);

class MyVehiclesApp extends StatelessWidget {
  const MyVehiclesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyVehicles',
      theme: AppTheme.light,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
