enum ResponseStatusLocalException {
  nullException(statusCode: 0),
  storageLoadDataException(statusCode: 0),
  storageSaveDataException(statusCode: 0),
  unknownException(statusCode: 0);

  final int statusCode;
  const ResponseStatusLocalException({required this.statusCode});
}

