import lookml_gen as l 

#############################
# Example 2. Custom LookML patterns
############################
order_items = l.View('order_items')

order_items + 'id' + 'value' + l.DimensionGroup('created_at')

order_items.setSqlTableName('public.order_items')

order_items.addComparisonPeriod(order_items.id, order_items.created_at, measure_type='count_distinct')

print(order_items)
