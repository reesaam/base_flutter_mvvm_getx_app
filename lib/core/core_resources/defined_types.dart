export 'package:dartz/dartz.dart';

import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

// Responses
typedef BaseResponseType<E extends CoreException?, T> = Either<E?, T>;
typedef BaseResponse<T> = BaseResponseType<CoreException?, T>;
typedef BaseAPIResponse<T> = BaseResponseType<NetworkException?, T>;
typedef BaseLocalResponse<T> = BaseResponseType<LocalException?, T>;

// Layout
typedef AdaptiveWidgetBuilder = Widget Function(BuildContext context, LayoutModel layout);
