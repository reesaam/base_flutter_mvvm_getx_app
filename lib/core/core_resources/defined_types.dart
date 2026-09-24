import 'package:dartz/dartz.dart';
export 'package:dartz/dartz.dart';

import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/services_barrel.dart';

// Responses
typedef BaseResponse<E extends GeneralException, T> = Either<E, T>;
typedef BaseAPIResponse<T> = BaseResponse<NetworkException, T>;
typedef BaseLocalResponse<T> = BaseResponse<LocalException, T>;

// Layout
typedef AdaptiveWidgetBuilder = Widget Function(BuildContext context, LayoutModel layout);
