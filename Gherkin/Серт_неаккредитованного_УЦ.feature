Функция: Блокировка использования сертификата, выпущенного неаккредитованным УЦ
# отдельным файлом
    Контекст:
        Дано в организации есть сотрудник в роли <Роль>, который имеют право подписывать документы ЭП
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Сценарий: Подключение организации к ЭДО сертификатом, выпущенным неаккредитованным УЦ
        Дано пользователь вошел в систему
        Когда пользователь добавляет организацию
            И пользователь выбирает сертификат для подключения к ЭДО, выпущенный неаккредитованным УЦ
        Тогда пользователь видит системное уведомление "..." # указать уведомление о чем, сам текст указать в требованиях. # под капотом - помечает сертификат как "Недействительный"

    Структура сценария: Смена сертификата на новый, выпущенным неаккредитованным УЦ
        Дано сотрудник вошел в систему
        Когда сотрудник с ролью <Роль> выбирает организацию
            И сотрудник переходит в раздел сертификаты профиле сотрудника
            И сотрудник выбирает новый сертификат, выпущенный неаккредитованным УЦ
        Тогда сотрудник видит системное уведомление "..." # указать уведомление о чем, сам текст указать в требованиях. # под капотом - помечает сертификат как "Недействительный"
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

Функция: Уведомление сотрудника под колокольчик о недействительном сертификате
    @СвязаннаяЗадача https://track.astral.ru/soft/browse/EDO-8530
    @СвязанноеОписание https://track.astral.ru/soft/wiki/pages/viewpage.action?pageId=3803284055
    Контекст:
        Дано в организации есть сотрудник в роли <Роль>, который имеют право подписывать документы ЭП
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Уведомление сотрудника под колокольчик о недействительном сертификате
        Дано сотрудник вошел в систему
            И у сотрудника в организации выбран сертификат, выпущенный неаккредитованным УЦ
            И у сотрудника в организации нет уведомлений о недействительности сертификата
        Когда сотрудник с ролью <Роль> выбирает организацию
        Тогда сотрудник видит что в список уведомлений под колокольчик добавляется уведомление о недействительности сертификата
# --- в тех.требования
            И красная точка на колокольчике
            И число сообщений у колокольчика увеличилось
            И заголовок уведомления: "Выбранный сертификат недействительный"
            И текст уведомления соответствует шаблону: """Сертификат недействительный: 
            {Наименование организации}, номер: {Номер сертификата}, {Наименование УЦ}, срок действия до: {Срок действия до} УЦ, 
            выдавший сертификат, утратил аккредитацию: {Наименование УЦ}, {ИНН}, {ОРГН}"""
# ---
            И у сотрудника есть возможность перейти к выбору сертификата
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |
    
Функция: Уведомление сотрудника в разделе "Сертификаты" о недействительном сертификате
    @СвязаннаяЗадача https://track.astral.ru/soft/browse/EDO-8747
    @СвязанноеОписание https://track.astral.ru/soft/wiki/pages/viewpage.action?pageId=3803284561
    Контекст:
        Дано в организации есть сотрудник в роли <Роль>, который имеют право подписывать документы ЭП
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Отображение в разделе "Сертификаты" недействительного сертификата
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
            И сотрудник перешел в профиле сотрудника
        Когда сотрудник переходит в раздел сертификаты
        Тогда сотрудник видит статус сертификата "Недействительный"
            И сотрудник видит помеченные красным цветом поля "Наименование сертификата" и "Статус"
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

Функция: Ограничение работы сотрудника в реестре "Документы" при недействительном сертификате
    @СвязаннаяЗадача https://track.astral.ru/soft/browse/EDO-5689
    @СвязанноеОписание https://track.astral.ru/soft/wiki/pages/viewpage.action?pageId=3785982437
    Контекст:
        Дано Дано в организации есть сотрудник в роли <Роль>, который имеют право подписывать документы ЭП
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |
            И сотрудник входит в систему
            И выбирает организацию

    Структура сценария: Ограничение работы с документом ИЗ РЕЕСТРА "Документы"-"Входящие"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Входящие"
            И сотрудник открывает документ
            И сотрудник наводит курсор на одну из пассивных кнопок доступных операций, требующих подписание ЭП # указать возможные кнопки
        Тогда сотрудник видит тултип "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Ограничение работы с документом ИЗ РЕЕСТРА "Документы"-"Исходящие"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Исходящие"
            И сотрудник открывает документ
            И сотрудник видит пассивные кнопки # уточнить какие
            И сотрудник наводит курсор на одну из пассивных кнопок доступных операций, требующих подписание ЭП # указать возможные кнопки
        Тогда сотрудник видит тултип "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Ограничение работы с документом ИЗ РЕЕСТРА "Документы"-"Черновики"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Черновики"
            И сотрудник открывает документ
            И сотрудник видит пассивные кнопки # уточнить какие
            И сотрудник наводит курсор на одну из пассивных кнопок доступных операций, требующих подписание ЭП # указать возможные кнопки
        Тогда сотрудник видит тултип "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Ограничение работы с документом В РЕЕСТРЕ "Документы"-"Черновики"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Черновики"
            И сотрудник видит пассивные кнопки # уточнить какие
            И сотрудник наводит курсор на одну из пассивных кнопок доступных операций, требующих подписание ЭП # указать возможные кнопки
        Тогда сотрудник видит тултип "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Ограничение работы при массовом выделении документов В РЕЕСТРЕ "Документы"-"Черновики"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Черновики"
            И сотрудник выбирает документы в списке документов
            И сотрудник видит справа от "Выбрано ... Всего ..." пассивную кнопку "..." # уточнить какие
            И сотрудник наводит курсор на одну из пассивных кнопок доступных операций, требующих подписание ЭП # указать возможные кнопки
        Тогда сотрудник видит тултип "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Ограничение работы сотрудника при создании черновика с помощью редактора В РЕЕСТРЕ "Документы"-"Черновики"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Черновики"
            И сотрудник добавляет документ
            И сотрудник пытается отправить документ
        Тогда сотрудник видит уведомление "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
            И сотрудник сохраняет документ в редакторе
            И сотрудник видит черновик документа в реестре "Черновики". Поле видимости документа ограничивается учетной записью сотрудника
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |

    Структура сценария: Ограничение работы сотрудника при редактировании черновика с помощью редактора В РЕЕСТРЕ "Документы"-"Черновики"
        Дано сотрудник вошел в систему
            И сотрудник с ролью <Роль> выбрал организацию
            И у сотрудника выбран сертификат, выпущенный неаккредитованным УЦ
        Когда сотрудник переходит в реестр "Документы"-"Черновики"
            И сотрудник редактирует документ
            И сотрудник пытается отправить документ
        Тогда сотрудник видит уведомление "О ..." # "Не удалось определить наличие действующего сертификата" # поправить текст тултипа
            И сотрудник сохраняет документ в редакторе
            И сотрудник видит черновик документа в реестре "Черновики". Поле видимости документа ограничивается учетной записью сотрудника
        Примеры: 
            |Роль                       |
            |Сотрудник с правом подписи |
            |Администратор              |
            |Владелец                   |
            