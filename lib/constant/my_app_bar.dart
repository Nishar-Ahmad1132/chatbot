// // import 'package:chatgpt/widgets/theme_switch.dart';
// import 'package:flutter/material.dart';
// import '../provider/theme_provider.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         'Flutter GPT',
//         style: TextStyle(
//           color: Theme.of(context).colorScheme.onPrimary,
//         ),
//       ),
//       actions: [
//         Row(
//           children: [
//             Consumer(
//               builder: (context, ref, child) => Icon(
//                 ref.watch(activeThemeProvider) == Themes.dark
//                     ? Icons.dark_mode
//                     : Icons.light_mode,
//               ),
//             ),
//             const SizedBox(width: 8),
//             // const ThemeSwitch(),
//           ],
//         )
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(60);
// }
