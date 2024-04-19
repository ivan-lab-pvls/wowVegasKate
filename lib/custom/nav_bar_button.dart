import 'package:flutter/cupertino.dart';

class NavBarButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool active;
  const NavBarButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: active ? onPressed : null,
      child: Text(
        title,
        style: active
            ? CupertinoTheme.of(context).textTheme.navActionTextStyle
            : CupertinoTheme.of(context).textTheme.navActionTextStyle.copyWith(
                  color: const Color.fromRGBO(70, 70, 73, 1),
                ),
      ),
    );
  }
}
