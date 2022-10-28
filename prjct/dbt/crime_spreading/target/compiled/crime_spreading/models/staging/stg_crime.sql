with source as (
    select * from "postgres"."public"."crime"
),
final as (
    select 
        btrim(lower(regexp_replace(state, ',', '', 'g'))) as state_name
        , btrim(regexp_replace(lower(regexp_replace(city, ',', '', 'g')), 'st\.', 'saint')) as city_name
        , coalesce(population, 0) as population
        , murder_and_nonnegligent_manslaughter
        , coalesce(forcible_rape, 0) as forcible_rape
        , robbery
        , coalesce(aggravated_assault, 0) as aggravated_assault
        , coalesce(burglary, 0) as burglary
        , coalesce(larceny_theft, 0) as larceny_theft
        , coalesce(motor_vehicle_theft, 0) as motor_vehicle_theft
        , coalesce(arson, 0) as arson
        , year
    from source
    where city is not null
)
select * from final