import 'package:dartz/dartz.dart';
export 'package:dartz/dartz.dart';

import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';

// Responses
typedef BaseResponseType<E extends GeneralException, T> = Either<E, T>;
typedef BaseResponse<T> = BaseResponseType<GeneralException, T>;
typedef BaseAPIResponse<T> = BaseResponseType<NetworkException, T>;
typedef BaseLocalResponse<T> = BaseResponseType<LocalException, T>;

// Layout
typedef AdaptiveWidgetBuilder = Widget Function(BuildContext context, LayoutModel layout);
