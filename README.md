# Big_Data_Generator_To_Kafka

1.	Создать сервис, который с частотой в 1мс генерирует данные в формате:  (файл script.sh и generator)

  timestamp: unix timestamp
  bid_01: float – случайное число от 1 до 10
  bid_02: float – случайное число от 1 до 20
  …
  bid_50: float – случайное число от 1 до 500
  ask_01: float – случайное число от 1 до 10
  ask_02: float – случайное число от 1 до 20
  …
  ask_50: float – случайное число от 1 до 500
  stats: json – json со средним по всем bid и средним по всем ask

  Данные должны поступать в Apache Kafka.

2.	Создать интеграцию данных их Apache Kafka в Clickhouse - Файл configmap.92.source-connector.yaml

3.	Создать мониторинг на случай превышения значения 
  (ask_01 + bid_01) / 2 лимита 9.9   - 
  
  Приложены инструкции как это сделать на стороне Kafka кластера
  Также описано на офиц. сайте:
  https://www.gridgain.com/docs/latest/developers-guide/logging


