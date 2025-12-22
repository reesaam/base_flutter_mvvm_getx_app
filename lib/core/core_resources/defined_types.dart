import 'package:dartz/dartz.dart';
export 'package:dartz/dartz.dart';

import '../../components/failures/local_exception.dart';
import '../../components/failures/network_exception.dart';
export '../../components/failures/general_exception.dart';
export '../../components/failures/network_exception.dart';

typedef BaseResponse<E extends GeneralException, T> = Either<E, T>;
typedef BaseAPIResponse<T> = BaseResponse<NetworkException, T>;
typedef BaseLocalResponse<T> = BaseResponse<LocalException, T>;
