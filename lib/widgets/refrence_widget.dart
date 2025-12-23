import 'package:flutter/material.dart';

class ReferenceWidget extends StatelessWidget {
  const ReferenceWidget({Key? key,required this.number,required this.name}) : super(key: key);
  final String name,number;

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              number,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      );
  }
}
