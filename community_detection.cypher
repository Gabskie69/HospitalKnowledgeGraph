// Algoritma Community Detection (Manual WCC Simulation)
// Digunakan untuk mengelompokkan node ke dalam klaster berdasarkan konektivitas
MATCH (n)
WHERE n:Country OR n:City OR n:Affiliation OR n:Hospital
OPTIONAL MATCH (n)-[*]-(m)
WITH n, collect(id(m)) AS cluster
RETURN n.name AS Name, 
       labels(n)[0] AS Type, 
       apoc.coll.min(cluster) AS CommunityID
ORDER BY CommunityID ASC;
