import 'package:flutter/material.dart';

typedef Builder<T> = Widget Function(BuildContext context, T data);

class BetterFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final T initialData;
  final Builder<T> builder;
  final Builder<T> loadingBuilder;
  final Builder<Object> errorBuilder;

  Widget defaultLoadingBuilder(BuildContext context, T data) {
    return CircularProgressIndicator();
  }

  Widget defaultErrorBuilder(BuildContext context, Object error) {
    return Text('$error');
  }

  BetterFutureBuilder(
      {@required this.future,
      @required this.builder,
      Key key,
      this.initialData,
      this.loadingBuilder,
      this.errorBuilder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // 请求失败，显示错误
          if (snapshot.hasError) {
            return errorBuilder == null
                ? defaultErrorBuilder(context, snapshot.error)
                : errorBuilder(context, snapshot.error);
          }
          return builder(context, snapshot.data);
        }
        // 请求未结束，显示loading,`snapshot.data`为`initialData`
        return loadingBuilder == null
            ? defaultLoadingBuilder(context, snapshot.data)
            : loadingBuilder(context, snapshot.data);
      },
    );
  }
}
