USE Crypto
GO

---Create Procedure to create tables
IF OBJECT_ID('CreateKlineTable', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE CreateKlineTable;
END;
GO

CREATE PROCEDURE CreateKlineTable
    @Symbol NVARCHAR(10),
	@Frequency NVARCHAR(10)
AS
BEGIN
	DECLARE @TableName NVARCHAR(30);
    DECLARE @SqlQuery NVARCHAR(MAX);

	SET @TableName = @Symbol +'Kline' + @Frequency;
    SET @SqlQuery = 'CREATE TABLE ' + QUOTENAME(@TableName) + ' ('
                    -- Add column definitions here
					+ 'Symbol nvarchar(10),'
                    + 'OpenTime BIGINT PRIMARY KEY,'
					+ 'OpenPrice float,'
					+ 'HighPrice float,'
					+ 'LowPrice float,'
					+ 'ClosePrice float,'
					+ 'Volumn float,'
					+ 'CloseTime BIGINT,'
					+ 'Frequency nvarchar(8)'
                    + ');';

    EXEC sp_executesql @SqlQuery;
END

---Create tables

EXEC CreateKlineTable @Symbol = 'BTCUSDT', @Frequency='3DAY';
EXEC CreateKlineTable @Symbol = 'BTCUSDT', @Frequency='1DAY';
EXEC CreateKlineTable @Symbol = 'BTCUSDT', @Frequency='6HOUR';
EXEC CreateKlineTable @Symbol = 'BTCUSDT', @Frequency='4HOUR';
EXEC CreateKlineTable @Symbol = 'BTCUSDT', @Frequency='8HOUR';
EXEC CreateKlineTable @Symbol = 'BTCUSDT', @Frequency='12HOUR';

EXEC CreateKlineTable @Symbol = 'ETHUSDT', @Frequency='3DAY';
EXEC CreateKlineTable @Symbol = 'ETHUSDT', @Frequency='1DAY';
EXEC CreateKlineTable @Symbol = 'ETHUSDT', @Frequency='6HOUR';
EXEC CreateKlineTable @Symbol = 'ETHUSDT', @Frequency='4HOUR';
EXEC CreateKlineTable @Symbol = 'ETHUSDT', @Frequency='8HOUR';
EXEC CreateKlineTable @Symbol = 'ETHUSDT', @Frequency='12HOUR';


EXEC CreateKlineTable @Symbol = 'DOGEUSDT', @Frequency='3DAY';
EXEC CreateKlineTable @Symbol = 'DOGEUSDT', @Frequency='1DAY';
EXEC CreateKlineTable @Symbol = 'DOGEUSDT', @Frequency='6HOUR';
EXEC CreateKlineTable @Symbol = 'DOGEUSDT', @Frequency='4HOUR';
EXEC CreateKlineTable @Symbol = 'DOGEUSDT', @Frequency='8HOUR';
EXEC CreateKlineTable @Symbol = 'DOGEUSDT', @Frequency='12HOUR';

EXEC CreateKlineTable @Symbol = 'LTCUSDT', @Frequency='3DAY';
EXEC CreateKlineTable @Symbol = 'LTCUSDT', @Frequency='1DAY';
EXEC CreateKlineTable @Symbol = 'LTCUSDT', @Frequency='6HOUR';
EXEC CreateKlineTable @Symbol = 'LTCUSDT', @Frequency='4HOUR';
EXEC CreateKlineTable @Symbol = 'LTCUSDT', @Frequency='8HOUR';
EXEC CreateKlineTable @Symbol = 'LTCUSDT', @Frequency='12HOUR';

---Drop Tables

DROP TABLE BTCUSDTKline3DAY
DROP TABLE BTCUSDTKline1DAY
DROP TABLE BTCUSDTKline6HOUR

DROP TABLE DOGEUSDTKline3DAY
DROP TABLE DOGEUSDTKline1DAY
DROP TABLE DOGEUSDTKline6HOUR

DROP TABLE ETHUSDTKline3DAY
DROP TABLE ETHUSDTKline1DAY
DROP TABLE ETHUSDTKline6HOUR

DROP TABLE LTCUSDTKline3DAY
DROP TABLE LTCUSDTKline1DAY
DROP TABLE LTCUSDTKline6HOUR

---Create views to provide data to power bi

CREATE VIEW v_







