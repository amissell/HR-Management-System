-- Active: 1733741706668@@127.0.0.1@3306@rh_db
DROP DATABASE IF EXISTS rh_db;
CREATE DATABASE rh_db;
USE rh_db;

CREATE TABLE AdministrateurRH (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(20) NOT NULL,
    role ENUM('employé', 'RH') NOT NULL DEFAULT 'RH'
);

CREATE TABLE Employe (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(20) NOT NULL,
    poste ENUM('salarie', 'giro', 'comptable') NOT NULL DEFAULT 'salarie',
    salaire FLOAT NOT NULL
);

CREATE TABLE FichePaie (    
    id INT PRIMARY KEY AUTO_INCREMENT,  
    mois DATE,
    montant INT,
    status ENUM('généré', 'payé'),
    employe_id INT,
    FOREIGN KEY (employe_id) REFERENCES Employe(id)  
);

CREATE TABLE Conge (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    employe_id INT,
    date_debut DATE,
    date_fin DATE,
    type VARCHAR(20),
    status ENUM('attente', 'approuvé', 'refusé'),
    FOREIGN KEY (employe_id) REFERENCES Employe(id)  
); 

CREATE TABLE GestionnaireRH (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    listeEmployes JSON,
    listeConges JSON,
    listeFichesPaie JSON,
    content VARCHAR(255),
    title VARCHAR(20)
);
