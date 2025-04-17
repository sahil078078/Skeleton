// ///! Next Screen
// Future<T?>? nextScreen<T>({
//   required String path,
//   dynamic arguments,
//   int? id,
//   bool preventDuplicates = true,
//   Map<String, String>? parameters,
// }) async {
//   return await Get.toNamed(
//     path,
//     id: id,
//     arguments: arguments,
//     parameters: parameters,
//     preventDuplicates: preventDuplicates,
//   );
// }

// //! BackScreen
// void backScreen<T>({
//   T? result,
//   bool closeOverlays = false,
//   bool canPop = true,
//   int? id,
// }) {
//   Get.back(
//     id: id,
//     result: result,
//     closeOverlays: closeOverlays,
//     canPop: canPop,
//   );
// }

// //! PushAndReplace
// Future<T?>? pushNReplace<T>({
//   required String path,
//   dynamic arguments,
//   bool preventDuplicates = true,
//   Map<String, String>? parameters,
//   int? id,
// }) async {
//   return await Get.offNamed(
//     path,
//     id: id,
//     arguments: arguments,
//     preventDuplicates: preventDuplicates,
//     parameters: parameters,
//   );
// }

// //! PushAndRemoveUntil
// Future<T?>? pushNRemoveUntil<T>({
//   required String path,
//   bool Function(Route<dynamic>)? predicate,
//   dynamic arguments,
//   Map<String, String>? parameters,
//   int? id,
// }) async {
//   return await Get.offNamedUntil(
//     path,
//     predicate ?? (_) => false,
//     arguments: arguments,
//     parameters: parameters,
//     id: id,
//   );
// }

// //offAllNamed
// Future<T?>? offAllNamed<T>({
//   required String path,
//   bool Function(Route<dynamic>)? predicate,
//   dynamic arguments,
//   Map<String, String>? parameters,
//   int? id,
// }) async {
//   return await Get.offAllNamed(
//     path,
//     arguments: arguments,
//     parameters: parameters,
//     predicate: predicate ?? (_) => false,
//     id: id,
//   );
// }

// //!replace the current route but still keep adding to the navigation stack
// Future<T?>? offAndTo<T>({
//   required String path,
//   dynamic arguments,
//   Map<String, String>? parameters,
//   int? id,
// }) async {
//   return await Get.offAndToNamed(
//     path,
//     arguments: arguments,
//     parameters: parameters,
//     id: id,
//   );
// }

// //! OPEN GETx DIALOG
// Future<T?> openGetDialog<T>({
//   required Widget child,
//   bool barrierDismissible = false,
//   Color? barrierColor,
// }) {
//   return Get.dialog(
//     child,
//     barrierDismissible: barrierDismissible,
//     transitionCurve: Curves.linearToEaseOut,
//     barrierColor: barrierColor ?? Constants.instance.black,
//     useSafeArea: true,
//   );
// }

// //! BOTTOM SHIT

// Future<T?> openBottomShit<T>({
//   required Widget child,
//   bool isDismissible = true,
//   Color? barrierColor,
//   bool? ignoreSafeArea,
//   RouteSettings? settings,
//   bool readySetup = false,
//   String? title,
//   TextStyle? style,
// }) =>
//     Get.bottomSheet(
//       backgroundColor: Constants.instance.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//       elevation: 0.75,
//       isDismissible: isDismissible,
//       barrierColor: barrierColor,
//       ignoreSafeArea: ignoreSafeArea,
//       settings: settings,
//       readySetup
//           ? SizedBox(
//               width: double.maxFinite,
//               child: Padding(
//                 padding: Constants.instance.popupPadding,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox.shrink(),
//                         Text(
//                           "$title",
//                           style: style ?? AppTextStyle.medium.copyWith(fontSize: 15, color: Constants.instance.black),
//                         ),
//                         CustomCloseBtn(size: 25),
//                       ],
//                     ),
//                     Constants.instance.square,
//                     child,
//                   ],
//                 ),
//               ),
//             )
//           : child,
//     );
