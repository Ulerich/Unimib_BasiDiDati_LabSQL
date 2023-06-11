USE universita;

-- Query 1
SELECT s.valore, d.Nome, d.Cognome, c.Nome
FROM stipendio AS s JOIN personale_docente AS d ON s.classe = d.Classe_stipendio
	JOIN corso AS c ON d.Matricola_d = c.Docente
WHERE d.Ruolo = 'Ordinario';

-- Query 2
SELECT C.Nome, (C.Ore_lezione + C.Ore_esercitazione) AS Ore_Totali
FROM corso AS C JOIN corso_di_laurea_corsi AS CDLC ON C.Codice_C = CDLC.Codice_c
	JOIN corso_di_laurea AS CDL ON CDLC.idCorso_di_Laurea = CDL.idCorso_di_Laurea
WHERE CDL.Tipologia = 'Triennale';

-- Query 3
SELECT C.Nome, E.Voto, E.Data
FROM corso AS C JOIN esame AS E ON C.Codice_C = E.Codice_corso
	JOIN studente AS S ON E.Matricola_studente = S.Matricola_st
WHERE S.nome = 'Andrea' AND S.cognome = 'Pizzo';

-- Query 4
SELECT C.nome, E.voto
FROM corso AS C JOIN esame AS E ON C.Codice_C = E.Codice_corso;

-- Query 5
SELECT DISTINCT C.nome, C.crediti_lezione + C.crediti_esercitazione AS Crediti
FROM esame AS E JOIN corso AS C ON E.Codice_corso = C.Codice_c
	JOIN corso_di_laurea_corsi AS CDLC ON C.Codice_c = CDLC.Codice_c
	JOIN corso_di_laurea AS CDL ON CDLC.idCorso_di_Laurea = CDL.idCorso_di_Laurea
WHERE E.Codice_corso IS NOT NULL AND CDL.Tipologia = 'Triennale';

-- Query 6
SELECT S.Nome, 
	   S.Cognome, 
       S.Matricola_st, 
       citta.Nome
FROM corso AS C JOIN piano_di_studio AS P ON C.Codice_c = P.Codice_corso
JOIN studente AS S ON P.Matricola_st = S.Matricola_st
JOIN citta ON S.Citta_residenza = citta.idCitta
WHERE C.Nome = 'Analisi Matematica';

-- Query 7 Da Completare
SELECT D.Nome, 
	   D.Cognome,
       D.Matricola_d,
       citta.Nome
FROM (corso_di_laurea AS CDL JOIN corso_di_laurea_corsi AS CDLC 
	ON CDL.idCorso_di_Laurea = CDLC.idCorso_di_Laurea
	JOIN corso AS C ON CDLC.Codice_c = C.Codice_c
	JOIN Personale_docente AS D ON C.Docente = D.Matricola_d
	JOIN stipendio ON D.Classe_stipendio = stipendio.Classe)
	JOIN citta ON D.Citta_di_residenza = citta.idCitta
WHERE CDL.Tipologia = 'Triennale' AND stipendio.Valore >= 40000 
	AND (D.ruolo = 'Ordinario' OR D.ruolo = 'Associato');

-- Query 8
SELECT S.Nome, 
	   S.Cognome, 
       S.Matricola_st, 
       citta.Nome
FROM corso_di_laurea AS CDL JOIN corso_di_laurea_corsi AS CDLC 
	ON CDL.idCorso_di_Laurea = CDLC.idCorso_di_Laurea
    JOIN corso AS C ON CDLC.Codice_c = C.Codice_c
    JOIN esame AS e ON C.Codice_c = e.Codice_corso
	JOIN studente AS S ON e.Matricola_studente = S.Matricola_st
	JOIN citta ON S.Citta_residenza = citta.idCitta
WHERE C.Nome = 'Analisi Matematica' AND citta.Regione = 'PIEMONTE' 
	AND CDL.Tipologia = 'Triennale';

-- Query 9
-- Stilare una classifica degli studenti (con cognome, nome, matricola e voto) che hanno sostenuto
-- l'esame con codice E3101Q117 con un voto maggiore di 23, ordinandola per voto decrescente

SELECT s.Cognome,
	   s.Nome,
       s.Matricola_st,
       e.Voto
FROM studente AS s JOIN esame AS e ON s.Matricola_st = e.Matricola_studente
	JOIN corso AS c ON e.Codice_corso = c.Codice_c
