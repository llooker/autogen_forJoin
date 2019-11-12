view: order_items {
sql_table_name: `public.order_items` ;;

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
    sql: ${TABLE}.`created_at` ;;
}

    
dimension: id {
    sql: ${TABLE}.`id` ;;
    type: string
}

    
filter: reporting_period {
    type: date
}

    
dimension: value {
    sql: ${TABLE}.`value` ;;
    type: string
}

    
measure: comparison_period_measure {
    type: count_distinct
    sql: 
          CASE 
           WHEN {% condition comparison_period %} ${created_at_raw} {% endcondition %} THEN ${id}
           ELSE NULL
          END
         ;;
}

    
measure: reporting_period_measure {
    type: count_distinct
    sql: CASE 
                     WHEN {% condition reporting_period %} ${created_at_raw} {% endcondition %} THEN ${id}
                     ELSE NULL
                    END
                     ;;
}

}
