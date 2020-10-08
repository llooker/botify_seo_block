view: export {
  sql_table_name: `@{SCHEMA_NAME}.export_*` ;;

  dimension: partition_month_string {
    type: string
    sql: REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d[A-Z][a-z][a-z]') ;;
  }

  dimension_group: partition {
    type: time
    sql: TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d\d\d\d\d')))  ;;
  }

  dimension: comment_count {
    type: number
    hidden: yes
    group_label: "HTML Extracts"
    sql: ${TABLE}.extract__comment_count ;;
  }

  measure: total_comment_count {
    type: sum
    group_label: "HTML Extracts"
    sql: ${comment_count} ;;
    drill_fields: [detail*]
  }

  measure: sum_estimated_revenue_from_organic_providers {
    type: sum
    group_label: "Visits"
    value_format: "$0.00"
    sql: ${estimated_revenue_from_organic_providers} ;;
    drill_fields: [detail*]
  }

  dimension: estimated_revenue_from_organic_providers {
    type: number
    hidden: yes
    sql: ${TABLE}.visits__organic__all__revenue ;;
  }

  measure: average__pages_per_session_for_organic_providers {
    type: average
    group_label: "Visits"
    value_format: "0.0"
    sql: ${avg__pages_per_session_for_organic_providers};;
    drill_fields: [detail*]
  }

  dimension: avg__pages_per_session_for_organic_providers {
    type: number
    hidden: yes
    sql: ${TABLE}.visits__organic__all__pages_per_session ;;
  }

  measure: average__session_duration_for_organic_providers {
    type: average
    value_format: "0s"
    group_label: "Visits"
    sql: ${avg__session_duration_for_organic_providers} ;;
    drill_fields: [detail*]
  }

  dimension: avg__session_duration_for_organic_providers {
    type: number
    hidden: yes
    sql: ${TABLE}.visits__organic__all__average_session_duration ;;
  }


  measure: average_bounce_rate_for_organic_providers {
    type: average
    value_format: "00.0"
    group_label: "Visits"
    sql: ${bounce_rate_for_organic_providers};;
    drill_fields: [detail*]
  }

  dimension: bounce_rate_for_organic_providers {
    type: number
    hidden: yes
    sql: ${TABLE}.visits__organic__all__bounce_rate ;;
  }

  # dimension_group: crawl {
  #   type: time
  #   timeframes: [
  #     raw,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.Crawl_Date ;;
  # }

  dimension_group: date_crawled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Date_Crawled ;;
  }

  dimension: delay_first_byte_received {
    type: number
    hidden: yes
    sql: ${TABLE}.delay_first_byte ;;
  }

  measure: avg_delay_first_byte_received {
    type: average
    value_format: "0"
    sql: ${delay_first_byte_received} ;;
    drill_fields: [detail*]
  }

  # dimension: delay_total {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.Delay_Total ;;
  # }

  # measure: avg_delay_total {
  #   type: average
  #   value_format: "0"
  #   sql: ${delay_total} ;;
  #   drill_fields: [detail*]
  # }

  dimension: depth {
    type: number
    sql: ${TABLE}.Depth ;;
  }

  dimension: depth_range {
    type: tier
    tiers: [0,1,2,3,4,5,6,7,8,9,10]
    style: integer
    sql: ${depth} ;;
  }

  dimension: google_crawls_range{
    type: tier
    tiers: [1,]
    style: integer
    sql: ${no__of_crawls_from_google__logs_} ;;
  }

  dimension: organic_visits_range{
    type: tier
    tiers: [1,]
    style: integer
    sql: ${no__of_visits_from_organic_providers} ;;
  }

  dimension: active_pages{
    type: yesno
    sql: ${no__of_visits_from_organic_providers}>1 ;;
  }

  dimension: first_h1 {
    type: string
    group_label: "Meta Tags"
    sql: ${TABLE}.metadata__h1__first ;;
  }

  dimension: full_url {
    type: string
    sql: ${TABLE}.url ;;
    link: {
      label: "Go to link."
      url: "{{value}}"
    }
  }

  dimension: h2__json_ {
    type: string
    group_label: "Meta Tags"
    sql: ${TABLE}.metadata__h2__list ;;
  }

  dimension: h3__json_ {
    type: string
    group_label: "Meta Tags"
    sql: ${TABLE}.metadata__h3__list ;;
  }

  dimension: http_status_code {
    type: number
    sql: ${TABLE}.http_code ;;
  }

  dimension: in_sitemap {
    type: yesno
    sql: ${TABLE}.sitemaps__present ;;
  }

  dimension: internal_pagerank {
    type: number
    hidden:  yes
    sql: ${TABLE}.internal_page_rank__value ;;
  }

  measure: sum_internal_pagerank {
    type: sum
    value_format: "0.0"
    sql: ${internal_pagerank} ;;
    drill_fields: [detail*]
  }

  dimension: internal_pagerank_position {
    type: number
    sql: ${TABLE}.internal_page_rank__position ;;
  }

  measure: avg_internal_pagerank_position {
    type: average
    value_format: "0.00"
    sql: ${internal_pagerank_position} ;;
    drill_fields: [detail*]
  }

  dimension: is_compliant {
    type: yesno
    sql: ${TABLE}.compliant__is_compliant ;;
  }

  dimension: main_image_url {
    type: string
    sql: ${TABLE}.main_image ;;
  }

  dimension: meta_description {
    type: string
    group_label: "Meta Tags"
    sql: ${TABLE}.metadata__description__content ;;
  }
