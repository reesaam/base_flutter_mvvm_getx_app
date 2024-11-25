import 'package:flutter/material.dart';

Widget get shrinkSizedBox => const SizedBox.shrink();
Widget get shrinkOneExpanded => const Expanded(flex: 1, child: SizedBox.shrink());
Widget shrinkExpanded(int flex) => Expanded(flex: flex, child: const SizedBox.shrink());
