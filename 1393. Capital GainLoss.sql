-- https://leetcode.com/problems/capital-gainloss/
WITH total_buy_price AS(
    SELECT stock_name, SUM(price) AS buy_price
    FROM Stocks
    WHERE operation='Buy'
    GROUP BY stock_name
),
total_sell_price AS(
    SELECT stock_name, SUM(price) AS sell_price
    FROM Stocks
    WHERE operation='Sell'
    GROUP BY stock_name
)
SELECT buy.stock_name, sell_price-buy_price AS capital_gain_loss
FROM total_buy_price buy
INNER JOIN total_sell_price sell ON buy.stock_name=sell.stock_name

