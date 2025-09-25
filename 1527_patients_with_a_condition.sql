CREATE TABLE IF NOT EXISTS Patients(
	patient_id INT PRIMARY KEY,
	patient_name VARCHAR(20),
	conditions VARCHAR(20)
);

INSERT INTO Patients (patient_id, patient_name, conditions) VALUES (1, 'Daniel', 'YFEV COUGH');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES (2, 'Alice', '');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES (3, 'Bob', 'DIAB100 MYOP');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES (4, 'George', 'ACNE DIAB100');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES (5, 'Alain', 'DIAB201');

SELECT patient_id, patient_name, conditions FROM Patients WHERE conditions LIKE '% DIAB1%' OR conditions LIKE'DIAB1%';

DROP TABLE IF EXISTS Patients;