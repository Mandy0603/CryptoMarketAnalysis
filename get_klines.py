import config, CryptoList
from binance import Client
import pyodbc
from datetime import datetime

# Connect to database
con=pyodbc.connect('Driver={SQL Server};'
                   f'Server={config.Server};'
                   f'Database={config.Database};'
                   'Trusted_Connection=yes;')

cursor=con.cursor()

# Connect to Binance
client = Client(config.API_KEY, config.API_SECRET)

frequencyList=[{"Interval":"4HOUR","Method":Client.KLINE_INTERVAL_4HOUR},
               {"Interval":"6HOUR","Method":Client.KLINE_INTERVAL_6HOUR},
               {"Interval":"8HOUR","Method":Client.KLINE_INTERVAL_8HOUR},
               {"Interval":"12HOUR","Method":Client.KLINE_INTERVAL_12HOUR},
               {"Interval":"1DAY","Method":Client.KLINE_INTERVAL_1DAY},
               {"Interval":"3DAY","Method":Client.KLINE_INTERVAL_3DAY}]

def insertKlineData(symbol,candlesticks, frequency,lastCandleOpenTime):
    tableName=symbol + "Kline" + frequency    
    for candlestick in candlesticks:
        if lastCandleOpenTime is None or candlestick[0]/ 1000> lastCandleOpenTime:
            cursor.execute("INSERT INTO " + tableName + " VALUES (" + "'"+
                        str(symbol)+ "'"+ ", " +
                        str(candlestick[0]/ 1000) + ", " +
                        str(candlestick[1]) + ", " +
                        str(candlestick[2]) + ", " +
                        str(candlestick[3]) + ", " +
                        str(candlestick[4]) + ", " +
                        str(candlestick[5]) + ", " +
                        str(candlestick[6]/ 1000) + ", " + "'"+
                        str(frequency)+ "'" +
                        ") " )

    con.commit()

def getLastCandelOpenTime(symbol,frequency):
    tableName=symbol + "Kline" + frequency    
    getLastCandleOpenTime="SELECT TOP 1 OpenTime FROM " + tableName + " ORDER BY OpenTime Desc"
    cursor.execute(getLastCandleOpenTime) 
    result=cursor.fetchone()
    if result is not None:
        return result[0]
    else:
        return None

def timestamp_to_custom_date(timestamp):
    date_obj = datetime.fromtimestamp(timestamp)
    return date_obj.strftime("%d %B, %Y")


def fetchAndInsertKlineData(symbol, frequency, BinanceMethod):
    lastCandleOpenTime=getLastCandelOpenTime(symbol,frequency)
    newCandlestartingDate =  "1 July, 2020"
    if lastCandleOpenTime is not None:
        newCandlestartingDate=timestamp_to_custom_date(lastCandleOpenTime)
    candlesticks = client.get_historical_klines(symbol, BinanceMethod, newCandlestartingDate)
    insertKlineData(symbol,candlesticks,frequency,lastCandleOpenTime)


def updateKlines():
    for symbol in CryptoList.symbolList:
        for frequency in frequencyList:
            fetchAndInsertKlineData(symbol, frequency["Interval"], frequency["Method"])


