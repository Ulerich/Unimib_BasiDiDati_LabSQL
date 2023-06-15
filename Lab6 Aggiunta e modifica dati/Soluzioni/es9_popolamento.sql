USE scuola;

INSERT INTO classe (anno, sezione) VALUES
(1, "A"), (1, "B"), (1, "C"), (2, "A"), (2, "B"), (2, "C"), (3, "A"), (3, "B"), (3, "C"), (4, "A"), (4, "B"), (4, "C"), (5, "A"), (5, "B"), (5, "C");

INSERT INTO comune (codice, nome, regione) VALUES
(1, "Milano", "Lombardia"),
(2, "Sesto San Giovanni", "Lombardia"),
(3, "Cernusco sul Naviglio", "Lombardia"),
(4, "Cinisello Balsamo", "Lombardia"),
(5, "Bresso", "Lombardia");

INSERT INTO studente (codice_fiscale, nome, cognome, comune_residenza, classe_anno, classe_sezione, nazione) VALUES
("WDRPOS55T22H305C","Giulia","Castelli",2,2,"B",NULL),
("LEUTYG33W25A254J","Marta","Agostino",3,4,"A",NULL),
("IBGTVD21I38T179H","Giovanni","Verdi",2,5,"C",NULL),
("HVGOUQ16H56Z358C","Laura","Brambilla",4,4,"A",NULL),
("UDPHCX23Q22O635I","Giulia","Belli",4,5,"C",NULL),
("DAFVUB31W78Y456K","Alice","Agostino",1,2,"B",NULL),
("AXMIKJ74X87A095O","Mario","Belli",3,4,"B",NULL),
("ZERWLM39M65A835S","Giovanni","Castelli",1,3,"B",NULL),
("AGUKTZ66Z49X058M","Antonio","Iglesias",4,3,"B","Spagna"),
("OJXCLN81Q91T384N","Antonio","Verdi",1,2,"A",NULL),
("YZHGKN79Z05Y066R","Luca","Rossi",4,4,"B",NULL),
("NVQISR20I62D339Q","Antonio","Rossi",3,1,"C",NULL),
("DURYME56V01K759Q","Marco","Esposito",1,2,"C",NULL),
("FCYKLY04H33A799K","Andrea","Castelli",2,1,"C",NULL),
("VXEOHC01Y27Q747J","Lucia","Biondi",2,1,"C",NULL),
("KUMVWO86O86R466Y","Lucia","Verdi",2,2,"C",NULL),
("QJLKUP99Y42L190K","Stefania","Esposito",4,4,"C",NULL);

INSERT INTO parentela (studente_1, studente_2, grado) VALUES
("YZHGKN79Z05Y066R", "NVQISR20I62D339Q", "fratello"),
("NVQISR20I62D339Q", "YZHGKN79Z05Y066R", "fratello"),
("KUMVWO86O86R466Y", "IBGTVD21I38T179H", "sorella"),
("IBGTVD21I38T179H", "KUMVWO86O86R466Y", "sorella");

INSERT INTO materia (codice, nome) VALUES (1, "Matematica"), (2, "Fisica"), (3, "Filosofia"), (4, "Latino"), (5, "Storia");

INSERT INTO argomento (codice, codice_materia, nome, ore) VALUES
(1, 1, "Algebra", 20), (2, 1, "Trigonometria", 30), (3, 1, "Geometria analitica", 50),
(1, 2, "Meccanica", 50), (2, 2, "Termologia", 20), (3, 2, "Elettricità e magnetismo", 30), (4, 2, "Ottica", 10),
(1, 3, "Filosofia antica", 60), (2, 3, "Filosofia del Rinascimento", 40), (3, 4, "Filosofia moderna", 50),
(1, 4, "Grammatica", 80), (2, 4, "Letteratura", 60),
(1, 5, "Preistoria", 20), (2, 5, "Storia romana", 30), (3, 5, "Storia greca", 50);

INSERT INTO propedeuticita (materia, argomento_prima, argomento_dopo) VALUES (5, 1, 2), (5, 2, 3), (1, 2, 3);

INSERT INTO insegnante (codice_fiscale, nome, cognome, comune_residenza, comune_nascita) VALUES
("VXEOHC51Y27Q747X", "Valerio", "Scafati", 1, 3),
("OJXCLN61Q91T384M", "Andrea", "Liquori", 3, 4),
("YZHGKN69Z05Y066R", "Alice", "Buzzi", 2, 2),
("AGCKTZ76Z49X058M", "Laura", "Zuni", 2, 1);

INSERT INTO scuola (codice, nome, comune) VALUES (1, "Istituto Tecnico Primo Levi", 1);

INSERT INTO insegnamento_altra_scuola (insegnante, codice_scuola) VALUES ("OJXCLN61Q91T384M", 1);

INSERT INTO valutazione (studente, codice_materia, codice_argomento, voto) VALUES
("ZERWLM39M65A835S", 3, 1, 7),
("ZERWLM39M65A835S", 4, 2, 8),
("DAFVUB31W78Y456K", 3, 1, 6),
("DAFVUB31W78Y456K", 5, 1, 7),
("HVGOUQ16H56Z358C", 2, 1, 5),
("HVGOUQ16H56Z358C", 2, 2, 6),
("DURYME56V01K759Q", 2, 1, 8),
("DURYME56V01K759Q", 2, 2, 7),
("AGUKTZ66Z49X058M", 4, 1, 8),
("AGUKTZ66Z49X058M", 3, 1, 9);

INSERT INTO insegnamento (insegnante, codice_materia, classe_anno, classe_sezione, ore_settimanali) VALUES
("VXEOHC51Y27Q747X", 3, 1, "B", 3),
("VXEOHC51Y27Q747X", 5, 1, "B", 2),
("OJXCLN61Q91T384M", 4, 2, "A", 4),
("YZHGKN69Z05Y066R", 2, 5, "B", 3),
("AGCKTZ76Z49X058M", 5, 3, "C", 2);

