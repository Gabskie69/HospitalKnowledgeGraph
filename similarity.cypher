// Algoritma Jaccard Similarity (Manual Cypher)
// Digunakan untuk mengukur kemiripan antar Rumah Sakit berdasarkan lokasi dan afiliasi
MATCH (h1:Hospital)-[:LOCATED_IN|AFFILIATED_WITH]->(common)<-[:LOCATED_IN|AFFILIATED_WITH]-(h2:Hospital)
WHERE id(h1) < id(h2)
WITH h1, h2, count(common) AS intersection
MATCH (h1)-[:LOCATED_IN|AFFILIATED_WITH]->(t1)
WITH h1, h2, intersection, collect(id(t1)) AS s1
MATCH (h2)-[:LOCATED_IN|AFFILIATED_WITH]->(t2)
WITH h1, h2, intersection, s1, collect(id(t2)) AS s2
WITH h1, h2, intersection, apoc.coll.union(s1, s2) AS unionList
RETURN h1.name AS Hospital1, 
       h2.name AS Hospital2, 
       toFloat(intersection) / size(unionList) AS SimilarityScore
ORDER BY SimilarityScore DESC;
