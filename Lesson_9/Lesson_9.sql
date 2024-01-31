-- 2

SELECT P1.FirstName FirstName,
       P1.LastName LastName,
       P2.FirstName Father_FirstName,
       P2.LastName Father_LastName
  FROM People P1
  JOIN People P2 ON P1.ID_Father = P2.ID
 WHERE P1.LastName = 'Дмитриев';
