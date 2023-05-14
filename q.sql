
CREATE TABLE dependencies AS SELECT * FROM read_csv_auto('dependencies.csv');
CREATE TABLE keywords AS SELECT * FROM read_csv_auto('keywords.csv');
CREATE TABLE crates_keywords AS SELECT * FROM read_csv_auto('crates_keywords.csv');
CREATE TABLE crates AS SELECT * FROM read_csv_auto('crates.csv') where updated_at > (current_date() - (365*2));


select crates.name, dep.count, crates.downloads, crates.description, crates.updated_at
from keywords

inner join crates_keywords
on crates_keywords.keyword_id = keywords.id

inner join crates
on crates_keywords.crate_id = crates.id

inner join (select crate_id, count(*) as count from dependencies group by crate_id) as dep
on dep.crate_id = crates.id

where keywords.keyword like '%{{ keyword }}%'

order by dep.count desc
