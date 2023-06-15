USE scuola;

INSERT INTO classe
SET anno = "1", sezione = "A";

INSERT INTO classe (anno, sezione) VALUES
	(2, "F"),
    (5, "A"),
    (3, "B"),
    (5, "C");

INSERT INTO comune (codice, nome, regione) VALUES
	(1, "Milano", "Lombardia"),
    (2, "Como", "Lombardia"),
    (3, "Sesto San Giovanni", "Lombardia"),
    (4, "Lentate Sul Seveso", "Lombardia"),
    (5, "Monguzzo", "Lombardia");
    
INSERT INTO studente (codice_fiscale, nome, cognome, comune_residenza, classe_anno, classe_sezione, nazione) VALUES
	("AAAAAAAAAAAAAAAA", "Mario", "Mario", "1", "2", "F", "Italia"),
    ("BBBBBBBBBBBBBBBB", "Luigi", "Mario", "2", "2", "F", "Italia"),
    ("CCCCCCCCCCCCCCCC", "Wario", "Mario", "2", "3", "B", "Italia");
    
INSERT INTO parentela (studente_1, studente_2, grado) VALUES
	("AAAAAAAAAAAAAAAA", "BBBBBBBBBBBBBBBB", "fratello"),
    ("BBBBBBBBBBBBBBBB", "AAAAAAAAAAAAAAAA", "fratello");
    
INSERT INTO materia (codice, nome) VALUES
	(1, "matematica"), (2, "Fisica"), (3, "Filosofia"), (4, "Latino"), (5, "Storia");
    
INSERT INTO argomento (codice, codice_materia, nome, ore) VALUES
	(1, 1, "Frazioni", 10),
    (2, 1, "Polinomi", 5),
    (3, 1, "Aristotele", 15),
    (4, 1, "Cicerone", 10), 
    (5, 1,  "Hitler", 5);

INSERT INTO argomento (codice, codice_materia, nome, ore) VALUES
	(1, 2, "Espressioni", 10),
    (2, 2, "Termodinamica", 5);
    
INSERT INTO propedeuticita (materia, argomento_prima, argomento_dopo) VALUES
	(1, 1, 2),
    (2, 1, 2);
    
INSERT INTO insegnante (codice_fiscale, nome, cognome, comune_residenza, comune_nascita) VALUES
	("AFFFFFFFFFFFFFFF", "Fafa", "Fefe", 1, 1),
	("BFFFFFFFFFFFFFFF", "Alberto", "Leporati", 1, 2),
	("CFFFFFFFFFFFFFFF", "Fafa", "Fefe", 2, 3);
    
INSERT INTO insegnamento (insegnante, codice_materia, classe_anno, classe_sezione, ore_settimanali) VALUES
	("AFFFFFFFFFFFFFFF", 1, 1, "A", 15),
    ("BFFFFFFFFFFFFFFF", 2, 2, "F", 20);

INSERT INTO scuola VALUES
	(1, "Galilei", 5);

INSERT INTO insegnamento_altra_scuola 
	SET insegnante = "BFFFFFFFFFFFFFFF", codice_scuola = 1;

UPDATE insegnante
	SET cognome = "Frigerio", nome = "Enrica"
    WHERE codice_fiscale = "AFFFFFFFFFFFFFFF"
    LIMIT 1;

INSERT INTO studente (codice_fiscale, nome, cognome, comune_residenza, classe_anno, classe_sezione, nazione) VALUES
	("PPPPPPPPPPPPPPPP", "Peach", "Mushroom", "1", "2", "F", "Italia"),
    ("DDDDDDDDDDDDDDDD", "Daisy", "Mushroom", "2", "2", "F", "Italia"),
    ("LLLLLLLLLLLLLLLL", "Waluigi", "Mario", "2", "3", "B", "Italia");

INSERT INTO valutazione (codice_argomento, codice_materia, studente, voto) VALUES
	(1, 2, "AAAAAAAAAAAAAAAA", 9),
    (2, 1, "AAAAAAAAAAAAAAAA", 7),
    (1, 2, "BBBBBBBBBBBBBBBB", 10),
    (1, 2, "BBBBBBBBBBBBBBBB", 7),
    (1, 5, "BBBBBBBBBBBBBBBB", 10),
    (1, 5, "CCCCCCCCCCCCCCCC", 4),
    (1, 5, "LLLLLLLLLLLLLLLL", 4),
    (1, 5, "PPPPPPPPPPPPPPPP", 9),
    (1, 2, "DDDDDDDDDDDDDDDD", 9),
    (1, 2, "PPPPPPPPPPPPPPPP", 9);
    

UPDATE studente 
	SET cognome = "Random"
	WHERE codice_fiscale = 'AAAAAAAAAAAAAAAA'
    LIMIT 1;
    
UPDATE insegnante AS i
	JOIN comune AS c ON i.comune_residenza = c.codice
    SET i.comune_residenza = 2
    WHERE i.nome = 'Alberto' AND i.cognome = 'Leporati' LIMIT 1;
    
    