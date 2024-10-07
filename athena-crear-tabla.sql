
/*Crear tabla en Athena quitando la primera fila
con localizacion de bucket S3*/


CREATE EXTERNAL TABLE IF NOT EXISTS `linkedin`.`KEYWORDS6` (
  `_id` varchar(50),
  `keyword` string COMMENT '50',
  `total` int,
  `fecha` varchar(50),
  `grupo` varchar(50)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = ',')
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://bucketprimerocarmen/linkedin2/'
TBLPROPERTIES (
  'classification' = 'csv',
  'skip.header.line.count' = '1'
);
