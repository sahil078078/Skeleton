
// //! Next Screen
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

// //! OPEN GETx DIALOG

// Future<T?> openGetDialog<T>(
//   Widget child, {
//   bool barrierDismissible = false,
// }) {
//   return Get.dialog(
//     child,
//     barrierDismissible: barrierDismissible,
//     transitionCurve: Curves.linearToEaseOut,
//     barrierColor: Constants.instance.black.withOpacity(0.8).withAlpha(170),
//     useSafeArea: true,
//   );
// }
