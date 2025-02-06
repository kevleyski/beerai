# Beer AI
Open Source Graph Database of Beers and thier Ingredients

Raw data in Comma Separated Values for ease of manipulation and import into database engines like neo4j

neo4j example:
https://neo4j.com/docs/apoc/5/import/import-csv/


neo4j stop
neo4j-admin database import full --overwrite-destination \
  --multiline-fields=true --nodes beer_styles.csv \
  --nodes barley_varieties.csv --nodes malt_specifications.csv \
  --nodes farms.csv --nodes freight_options.csv \
  --nodes maltsters.csv --nodes malt_coas.csv \
  --nodes origins.csv \
  --relationships relationships.csv
neo4j start

MATCH (n)-[r]->(m) RETURN n, r, m