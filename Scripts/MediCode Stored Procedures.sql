CREATE PROC create_patient
@id int,
@last_name nvarchar(50),
@first_name nvarchar(50),
@birth_date datetime
AS
BEGIN
INSERT INTO patients(id, last_name, first_name, birth_date)
VALUES (@id, @last_name, @first_name, @birth_date)
END

CREATE PROC read_patients
AS
BEGIN
SELECT * FROM patients
END

CREATE PROC update_patient
@id int,
@last_name nvarchar(50),
@first_name nvarchar(50),
@birth_date datetime
AS
BEGIN
UPDATE patients SET last_name = @last_name, first_name = @first_name, birth_date = @birth_date
WHERE id = @id
END

CREATE PROC delete_patient
@id int
AS
BEGIN
DELETE patients
WHERE id=@id
END

CREATE PROC create_prescription
@id int,
@series nvarchar(50),
@number nvarchar(50),
@issue_date datetime,
@patient_id int
AS
BEGIN
INSERT INTO prescriptions(id, series, number, issue_date, patient_id)
VALUES (@id, @series, @number, @issue_date, @patient_id)
END

CREATE PROC read_prescriptions
AS
BEGIN
SELECT * FROM prescriptions
END

CREATE PROC update_prescription
@id int,
@series nvarchar(50),
@number nvarchar(50),
@issue_date datetime,
@patient_id int
AS
BEGIN
UPDATE prescriptions SET series = @series, number = @number, issue_date = @issue_date, patient_id = @patient_id
WHERE id = @id
END

CREATE PROC delete_prescription
@id int
AS
BEGIN
DELETE prescriptions
WHERE id=@id
END

CREATE PROC create_drug
@id int,
@name nvarchar(50),
@quantity int,
@dosage int,
@prescription_id int
AS
BEGIN
INSERT INTO drugs(id, name, quantity, dosage, prescription_id)
VALUES (@id, @name, @quantity, @dosage, @prescription_id)
END

CREATE PROC read_drugs
AS
BEGIN
SELECT * FROM drugs
END

CREATE PROC update_drugs
@id int,
@name nvarchar(50),
@quantity int,
@dosage int,
@prescription_id int
AS
BEGIN
UPDATE drugs SET name = @name, quantity = @quantity, dosage = @dosage, prescription_id = @prescription_id
WHERE id = @id
END

CREATE PROC delete_drug
@id int
AS
BEGIN
DELETE drugs
WHERE id=@id
END

CREATE PROC get_patients_report
@start_date datetime,
@end_date datetime
AS
BEGIN
SELECT patients.last_name, patients.first_name, COUNT(prescriptions.id) FROM patients
INNER JOIN prescriptions ON prescriptions.patient_id = patients.id
WHERE prescriptions.issue_date BETWEEN @start_date AND @end_date
GROUP BY patients.last_name, patients.first_name
END

CREATE PROC get_drugs_report
@start_date datetime,
@end_date datetime
AS
BEGIN
SELECT drugs.name, SUM(drugs.quantity) AS quantity FROM drugs
FULL JOIN prescriptions ON drugs.prescription_id = prescriptions.id
WHERE prescriptions.issue_date BETWEEN @start_date AND @end_date
GROUP BY drugs.name
ORDER BY quantity DESC
END



