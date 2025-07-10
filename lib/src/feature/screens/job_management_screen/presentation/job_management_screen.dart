import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/show_create_job_sheet.dart';

class JobManagementScreen extends StatelessWidget {
  const JobManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref,child) {
            return ElevatedButton(
              onPressed: () {
                showCreateJobSheet(context, ref);
              },
              child: Text('Show'),
            );
          },
        ),
      ),
    );
  }
}
