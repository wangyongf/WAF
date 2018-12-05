import 'package:daily_purify/widget/simple_alert_dialog.dart';
import 'package:flutter/material.dart';

/// TODO: 向 Flutter 官方的控件看齐
/// TODO: 再写一个 single_choice_alert_dialog，参考：https://github.com/figengungor/easy_dialogs/blob/master/lib/single_choice_confirmation_dialog.dart
class UniversalAlertDialog<T> extends StatefulWidget {
  final T initialValue;
  final List<T> items;
  final Widget title;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry bodyPadding;
  final String semanticLabel;
  final SimpleWidgetBuilder<T> itemBuilder;
  final List<Widget> actions;
  final String cancelButtonLabel;
  final String okButtonLabel;
  final Color actionButtonLabelColor;
  final Widget divider;

  const UniversalAlertDialog(
      {Key key,
      this.initialValue,
      this.items,
      this.title,
      this.titlePadding,
      this.bodyPadding = const EdgeInsets.fromLTRB(0, 0, 0, 0),
      this.semanticLabel,
      @required this.itemBuilder,
      this.actions,
      this.cancelButtonLabel,
      this.okButtonLabel,
      this.actionButtonLabelColor,
      this.divider = const Divider(
        height: 0,
      )})
      : assert(itemBuilder != null),
        super(key: key);

  @override
  _UniversalAlertDialogState<T> createState() =>
      _UniversalAlertDialogState<T>();
}

class _UniversalAlertDialogState<T> extends State<UniversalAlertDialog<T>> {
  @override
  Widget build(BuildContext context) {
    return SimpleAlertDialog<T>(
      title: widget.title,
      titlePadding: widget.titlePadding,
      bodyPadding: widget.bodyPadding,
      semanticLabel: widget.semanticLabel,
      body: _buildBody(),
      actions: _buildActions(),
      divider: widget.divider,
    );
  }

  _buildBody() {
    // TODO: 在这里把 position 传下去吧
    return ListView(
      shrinkWrap: true,
      children: widget.items
          .map((item) => widget.itemBuilder != null
              ? widget.itemBuilder(context, item)
              : Text(item.toString()))
          .toList(),
    );
  }

  _buildActions() {
    return widget.actions ??
        <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: widget.actionButtonLabelColor ??
                  Theme.of(context).accentColor,
              child: Text(widget.cancelButtonLabel ?? '取消')),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              textColor: widget.actionButtonLabelColor ??
                  Theme.of(context).accentColor,
              child: Text(widget.okButtonLabel ?? '确定'))
        ];
  }
}
