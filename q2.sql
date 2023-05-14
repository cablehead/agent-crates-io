
CREATE TABLE dependencies AS SELECT * FROM read_csv_auto('dependencies.csv');
CREATE TABLE crates AS SELECT * FROM read_csv_auto('crates.csv') where updated_at > (current_date() - (365*3));

select crates.id, crates.name, dep.count as dependents, crates.downloads, crates.description, crates.updated_at as last_updated
from crates

inner join (select crate_id, count(*) as count from dependencies group by crate_id) as dep
on dep.crate_id = crates.id

order by dep.count desc
