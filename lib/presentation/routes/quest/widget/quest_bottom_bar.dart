import 'package:flutter/material.dart';
import 'package:havayot/presentation/utils/app_localizations_extension.dart';
import 'package:havayot/presentation/widgets/hv_divider.dart';
import 'package:havayot/presentation/widgets/hv_theme.dart';

class QuestBottomBar extends StatelessWidget {
  const QuestBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = HvTheme.of(context);
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            HvDivider.horizontal(
              color: theme.primary2,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                context.l10n().quest_screen__bottom_title,
                style: theme.thin1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
