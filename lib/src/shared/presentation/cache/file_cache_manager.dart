import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FileCacheManager extends CacheManager {
  FileCacheManager._()
      : super(
          Config(
            _key,
            stalePeriod: Duration(days: _durationDays),
            maxNrOfCacheObjects: _maxFiles,
            fileService: HttpFileService(),
          ),
        );

  static const int _durationDays = 7;
  static const int _maxFiles = 100;
  static const _key = 'fileCache';

  static final instance = FileCacheManager._();
}
