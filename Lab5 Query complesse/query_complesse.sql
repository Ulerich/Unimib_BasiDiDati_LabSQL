USE universita;

-- Query 1
SELECT s.valore, d.Nome, d.Cognome, c.Nome
FROM stipendio AS s JOIN personale_docente AS d ON s.classe = d.Classe_stipendio
	JOIN corso AS c ON d.Matricola_d = c.Docente
WHERE d.Ruolo = 'Ordinario';

-- Query 2
SELECT C.Nome, C.Ore_lezione + C.Ore_esercitazione AS Ore_Totali
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
WHERE E.Codice_corso IS NOT NULL;

-- Query 6
SELECT S.Nome, S.Cognome, S.Matricola_st, citta.Nome
FROM corso AS C JOIN piano_di_studio AS P ON C.Codice_c = P.Codice_corso
	JOIN studente AS S ON P.Matricola_st = S.Matricola_st
    JOIN citta ON S.Citta_residenza = citta.idCitta
WHERE C.Nome = 'Analisi Matematica';

-- Query 7
-- Controllare soluzione prof