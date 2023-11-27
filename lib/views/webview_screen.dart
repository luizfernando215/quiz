// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Error connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;

    if (_connectionStatus != ConnectivityResult.none) {
      setState(() {
        _controller.future.then((webViewController) {
          webViewController.reload();
        });
      });
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 131, 22, 14), //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Pedidos Maza'),
      //   actions: <Widget>[
      //     NavigationControls(_controller.future),
      //     //Menu(_controller.future, () => _favorites),
      //   ],
      // ),
      body: _connectionStatus != ConnectivityResult.none
          ? SafeArea(
              child: WebView(
                initialUrl: 'https://www.cooxupe.com.br',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) async {
                  _controller.complete(webViewController);
                },
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SizedBox(
                      height: 480,
                      width: 480,
                      child: Lottie.asset(
                        'assets/animations/internet-wifi-off-data-off.json',
                        repeat: true,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Sem conexão com a Internet!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
              ],
            ),
      //floatingActionButton: _favoriteButton(),
    );
  }

  _favoriteButton() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              var url = await controller.data?.currentUrl();
              _favorites.add(url!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Página $url salva em favoritos.'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Icon(Icons.star),
          );
        }
        return Container();
      },
    );
  }
}

class Menu extends StatelessWidget {
  const Menu(this._webViewControllerFuture, this.favoritesAccessor);
  final Future<WebViewController> _webViewControllerFuture;
  final Function favoritesAccessor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _webViewControllerFuture,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (!controller.hasData) return Container();
        return PopupMenuButton<String>(
          onSelected: (String value) async {
            if (value == 'Favoritos') {
              var newUrl = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return FavoritesPage(favoritesAccessor());
              }));

              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              if (newUrl != null) controller.data?.loadUrl(newUrl);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            const PopupMenuItem<String>(
              value: 'Favoritos',
              child: Text('Favoritos'),
            ),
          ],
        );
      },
    );
  }
}

class FavoritesPage extends StatelessWidget {
  FavoritesPage(this.favorites);
  final Set<String> favorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: ListView(
          children:
              favorites.map((url) => ListTile(title: Text(url), onTap: () => Navigator.pop(context, url))).toList()),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture) : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady = snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady ? null : () => navigate(context, controller!, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady ? null : () => navigate(context, controller!, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller, {bool goBack = false}) async {
    bool canNavigate = goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nenhuma página ${goBack ? 'anterior' : 'posterior'}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
