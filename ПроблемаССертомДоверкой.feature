Функция: У сотрудника проблема с сертификатом/доверенностью
    Контекст:
    Дано <Сотрудник> выбрал организацию

    Примеры:
    | Сотрудник                     |
    | Сотрудник с правом подписи    |
    | Владелец                      |

    Примеры:
    | Реестр                        |
    | Контрагенты - Мои контрагенты |
    | Контрагенты - Приглашения     |
    | Контрагенты - Черный список   |
    | Мои организации               |

    Примеры:
    | Проблема                  | Текст уведомления                                         |
    | Проблема с сертификатом   | "Не удалось определить наличие действующего сертификата." |
    | Проблема с доверенностью  | "Не удалось определить наличие действующей доверенности." |

    Примеры:
    | Выбрать               |
    | Выбрать сертификат    |
    | Выбрать доверенность  |

    Сценарий: Сотрудник получает уведомление о проблеме с сертификатом/доверенностью
    Дано у <Сотрудник> <Проблема>
    Когда <Сотрудник> прошел в <Реестр>
    Тогда Система отображает уведомление <Текст уведомления>
        И Система отображает кнопку <Выбрать>

    Сценарий: Сотрудник переходит в свой профиль
    Дано у <Сотрудник> <Проблема>
    Когда <Сотрудник> нажимает кнопку <Выбрать>
    Тогда Система открывает Профиль сотрудника

    Сценарий: Сотрудник возвращается обратно
    Дано у <Сотрудник> <Проблема>
    Когда <Сотрудник> завершает редактирование профиля
    Тогда Система открывает предыдущее окно до перехода в профиль сотрудника