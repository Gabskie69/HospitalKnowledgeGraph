MATCH (n)-[r]-()
RETURN n.name AS Name, 
       labels(n)[0] AS Type, 
       count(r) AS TotalConnections
ORDER BY TotalConnections DESC
LIMIT 10
