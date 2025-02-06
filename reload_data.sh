#/bin/bash

echo "This is about to whack all your data in 3secs..."
sleep 3

neo4j stop
neo4j-admin database import full --overwrite-destination --verbose \
  --multiline-fields=true --nodes=BeerStyle=beer_styles.csv \
  --nodes=BarleyVariety=barley_varieties.csv --nodes=MaltSpecification=malt_specifications.csv \
  --nodes=Farm=farms.csv --nodes=FreightOption=freight_options.csv \
  --nodes=Maltster=maltsters.csv --nodes=MaltCoA=malt_coas.csv \
  --nodes=Origin=origins.csv \
  --nodes=Fermentable=fermentables.csv \
  --relationships=Produces=maltster_products_edges.csv \
  --relationships=ArrivesOn=freight_edges.csv \
  --relationships=MaltProduct=malt_edges.csv \
  --relationships=Pedigree=barley_pedigree_edges.csv \
  --relationships=GrownAt=malt_farm_edges.csv \
  --relationships=Origin=farm_origin_edges.csv \
  --relationships=Origin=beer_style_origin_edges.csv \
  --relationships=TypicallyHas=beer_style_typically_contains_edges.csv

neo4j start