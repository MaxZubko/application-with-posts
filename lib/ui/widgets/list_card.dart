import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String? body;
  const ListCard({
    super.key,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          right: 15,
          top: 15,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
            if (body != null)
              Text(
                body!,
                style: theme.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
