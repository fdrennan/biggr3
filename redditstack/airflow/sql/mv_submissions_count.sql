create materialized view submissions_count as (
    select date_trunc('minute', time_collected_utc) as submission_collected, count(*) as n
    from public.submissions
    group by submission_collected
);
