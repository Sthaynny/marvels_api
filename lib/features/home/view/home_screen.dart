import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel viewModel;
  @override
  void initState() {
    viewModel = widget.viewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nomeAppString)),
      body: SingleChildScrollView(child: Column(children: [
        
      ],
    )),
    );
  }
}
