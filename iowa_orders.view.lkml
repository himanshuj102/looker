view: iowa_orders {
  derived_table: {
    sql: SELECT
          orders.state as State,
          orders.city as order_city,
          orders.Category  AS orders_category,
          COUNT(*) AS orders_count
      FROM `looker_Demo.orders`
           AS orders
      WHERE orders.state = 'Iowa'
      GROUP BY
          1,2,3
      ORDER BY
          4 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: order_city {
    type: string
    sql: ${TABLE}.order_city ;;
  }

  dimension: orders_category {
    type: string
    sql: ${TABLE}.orders_category ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.orders_count ;;
  }

  set: detail {
    fields: [state, order_city, orders_category, orders_count]
  }
}
