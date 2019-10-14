##This is an autogenerated view created by python at 2019-10-14T09:37:32
view: order_items_base {
sql_table_name: "public.order_items" ;;
extension: required
filter: comparison_period {
    type: date
    sql: 
            ${created_at_raw}>= {% date_start comparison_period  %}
            AND ${created_at_raw} <= {% date_end reporting_period %}
         ;;
}

    
dimension_group: created_at {
    timeframes: [raw
    ,year
    ,quarter
    ,month
    ,week
    ,date
    ,day_of_week
    ,hour
    ,hour_of_day
    ,minute
    ,time
    ,time_of_day]
    type: time
    sql: ${TABLE}."created_at" ;;
    hidden: yes
}

    
dimension_group: delivered_at {
    timeframes: [raw
    ,year
    ,quarter
    ,month
    ,week
    ,date
    ,day_of_week
    ,hour
    ,hour_of_day
    ,minute
    ,time
    ,time_of_day]
    type: time
    sql: ${TABLE}."delivered_at" ;;
    hidden: yes
}

    
dimension: id {
    sql: ${TABLE}."id" ;;
    hidden: yes
    type: number
    primary_key: yes
}

    
dimension: inventory_item_id {
    sql: ${TABLE}."inventory_item_id" ;;
    hidden: yes
    type: number
}

    
dimension: order_id {
    sql: ${TABLE}."order_id" ;;
    hidden: yes
    type: number
}

    
filter: reporting_period {
    type: date
}

    
dimension_group: returned_at {
    timeframes: [raw
    ,year
    ,quarter
    ,month
    ,week
    ,date
    ,day_of_week
    ,hour
    ,hour_of_day
    ,minute
    ,time
    ,time_of_day]
    type: time
    sql: ${TABLE}."returned_at" ;;
    hidden: yes
}

    
dimension: sale_price {
    sql: ${TABLE}."sale_price" ;;
    hidden: yes
    type: number
}

    
dimension_group: shipped_at {
    timeframes: [raw
    ,year
    ,quarter
    ,month
    ,week
    ,date
    ,day_of_week
    ,hour
    ,hour_of_day
    ,minute
    ,time
    ,time_of_day]
    type: time
    sql: ${TABLE}."shipped_at" ;;
    hidden: yes
}

    
dimension: status {
    sql: ${TABLE}."status" ;;
    type: string
    hidden: yes
}

    
dimension: user_id {
    sql: ${TABLE}."user_id" ;;
    hidden: yes
    type: number
}

    
measure: comparison_period_measure {
    type: count
    sql: 
          CASE 
           WHEN {% condition comparison_period %} ${created_at_raw} {% endcondition %} THEN ${id}
           ELSE NULL
          END
         ;;
}

    
measure: reporting_period_measure {
    type: count
    sql: CASE 
                     WHEN {% condition reporting_period %} ${created_at_raw} {% endcondition %} THEN ${id}
                     ELSE NULL
                    END
                     ;;
}

}