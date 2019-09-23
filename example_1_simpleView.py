import lookml_gen as l 

############################
# Example 1. Setting up the Looker View with 2 dimensions, id, value and dimnension group, created_at
############################
order_items = l.View('order_items')

order_items + 'id' + 'value' + l.DimensionGroup('created_at')

order_items.setSqlTableName('public.order_items')

print(order_items)
