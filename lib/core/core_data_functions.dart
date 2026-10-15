import '../barrels/extensions_barrel.dart';

List<T> createEmptyList<T>({bool? nonGrowable}) => List<T>.empty(growable: nonGrowable?.invert ?? true);