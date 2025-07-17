{% macro check_season(month_value) %}
    CASE WHEN {{month_value}} IN (12,1,2) THEN 'WINTER'
         WHEN {{month_value}} IN (3,4,5) THEN 'SPRING'
         WHEN {{month_value}} IN (6,7,8) THEN 'SUMMER'
         ELSE 'AUTUMN'
    END
{% endmacro %}