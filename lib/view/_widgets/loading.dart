import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            Text(
              "Aguarde, carregando...",
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.headline6?.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
