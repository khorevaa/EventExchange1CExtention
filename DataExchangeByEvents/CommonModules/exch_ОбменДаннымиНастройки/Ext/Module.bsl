﻿Функция КлючНастроек() Экспорт
	Возврат exch_ОбменДаннымиПовтИсп.КлючНастроек();
КонецФункции

Функция СтруктураНастроек() Экспорт
	Возврат exch_ОбменДаннымиПовтИсп.СтруктураНастроек();
КонецФункции

Функция Настройки() Экспорт
	ключ = КлючНастроек();
	значение = ХранилищеОбщихНастроек.Загрузить(
			ключ,
			ключ,
			Неопределено,
			""
	);
		
	настройки = СтруктураНастроек();
	Если ЗначениеЗаполнено(значение) Тогда
		ЗаполнитьЗначенияСвойств(настройки, значение);
	КонецЕсли;
		
	Возврат настройки;
КонецФункции

Процедура СохранитьНастройки(настройки) Экспорт
	ключ = КлючНастроек();
	ХранилищеОбщихНастроек.Сохранить(
			ключ,
			ключ,
			настройки,
			Неопределено,
			""
	);	
КонецПроцедуры

Функция ИмяСвойстваУзлыПолучателиСобытия() Экспорт
	Возврат "exch_ПолучателиСобытияОбмена";
КонецФункции

Функция НаименованиеФоновогоЗаданияОтправкиДанных() Экспорт
	Возврат "exch_ФоноваяОтправкаСообщенийВОчередь";
КонецФункции

Функция НаименованиеФоновогоЗаданияЧтенияСообщений() Экспорт
	Возврат "exch_ФоноваяЧтениеСообщенийИзОчереди";
КонецФункции

Функция НастройкиУзла(УзелОбмена) Экспорт
	Возврат exch_ОбменДаннымиПовтИсп.НастройкиУзла(УзелОбмена);
КонецФункции

Функция СтруктураНастроекУзла() Экспорт
	Возврат Новый Структура(
				"ИмяОчередиВходящихСообщений, 
				|ИмяОчередиИсходящихСообщений,
				|АдресСервера,
				|Порт,
				|VHost,
				|Exchange,
				|Пользователь,
				|Пароль,
				|Таймаут"
			);
КонецФункции