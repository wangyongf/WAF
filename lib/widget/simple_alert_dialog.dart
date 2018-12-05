import 'package:daily_purify/util/list_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef SimpleWidgetBuilder<T> = Widget Function(BuildContext context, T item);

/// 一个简单的 AlertDialog
class SimpleAlertDialog<T> extends StatelessWidget {
  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final Widget body;
  final EdgeInsetsGeometry bodyPadding;
  final List<Widget> actions;
  final String semanticLabel;
  final Widget divider;
  final bool isDividerEnabled;

  const SimpleAlertDialog(
      {Key key,
      this.title,
      this.titlePadding,
      this.body,
      this.bodyPadding = const EdgeInsets.fromLTRB(24, 20, 24, 24),
      this.actions,
      this.semanticLabel,
      this.divider = const Divider(
        height: 0,
      ),
      this.isDividerEnabled = true})
      : assert(bodyPadding != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Semantics(
        namesRoute: true,
        label: _buildLabel(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTitle(context),
            _buildTitleDivider(),
            _buildBody(context),
            _buildActionsDivider(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  String _buildLabel(BuildContext context) {
    String label = semanticLabel;
    if (title == null) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          label = semanticLabel ??
              MaterialLocalizations.of(context)?.alertDialogLabel;
      }
    }
    return label;
  }

  /// 构造标题部分
  Widget _buildTitle(BuildContext context) {
    if (title == null) {
      return Container();
    } else {
      return Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(24, 24, 24, isDividerEnabled ? 20 : 0),
        child: DefaultTextStyle(
            style: Theme.of(context).textTheme.title,
            child: Semantics(
              child: title,
              namesRoute: true,
            )),
      );
    }
  }

  Widget _buildTitleDivider() {
    if (title != null && isDividerEnabled) {
      return divider;
    } else {
      return Container();
    }
  }

  Widget _buildBody(BuildContext context) {
    if (body == null) {
      return Container();
    }
    return Flexible(
        child: Padding(
      padding: bodyPadding,
      child: DefaultTextStyle(
          style: Theme.of(context).textTheme.subhead, child: body),
    ));
  }

  Widget _buildActionsDivider() {
    if (isDividerEnabled) {
      return divider;
    }
    return Container();
  }

  Widget _buildActions() {
    if (Lists.isEmpty(actions)) {
      return Container();
    }
    return ButtonTheme.bar(
      child: ButtonBar(
        children: actions,
      ),
    );
  }
}