# comment
  dimension: no__of_crawls_from_bing__logs_ {
    type: number
    sql: ${TABLE}.search_engines__bing__crawls__count ;;
  }

  measure: sum_no__of_crawls_from_bing__logs_ {
    type: sum
    sql: ${no__of_crawls_from_bing__logs_} ;;
    drill_fields: [detail*]
  }

  dimension: no__of_crawls_from_google__logs_ {
    type: number
    hidden:  yes
    sql: ${TABLE}.search_engines__google__crawls__count ;;
  }

  measure: sum_no__of_crawls_from_google__logs_ {
    type: sum
    sql: ${no__of_crawls_from_google__logs_} ;;
    drill_fields: [detail*]
  }

  dimension: no__of_internal_follow_inlinks__from_distinct_urls_ {
    type: number
    hidden: yes
    sql: ${TABLE}.inlinks_internal__nb__follow__unique ;;
  }

  measure: sum_no__of_internal_follow_inlinks__from_distinct_urls_ {
    type: sum
    sql: ${no__of_internal_follow_inlinks__from_distinct_urls_} ;;
    drill_fields: [detail*]
  }

  dimension: no__of_internal_follow_outlinks__to_distinct_urls_ {
    type: number
    hidden:  yes
    sql: ${TABLE}.outlinks_internal__nb__follow__unique ;;
  }

  measure: sum_no__of_internal_follow_outlinks__to_distinct_urls_ {
    type: sum
    sql: ${no__of_internal_follow_outlinks__to_distinct_urls_} ;;
    drill_fields: [detail*]
  }

  dimension: no__of_internal_no_follow_outlinks__to_distinct_urls_ {
    type: number
    hidden:  yes
    sql: ${TABLE}.outlinks_internal__nb__nofollow__unique ;;
  }

  measure: sum_no__of_internal_no_follow_outlinks__to_distinct_urls_ {
    type: sum
    sql: ${no__of_internal_no_follow_outlinks__to_distinct_urls_} ;;
    drill_fields: [detail*]
  }

  dimension: no__of_internal_outlinks__to_distinct_urls_ {
    type: number
    hidden:  yes
    sql: ${TABLE}.outlinks_internal__nb__unique ;;
  }

  measure: sum_no__of_internal_outlinks__to_distinct_urls_ {
    type: sum
    sql: ${no__of_internal_outlinks__to_distinct_urls_};;
    drill_fields: [detail*]
  }

  dimension: no__of_visits_from_organic_providers {
    type: number
    hidden: yes
    sql: ${TABLE}.visits__organic__all__nb ;;
  }

  measure: sum_no__of_visits_from_organic_providers {
    type: sum
    sql: ${no__of_visits_from_organic_providers} ;;
    drill_fields: [detail*]
  }

  dimension: no__of_visits_from_social_providers {
    type: number
    hidden: yes
    sql: ${TABLE}.visits__social__all__nb ;;
  }

  measure: sum_no__of_visits_from_social_providers {
    type: sum
    sql: ${no__of_visits_from_social_providers} ;;
    drill_fields: [detail*]
  }

  dimension: non_compliance_reason_is_bad_content_type {
    type: yesno
    group_label: "Non-Compliance Reasons"
    sql: ${TABLE}.compliant__reason__content_type ;;
  }

  dimension: non_compliance_reason_is_noindex_status {
    type: yesno
    group_label: "Non-Compliance Reasons"
    sql: ${TABLE}.compliant__reason__noindex ;;
  }

  dimension: non_compliance_reason_is_non_200_http_status_code {
    type: yesno
    group_label: "Non-Compliance Reasons"
    sql: ${TABLE}.compliant__reason__http_code ;;
  }

  dimension: non_compliance_reason_is_non_self_canonical_tag {
    type: yesno
    group_label: "Non-Compliance Reasons"
    sql: ${TABLE}.compliant__reason__canonical ;;
  }

  dimension: pagetype {
    type: string
    sql: ${TABLE}.segments__pagetype__value ;;
  }

  measure: post_count_in_archive {
    type: number
    group_label: "HTML Extracts"
    sql: ${TABLE}.extract__post_count_in_archive ;;
  }

  dimension: title {
    type: string
    group_label: "Meta Tags"
    sql: ${TABLE}.metadata__title__content ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [full_url,http_status_code]
  }
}
