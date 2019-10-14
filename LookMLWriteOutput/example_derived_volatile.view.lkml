##This is an autogenerated view created by python at 2019-10-14T15:25:05
view: example_derived_volatile {
derived_table: {
    sql: 
SELECT
    EAV_data.schema_id
    , EAV_data.entity_id
    , MAX(CASE WHEN EAV_data.column_name = 'What_is_your_favorite_product' THEN EAV_data.column_value ELSE null END) AS "What_is_your_favorite_product"
, MAX(CASE WHEN EAV_data.column_name = 'discount_rate' THEN EAV_data.column_value ELSE null END) AS "discount_rate"
, MAX(CASE WHEN EAV_data.column_name = 'Rate_your_customer_experience_on_a_scale_from_0_to_10_where_10_is_best' THEN EAV_data.column_value ELSE null END) AS "Rate_your_customer_experience_on_a_scale_from_0_to_10_where_10_is_best"
, MAX(CASE WHEN EAV_data.column_name = 'We_are_your_favorite_brand' THEN EAV_data.column_value ELSE null END) AS "We_are_your_favorite_brand"
, MAX(CASE WHEN EAV_data.column_name = 'gross_margin' THEN EAV_data.column_value ELSE null END) AS "gross_margin"
, MAX(CASE WHEN EAV_data.column_name = 'Where_do_you_purchase_the_majority_of_your_clothing' THEN EAV_data.column_value ELSE null END) AS "Where_do_you_purchase_the_majority_of_your_clothing"
, MAX(CASE WHEN EAV_data.column_name = 'purchase_date' THEN EAV_data.column_value ELSE null END) AS "purchase_date"
, MAX(CASE WHEN EAV_data.column_name = 'item_count' THEN EAV_data.column_value ELSE null END) AS "item_count"
, MAX(CASE WHEN EAV_data.column_name = 'mall_location_name' THEN EAV_data.column_value ELSE null END) AS "mall_location_name"
, MAX(CASE WHEN EAV_data.column_name = 'retail_price' THEN EAV_data.column_value ELSE null END) AS "retail_price"
, MAX(CASE WHEN EAV_data.column_name = 'What_is_your_montly_budget_for_spend_on_clothing' THEN EAV_data.column_value ELSE null END) AS "What_is_your_montly_budget_for_spend_on_clothing"
, MAX(CASE WHEN EAV_data.column_name = 'product_categories' THEN EAV_data.column_value ELSE null END) AS "product_categories"
, MAX(CASE WHEN EAV_data.column_name = 'number_on_sale' THEN EAV_data.column_value ELSE null END) AS "number_on_sale"
, MAX(CASE WHEN EAV_data.column_name = 'zip_code' THEN EAV_data.column_value ELSE null END) AS "zip_code"
, MAX(CASE WHEN EAV_data.column_name = 'items_ordered' THEN EAV_data.column_value ELSE null END) AS "items_ordered"
, MAX(CASE WHEN EAV_data.column_name = 'sale_price' THEN EAV_data.column_value ELSE null END) AS "sale_price"
, MAX(CASE WHEN EAV_data.column_name = 'cost' THEN EAV_data.column_value ELSE null END) AS "cost"
, MAX(CASE WHEN EAV_data.column_name = 'store_outlet' THEN EAV_data.column_value ELSE null END) AS "store_outlet"
, MAX(CASE WHEN EAV_data.column_name = 'Do_you_plan_to_purchase_clothing_as_a_gift_this_year' THEN EAV_data.column_value ELSE null END) AS "Do_you_plan_to_purchase_clothing_as_a_gift_this_year"
FROM profservices_scratch.LR$H2W42B5EBFK26PU9ZQJHE_base_eav_data as EAV_data
        GROUP BY 1,2
 ;;
    }
extension: required
dimension: Do_you_plan_to_purchase_clothing_as_a_gift_this_year {
    sql: ${TABLE}."Do_you_plan_to_purchase_clothing_as_a_gift_this_year" ;;
    required_access_grants: [eid_8]
    type: string
    hidden: yes
}

    
dimension: Rate_your_customer_experience_on_a_scale_from_0_to_10_where_10_is_best {
    sql: ${TABLE}."Rate_your_customer_experience_on_a_scale_from_0_to_10_where_10_is_best" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_5]
}

    
dimension: We_are_your_favorite_brand {
    sql: ${TABLE}."We_are_your_favorite_brand" ;;
    required_access_grants: [eid_6]
    type: string
    hidden: yes
}

    
dimension: What_is_your_favorite_product {
    sql: ${TABLE}."What_is_your_favorite_product" ;;
    required_access_grants: [eid_6]
    type: string
    hidden: yes
}

    
dimension: What_is_your_montly_budget_for_spend_on_clothing {
    sql: ${TABLE}."What_is_your_montly_budget_for_spend_on_clothing" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_5]
}

    
dimension: Where_do_you_purchase_the_majority_of_your_clothing {
    sql: ${TABLE}."Where_do_you_purchase_the_majority_of_your_clothing" ;;
    required_access_grants: [eid_8]
    type: string
    hidden: yes
}

    
dimension: cost {
    sql: ${TABLE}."cost" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_4]
}

    
dimension: discount_rate {
    sql: ${TABLE}."discount_rate" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_7]
}

    
dimension: entity_id {
    sql: ${TABLE}."entity_id" ;;
    type: string
}

    
dimension: gross_margin {
    sql: ${TABLE}."gross_margin" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_7]
}

    
dimension: item_count {
    sql: ${TABLE}."item_count" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_2]
}

    
dimension: items_ordered {
    sql: ${TABLE}."items_ordered" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_4]
}

    
dimension: mall_location_name {
    sql: ${TABLE}."mall_location_name" ;;
    required_access_grants: [eid_3]
    type: string
    hidden: yes
}

    
dimension: number_on_sale {
    sql: ${TABLE}."number_on_sale" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_4]
}

    
dimension: product_categories {
    sql: ${TABLE}."product_categories" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_4]
}

    
dimension: purchase_date {
    sql: ${TABLE}."purchase_date" ;;
    required_access_grants: [eid_3]
    type: string
    hidden: yes
}

    
dimension: retail_price {
    sql: ${TABLE}."retail_price" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_7]
}

    
dimension: sale_price {
    sql: ${TABLE}."sale_price" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_4]
}

    
dimension: schema_id {
    sql: ${TABLE}."schema_id" ;;
    type: string
}

    
dimension: store_outlet {
    sql: ${TABLE}."store_outlet" ;;
    required_access_grants: [eid_2]
    type: string
    hidden: yes
}

    
dimension: zip_code {
    sql: ${TABLE}."zip_code" ;;
    type: number
    hidden: yes
    required_access_grants: [eid_3]
}

    
measure: total_Do_you_plan_to_purchase_clothing_as_a_gift_this_year {
    sql: Do_you_plan_to_purchase_clothing_as_a_gift_this_year ;;
    type: sum
    required_access_grants: [eid_8]
}

    
measure: total_Rate_your_customer_experience_on_a_scale_from_0_to_10_where_10_is_best {
    sql: Rate_your_customer_experience_on_a_scale_from_0_to_10_where_10_is_best ;;
    type: sum
    required_access_grants: [eid_5]
}

    
measure: total_We_are_your_favorite_brand {
    sql: We_are_your_favorite_brand ;;
    type: sum
    required_access_grants: [eid_6]
}

    
measure: total_What_is_your_favorite_product {
    sql: What_is_your_favorite_product ;;
    type: sum
    required_access_grants: [eid_6]
}

    
measure: total_What_is_your_montly_budget_for_spend_on_clothing {
    sql: What_is_your_montly_budget_for_spend_on_clothing ;;
    type: sum
    required_access_grants: [eid_5]
}

    
measure: total_Where_do_you_purchase_the_majority_of_your_clothing {
    sql: Where_do_you_purchase_the_majority_of_your_clothing ;;
    type: sum
    required_access_grants: [eid_8]
}

    
measure: total_cost {
    sql: cost ;;
    type: sum
    required_access_grants: [eid_4]
}

    
measure: total_discount_rate {
    sql: discount_rate ;;
    type: sum
    required_access_grants: [eid_7]
}

    
measure: total_gross_margin {
    sql: gross_margin ;;
    type: sum
    required_access_grants: [eid_7]
}

    
measure: total_item_count {
    sql: item_count ;;
    type: sum
    required_access_grants: [eid_2]
}

    
measure: total_items_ordered {
    sql: items_ordered ;;
    type: sum
    required_access_grants: [eid_4]
}

    
measure: total_mall_location_name {
    sql: mall_location_name ;;
    type: sum
    required_access_grants: [eid_3]
}

    
measure: total_number_on_sale {
    sql: number_on_sale ;;
    type: sum
    required_access_grants: [eid_4]
}

    
measure: total_product_categories {
    sql: product_categories ;;
    type: sum
    required_access_grants: [eid_4]
}

    
measure: total_purchase_date {
    sql: purchase_date ;;
    type: sum
    required_access_grants: [eid_3]
}

    
measure: total_retail_price {
    sql: retail_price ;;
    type: sum
    required_access_grants: [eid_7]
}

    
measure: total_sale_price {
    sql: sale_price ;;
    type: sum
    required_access_grants: [eid_4]
}

    
measure: total_store_outlet {
    sql: store_outlet ;;
    type: sum
    required_access_grants: [eid_2]
}

    
measure: total_zip_code {
    sql: zip_code ;;
    type: sum
    required_access_grants: [eid_3]
}

}