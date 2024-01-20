import 'package:flutter/material.dart';

class HeroDialogRoute<T> extends PageRoute<T> {

  HeroDialogRoute (
  {
   required WidgetBuilder builder,
     RouteSettings? settings ,
  bool fullscreenDialog = false ,
   }): _builder = builder,
  super (settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;
  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.black54;
  @override
  bool get opaque => false ;
  @override
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => 'Popup dialog open';

  Widget buildTransitions(BuildContext context , Animation<double> animation, Animation<double> secondaryAnimation , Widget child){
    return child ;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return _builder(context);
  }

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 300);

}