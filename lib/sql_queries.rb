# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
  "
    select
      proj.title
    , sum(p.amount) as pledge_amount
    from
      projects proj
    left join
      pledges p on proj.id = p.project_id
    group by
      proj.title
    order by
      proj.title
  ;
  "
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"
  select
      u.name
    , u.age
    , sum(p.amount) as pledge_amt
  from
    pledges p
  left join users u on u.id = p.user_id
  group by
     u.name
   , u.age
  order by
    u.name
    ;
"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"
  select
    proj.title
  , (p.current_funding - proj.funding_goal) as amt_over_goal
  from
   projects proj
  join
     (select
       project_id
     , sum(amount) as current_funding
      from
       pledges
      group by
       project_id
     ) p on p.project_id = proj.id and p.current_funding >= proj.funding_goal
   ;
"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"
  select
    u.name
  , sum(p.amount) as pledge_amount
  from
    pledges p
  left join
    users u on u.id = p.user_id
  group by
    u.name
  order by
    2, 1
  ;
"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"
select
  proj.category
, p.amount
from
  pledges p
left join
  projects proj on proj.id = p.project_id
where
  category = 'music'
 ;
"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"
select
  proj.category
, sum(p.amount) as pledge_amount
from
 pledges p
left join
 projects proj on proj.id = p.project_id
where
 category = 'books'
group by
 proj.category
 ;
"
end
