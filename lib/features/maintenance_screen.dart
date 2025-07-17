import 'package:easy_localization/easy_localization.dart';

import '../core/exports.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.build_rounded,
                  color: AppColors.secondPrimary,
                  size: 100,
                ),
                const SizedBox(height: 32),
                Text(
                  'maintenance_mode_title'.tr(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'maintenance_mode_description'.tr(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CircularProgressIndicator(
                  color: AppColors.secondPrimary,
                  strokeWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
