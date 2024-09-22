# Практика 3 Столяров ЭФБО-01-22 22T0318
### Тема: список стрижек в парикмахерской
Предположим, что с сервера приходят данные в формате JSON. Вручную создадим его и поместим по пути /static/Services.json.
Также добавим все необходимые фотографии (также в папку static), ведь при выборе стрижки крайне важна визуальная часть.
В файлe pubsec.yaml добавим пункт assets во flutter:
<code>
flutter:
  assets:
    - static/
</code>
### Зависимости
<p>
  Для хранения данных используется JSON. Для сериализации нужна библиотека json_serializable:
</p>
<p>
  <code>flutter pub add json_annotation dev:build_runner dev:json_serializable</code>
</p>
<p>
  <code>flutter pub get</code>
</p>
<p>
  <code>dart run build_runner watch --delete-conflicting-outputs</code>
</p>
