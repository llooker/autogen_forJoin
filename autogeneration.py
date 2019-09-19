import lookml as l 
import api as looker

conn = looker.lookerAPIClient()

sql = ''' 
SELECT COLUMN_NAME, DATA_TYPE FROM information_schema.COLUMNS 
WHERE TABLE_NAME = 'ORDER_ITEMS'
'''

udf = conn.run_sql(sql, 'test')

order_items_view = l.View('order_items').setSqlTableName(sql_table_name='public.order_items')

for row in udf:
    if row['DATA_TYPE'] == 'int' or row['DATA_TYPE'] == 'double':
        dim = l.Dimension(row['COLUMN_NAME']).setNumber()
        order_items_view + dim
    elif row['DATA_TYPE'] == 'timestamp':
        dim = l.DimensionGroup(row['COLUMN_NAME'])
        order_items_view + dim
 
print(order_items_view)