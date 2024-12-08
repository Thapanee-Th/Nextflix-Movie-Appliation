// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_movie_appliation/app/detail_page.dart';
import 'package:nextflix_movie_appliation/blocs/common_bloc.dart';
import 'package:nextflix_movie_appliation/themes/dark_mode.dart';
import 'package:nextflix_movie_appliation/themes/light_mode.dart';
import 'blocs/data_bloc.dart';
import 'services/api_service.dart';

void main() {
  final Dio dio = Dio();
  final ApiService apiService = ApiService(dio);
  runApp(MyApp(apiService));
}

class MyApp extends StatefulWidget {
  final ApiService apiService;

  const MyApp(this.apiService, {super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // ValueNotifier to track the current theme
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Netflix Movie Application',
          themeMode: themeMode,
          theme: lightTheme, // Use light theme
          darkTheme: darkTheme, // Use dark theme
          initialRoute: '/',
          routes: {
            '/': (context) => BlocProvider(
                  create: (_) => DataBloc(widget.apiService),
                  child: HomePage(themeNotifier: _themeNotifier),
                ),
            '/details': (context) => DetailsPage(
                title: ModalRoute.of(context)?.settings.arguments as String),
          },
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const HomePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BLoC Dio Example')),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataInitialState) {
            return Center(child: Text('Press the button to load data.'));
          }
          if (state is DataLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataLoadedState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data[index]),
                  onTap: () {
                    // Navigate to DetailsPage with the tapped item's title
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: state.data[index],
                    );
                  },
                );
              },
            );
          }
          if (state is DataErrorState) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DataBloc>().add(LoadDataEvent());
        },
        child: Icon(Icons.refresh),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Toggle Theme'),
              trailing: Switch(
                value: themeNotifier.value == ThemeMode.dark,
                onChanged: (bool value) {
                  themeNotifier.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
