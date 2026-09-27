enum ResponseStatusLocalException {
  nullException(statusCode: 400),
  storageLoadDataException(statusCode: 400),
  storageSaveDataException(statusCode: 400),
  unknownException(statusCode: 400);

  final int statusCode;
  const ResponseStatusLocalException({required this.statusCode});
}

