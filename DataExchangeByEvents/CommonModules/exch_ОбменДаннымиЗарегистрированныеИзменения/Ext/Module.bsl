﻿Функция ПакетЗарегистрированныхИзменений(УзелДляОбмена, НомерСообщения = Неопределено) Экспорт	
	ДляОтправки = Не ЗначениеЗаполнено(НомерСообщения);
	ТекстЗапроса = exch_ОбменДаннымиПовтИсп.ТекстЗапросаВыброркиЗарегистрированныхИзменений(УзелДляОбмена, ДляОтправки);
	Запрос = Новый Запрос(ТекстЗапроса);
	Запрос.УстановитьПараметр("УзелДляОбмена", УзелДляОбмена);
	Если Не ДляОтправки Тогда
		Запрос.УстановитьПараметр("НомерСообщения", НомерСообщения);
	КонецЕсли;
	Возврат Запрос.ВыполнитьПакет();	  
КонецФункции

Функция СтруктураРегистрацииОбъекта(РезультатЗапроса) Экспорт
	СтруктураОбъекта = Новый Структура;
	Для Каждого Колонка Из РезультатЗапроса.Колонки Цикл
		СтруктураОбъекта.Вставить(Колонка.Имя, Неопределено);
	КонецЦикла;
	
	Возврат СтруктураОбъекта;
КонецФункции

Процедура УстановитьЗначенияОтборов(Набор, СтруктураОтборов)
	Для Каждого Реквизит Из СтруктураОтборов Цикл
		Если Реквизит.Ключ = "ТипОбъекта" Тогда
			Продолжить;
		КонецЕсли;
		
		Набор.Отбор[Реквизит.Ключ].Установить(Реквизит.Значение);		
	КонецЦикла;
КонецПроцедуры

Функция НаборЗаписей(СтруктураОтборов) Экспорт
	Если СтрНайти(СтруктураОтборов.ТипОбъекта, "РегистрСведений.") = 1 Тогда
		Набор = РегистрыСведений[Метаданные.НайтиПоПолномуИмени(СтруктураОтборов.ТипОбъекта).Имя].СоздатьНаборЗаписей();		
	ИначеЕсли СтрНайти(СтруктураОтборов.ТипОбъекта, "РегистрНакопления.") = 1 Тогда
		Набор = РегистрыНакопления[Метаданные.НайтиПоПолномуИмени(СтруктураОтборов.ТипОбъекта).Имя].СоздатьНаборЗаписей();		
	ИначеЕсли СтрНайти(СтруктураОтборов.ТипОбъекта,"РегистрБухгалтерии.") = 1 Тогда
		Набор = РегистрыБухгалтерии[Метаданные.НайтиПоПолномуИмени(СтруктураОтборов.ТипОбъекта).Имя].СоздатьНаборЗаписей();		
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
	УстановитьЗначенияОтборов(Набор, СтруктураОтборов);
	Возврат Набор;
КонецФункции

Функция ДанныеРегистрации(СтруктураОтборов) Экспорт
	//в состав обмена могут входить либо ссылочные типы
	//либо наборы регитров сведений, накопления и бухгалтерии
	//
	//могут быть еще Константы, но на данный момент считаем их исключением
	ДанныеРегистрации = Неопределено;
	
	Если exch_ОбменДаннымиПовтИсп.ЭтоМетаданныеСсылочногоТипаПовтИсп(СтруктураОтборов.ТипОбъекта) Тогда
		ДанныеРегистрации = СтруктураОтборов.Ссылка;
	Иначе
		ДанныеРегистрации = НаборЗаписей(СтруктураОтборов);
	КонецЕсли;	
	
	Возврат ДанныеРегистрации;
КонецФункции