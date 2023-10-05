USE Crypto
GO

INSERT INTO Ticker VALUES 
	('BTCUSDT','BTC','Bitcoin','https://coinicons-api.vercel.app/api/icon/btc'),
	('ETHUSDT','ETH','Ethereum','https://coinicons-api.vercel.app/api/icon/eth'),
	('DOGEUSDT','DOGE','Dogecoin','https://coinicons-api.vercel.app/api/icon/doge'),
	('LTCUSDT','LTC','Litecoin','https://coinicons-api.vercel.app/api/icon/doge')

DELETE FROM BTCUSDTKline3DAY
DELETE FROM BTCUSDTKline1DAY
DELETE FROM BTCUSDTKline6HOUR

DELETE FROM DOGEUSDTKline3DAY
DELETE FROM DOGEUSDTKline1DAY
DELETE FROM DOGEUSDTKline6HOUR

DELETE FROM ETHUSDTKline3DAY
DELETE FROM ETHUSDTKline1DAY
DELETE FROM ETHUSDTKline6HOUR

DELETE FROM LTCUSDTKline3DAY
DELETE FROM LTCUSDTKline1DAY
DELETE FROM LTCUSDTKline6HOUR