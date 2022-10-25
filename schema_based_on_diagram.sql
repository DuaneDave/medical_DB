CREATE TABLE patients (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
  id BIGSERIAL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT REFERENCES patients(id) NOT NULL,
  status VARCHAR(200) NOT NULL
);

CREATE TABLE invoices (
  id BIGSERIAL PRIMARY KEY,
  total_amount DECIMAL() NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP
  medical_history_id INT REFERENCES medical_histories(id),
);

CREATE TABLE treatments (
  id INT REFERENCES medical_histories(id),
  type VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE invoice_items (
  id INT REFERENCES invoices(id) PRIMARY KEY,
  treatement_id INT REFERENCES treatments,
  type VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL
);