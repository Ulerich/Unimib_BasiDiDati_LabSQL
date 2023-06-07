USE universita;

-- Query 1
SELECT *
FROM citta;

-- Query 2
SELECT provincia
FROM citta;

-- Query 3
SELECT DISTINCT provincia
FROM citta;

-- Query 4
SELECT nome
FROM citta
WHERE LEFT(nome, 1) = 'M';

-- Query 5
SELECT nome
FROM citta
WHERE nome LIKE "M%";

-- Query 6
SELECT nome
FROM studente
WHERE nome LIKE "%r%";

-- Query 7
SELECT cognome
FROM studente
WHERE cognome LIKE "%i";

-- Query 8
SELECT *
FROM studente
WHERE (matricola < 521) AND (matricola > 499);

-- Query 9
SELECT *
FROM studente
WHERE matricola BETWEEN 500 AND 520;

-- Query 10
SELECT *
FROM corso
WHERE ore_lezione > 35;

-- Query 11
SELECT nome, (ore_lezione + ore_esercitazione) AS monte_ore
FROM corso;

-- Query 12
SELECT nome, (ore_lezione + ore_esercitazione) AS monte_ore
FROM corso
WHERE ore_lezione + ore_esercitazione < 50;

-- Query 13
SELECT nome, (ore_lezione + ore_esercitazione) AS monte_ore
FROM corso
WHERE (ore_lezione + ore_esercitazione) < 80; -- Non posso usare monte ore perchè SELECT viene eseguita per ultima

-- Query 14
SELECT c.nome, d.nome, d.cognome
FROM corso AS c, docente AS d
WHERE c.docente = d.matricola;

-- Query 15
SELECT c.nome, d.nome, d.cognome
FROM corso AS c JOIN docente AS d ON c.docente = d.matricola;

-- Query 16
SELECT l.nome, d.nome, d.cognome
FROM corso_di_laurea AS l JOIN docente AS d ON l.presidente = d.matricola;

-- Query 17
SELECT *
FROM corso_di_laurea AS l JOIN afferisce AS a ON l.codice = a.codice_corso_laurea
JOIN corso AS c ON a.codice_corso = c.codice
WHERE l.tipologia = 'specialistica';

-- Query 18
SELECT c.nome, d.matricola, d.nome, d.cognome
FROM corso AS c JOIN docente AS d ON c.docente = d.matricola
	JOIN citta ON d.citta_residenza = citta.codice
WHERE citta.nome = 'Milano' AND citta.provincia = 'MI';

-- Query 19
SELECT s.matricola, s.nome, s.cognome
FROM studente AS s JOIN esame AS e ON s.matricola = e.matricola_studente
	JOIN corso AS c ON e.codice_corso = c.codice
WHERE c.nome = 'BASI DI DATI' AND e.voto > 25;

-- Query 20
SELECT s.matricola, s.nome, s.cognome, DATEDIFF('2020-05-04', e.data) AS giorni_passati
FROM studente AS s JOIN esame AS e ON s.matricola = e.matricola_studente
	JOIN corso AS c ON e.codice_corso = c.codice
WHERE c.nome = 'BASI DI DATI' AND e.voto > 25 AND e.data > '2018-05-04';

-- Query 21
SELECT c.nome, e.voto,
	(CASE WHEN (e.data > '2018-05-04') THEN 'nuova'
    WHEN (e.data < '2018-05-04')THEN 'vecchia' END) AS riforma
FROM studente AS s JOIN esame AS e ON s.matricola = e.matricola_studente
	JOIN corso AS c ON e.codice_corso = c.codice
WHERE s.nome = 'Viola' AND s.cognome = 'Lomartire';
