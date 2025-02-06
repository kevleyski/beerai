#/bin/bash

echo "This is about to whack all your data in 3secs..."
sleep 3

neo4j stop
neo4j-admin database import full --overwrite-destination --verbose \
  --multiline-fields=true --nodes beer_styles.csv \
  --nodes=BarleyVariety=barley_varieties.csv --nodes=MaltSpecification=malt_specifications.csv \
  --nodes=Farm=farms.csv --nodes=FreightOption=freight_options.csv \
  --nodes=Maltster=maltsters.csv --nodes=MaltCoA=malt_coas.csv \
  --nodes=Origin=origins.csv \
  --relationships=Contains=relationships.csv \
  --relationships=ComesIn=freight_edges.csv \
  --relationships=IsMalt=malt_edges.csv

neo4j start