WHERE c.Codice_c = 'E3101Q117' AND e.voto > 23
ORDER BY e.Voto DESC;

-- Query 10
SELECT COUNT(*) AS StudentiVotoSup23
FROM studente AS s JOIN esame AS e ON s.Matricola_st = e.Matricola_studente
	JOIN corso AS c ON e.Codice_corso = c.Codice_c
WHERE c.Codice_c = 'E3101Q117' AND e.voto > 23;

-- Query 11
SELECT s.Matricola_st, s.nome, s.cognome,
	   AVG(e.voto) AS MediaEsami
FROM studente AS s JOIN esame AS e ON s.Matricola_st = e.Matricola_studente
	JOIN corso AS c ON e.Codice_corso = c.Codice_c
GROUP BY s.Matricola_st, s.nome, s.cognome
ORDER BY MediaEsami DESC;

-- Query 12
SELECT s.Matricola_st, s.nome, s.cognome, COUNT(e.Codice_e) AS EsamiSvolti
FROM studente AS s JOIN esame AS e ON s.Matricola_st = e.Matricola_studente
WHERE s.nome LIKE 'B%'
GROUP BY s.Matricola_st;

-- Query 13
(SELECT s.nome, s.cognome, s.Matricola_st
FROM studente AS s JOIN esame AS e ON s.Matricola_st = e.Matricola_studente
	JOIN corso AS c ON e.Codice_corso = c.Codice_c
WHERE c.Codice_c = 'E3101Q020')
UNION
(SELECT s1.nome, s1.cognome, s1.Matricola_st
FROM studente AS s1 JOIN esame AS e1 ON s1.Matricola_st = e1.Matricola_studente
	JOIN corso AS c1 ON e1.Codice_corso = c1.Codice_c
WHERE c1.Codice_c = 'E31010Q117');
-- Ricordati di rinominare le tabelle del secondo argomento diversamente

-- Query 14
SELECT s.Cognome, s.Nome, s.Matricola_st
FROM Studente AS s
JOIN Esame AS e ON e.Matricola_studente = s.Matricola_st
JOIN Esame AS e1 ON e1.Matricola_studente = s.Matricola_st
WHERE e.Codice_corso = "E3101Q020" AND e1.Codice_corso = "E3101Q117";
-- Prof propone anche altra soluzione con Subquery e JOIN

-- Query 15
SELECT c.Codice_c, c.Nome	
FROM corso AS c JOIN piano_di_studio AS p ON c.Codice_c = p.Codice_corso
	JOIN studente AS s ON p.Matricola_st = s.Matricola_st
WHERE s.Matricola_st = '1492601' AND c.Codice_c NOT IN (
		SELECT e1.Codice_corso
        FROM esame AS e1
        WHERE e1.Matricola_studente = '1492601'
        );

-- Query 16
SELECT c.Codice_c, c.Nome	
FROM corso AS c JOIN piano_di_studio AS p ON c.Codice_c = p.Codice_corso
	JOIN studente AS s ON p.Matricola_st = s.Matricola_st
    JOIN corso_di_laurea_corsi AS cdlc ON c.Codice_c = cdlc.Codice_c
    JOIN corso_di_laurea AS cl ON cdlc.idCorso_di_Laurea = cl.idCorso_di_Laurea
WHERE cl.tipologia = 'Triennale' AND c.Codice_c NOT IN (
		SELECT e1.Codice_corso
        FROM esame AS e1
        ); -- Non funzionante

-- Query 17 -- Non funzionante
SELECT c.Codice_c, c.Nome, AVG(e.Voto) AS media, COUNT(s.Matricola_st) AS n_studenti
FROM 
WHERE cl.tipologia = 'Magistrale'
GROUP BY c.Codice_c, c.Nome
HAVING n_studenti >= 60
ORDER BY media;

SELECT c.Codice_c, c.Nome, AVG(e.Voto) AS media, COUNT(*) AS numero_studenti
FROM Corso AS c
	JOIN Esame AS e ON e.Codice_corso = c.Codice_c
	JOIN Studente AS s ON e.Matricola_studente = s.Matricola_st
	JOIN Corso_di_Laurea_corsi AS cl ON cl.Codice_c = c.Codice_c
    JOIN corso_di_laurea AS cdl ON cl.idCorso_di_Laurea = cdl.idCorso_di_Laurea
WHERE cdl.Tipologia = 'Magistrale'
GROUP BY c.Codice_c, c.Nome
HAVING numero_studenti >= 60
ORDER BY media DESC;
