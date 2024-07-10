import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key,});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme.labelLarge;
    return Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                const Spacer(),
                Column(
                  children: [
                    const AspectRatio(
                      aspectRatio: 1,
                      child: Placeholder(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              '** ℃',
                              style: textStyle?.copyWith(color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              '** ℃',
                              style: textStyle?.copyWith(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () { },
                              child: Text(
                                'Close',
                                style: textStyle?.copyWith(color: Colors.blue),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () { },
                              child: Text(
                                'Reload',
                                style: textStyle?.copyWith(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
