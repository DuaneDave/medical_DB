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
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id BIGSERIAL REFERENCES medical_histories(id) PRIMARY KEY,
  type VARCHAR(200) NOT NULL,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE invoice_items (
  id BIGSERIAL PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT REFERENCES invoices(id) NOT NULL,
  treatement_id INT REFERENCES treatments(id)
);