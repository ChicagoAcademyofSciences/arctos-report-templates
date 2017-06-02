﻿SELECT collection.collection_cde, SUM(specimenPartCollObject.lot_count)

FROM
   collection,   
   cataloged_item,
   specimen_part,
   coll_object specimenPartCollObject

WHERE
  collection.institution_acronym LIKE 'CHAS' AND
  collection.collection_id=cataloged_item.collection_id (+) AND
  cataloged_item.collection_object_id=specimen_part.derived_from_cat_item (+) AND
  specimen_part.collection_object_id=specimenPartCollObject.collection_object_id (+)

GROUP BY collection.collection_cden_object_id (+)