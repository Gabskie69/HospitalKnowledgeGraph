// Algoritma Degree Centrality
// Digunakan untuk mencari entitas (Negara, Kota, Afiliasi) yang paling berpengaruh
MATCH (n)-[r]-()
WHERE n:Country OR n:City OR n:Affiliation OR n:Hospital
RETURN n.name AS Name, 
       labels(n)[0] AS Type, 
       count(r) AS TotalConnections
ORDER BY TotalConnections DESC;
