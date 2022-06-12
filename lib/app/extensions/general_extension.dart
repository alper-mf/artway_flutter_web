enum BaseModelStatus { ok, error, action, unprocessableEntity, timeOut, notFound, found }

/// [LoadingStatus] Enumun durumlarını kontrol etmek için yazıldı

/// [BaseModelStatus] Enumun durumlarını kontrol etmek için yazıldı
extension BaseModelStatusExtension on BaseModelStatus {
  get isOk => this == BaseModelStatus.ok;

  get isAction => this == BaseModelStatus.action;

  get isError => this == BaseModelStatus.error;

  get isUnprocessableEntity => this == BaseModelStatus.unprocessableEntity;

  get isTimeOut => this == BaseModelStatus.timeOut;

  get isNotFound => this == BaseModelStatus.notFound;
  get isFound => this == BaseModelStatus.found;
}
