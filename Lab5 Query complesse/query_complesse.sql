USE universita;

-- Query 1
SELECT s.valore, d.Nome, d.Cognome, c.Nome
FROM stipendio AS s JOIN personale_docente AS d ON s.classe = d.Classe_stipendio
	JOIN corso AS c ON d.Matricola_d = c.Docente
WHERE d.Ruolo = 'Ordinario';
