CREATE DATABASE IF NOT EXISTS univEs;
CREATE SCHEMA IF NOT EXISTS univEs;

-- Definizione tabella esercizio 3
CREATE TABLE IF NOT EXISTS univEs.Studente (
	matricola VARCHAR(6) NOT NULL,
	cognome VARCHAR(40) NOT NULL,
	nome VARCHAR(40) NOT NULL,
	data_nascita DATE NOT NULL,
	data_iscrizione DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    voto_laurea INT NULL DEFAULT NULL,
    PRIMARY KEY (matricola)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS univEs.Corso (
	codice INT NOT NULL,
    cognome VARCHAR(40) NOT NULL,
	nome VARCHAR(40) NOT NULL,
    crediti_lezione INT NOT NULL,
    crediti_esercitazione INT,
    cod_docente VARCHAR(6) NOT NULL,
    PRIMARY KEY (codice)
) ENGINE=InnoDB;