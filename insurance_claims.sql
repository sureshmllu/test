DROP TABLE IF EXISTS insurance_claims_extended;

CREATE TABLE insurance_claims_extended (
    claim_reference_id TEXT PRIMARY KEY,
    patient_id TEXT,
    patient_name TEXT,
    age INTEGER,
    gender TEXT,
    diagnosis TEXT,
    treatment TEXT,
    date_of_visit TEXT,
    claim_request_type TEXT,
    claim_amount REAL,
    insurance_provider TEXT,
    policy_number TEXT,
    coverage_type TEXT,
    insurance_start_date TEXT,
    claim_amount_limit REAL
);

INSERT INTO insurance_claims_extended VALUES
-- Matching records (used by agent)
('CLM6001', 'P1001', 'Ravi Kumar', 45, 'Male', 'Type 2 Diabetes', 'Metformin therapy', '2026-03-20', 'Medication Reimbursement', 15000, 'Star Health Insurance', 'POL9101', 'Individual', '2026-01-01', 20000),
('CLM6003', 'P1003', 'Suresh Reddy', 58, 'Male', 'Hypertension', 'Medication and monitoring', '2026-03-15', 'Chronic Disease Management', 12000, 'ICICI Lombard', 'POL9103', 'Individual', '2026-01-01', 15000),
('CLM6005', 'P1005', 'Arjun Singh', 29, 'Male', 'Arm Fracture', 'Cast and X-ray', '2026-03-12', 'Emergency Treatment', 25000, 'Religare Health', 'POL9105', 'Family Floater', '2026-01-01', 50000),

-- Extra records (background DB)
('CLM6006', 'P1006', 'Neha Gupta', 37, 'Female', 'Asthma', 'Inhaler therapy', '2026-02-10', 'Medication Reimbursement', 9000, 'HDFC Ergo', 'POL9106', 'Individual', '2026-01-01', 20000),
('CLM6007', 'P1007', 'Rajesh Verma', 50, 'Male', 'Heart Disease', 'Surgery', '2026-01-22', 'Surgery Claim', 120000, 'Max Bupa', 'POL9107', 'Individual', '2026-01-01', 200000),
('CLM6008', 'P1008', 'Priya Nair', 28, 'Female', 'PCOS', 'Hormonal treatment', '2026-02-15', 'Chronic Disease Management', 11000, 'Star Health Insurance', 'POL9108', 'Individual', '2026-01-01', 20000),
('CLM6009', 'P1009', 'Amit Shah', 60, 'Male', 'Kidney Stones', 'Lithotripsy', '2026-01-30', 'Surgery Claim', 45000, 'ICICI Lombard', 'POL9109', 'Family Floater', '2026-01-01', 50000),
('CLM6010', 'P1010', 'Kavya Iyer', 34, 'Female', 'Thyroid', 'Medication', '2026-02-05', 'Medication Reimbursement', 7000, 'Religare Health', 'POL9110', 'Individual', '2026-01-01', 20000),
('CLM6011', 'P1011', 'Deepak Singh', 41, 'Male', 'Back Pain', 'Physiotherapy', '2026-03-01', 'Consultation Reimbursement', 6000, 'HDFC Ergo', 'POL9111', 'Individual', '2026-01-01', 20000),
('CLM6012', 'P1012', 'Sneha Reddy', 26, 'Female', 'Anemia', 'Iron therapy', '2026-02-18', 'Lab Test & Medication', 5000, 'Star Health Insurance', 'POL9112', 'Individual', '2026-01-01', 20000),
('CLM6013', 'P1013', 'Vikram Joshi', 47, 'Male', 'Diabetes', 'Insulin therapy', '2026-01-25', 'Chronic Disease Management', 20000, 'Max Bupa', 'POL9113', 'Family Floater', '2026-01-01', 30000),
('CLM6014', 'P1014', 'Pooja Sharma', 39, 'Female', 'Migraine', 'Consultation', '2026-02-28', 'Consultation Reimbursement', 4000, 'ICICI Lombard', 'POL9114', 'Individual', '2026-01-01', 20000),
('CLM6015', 'P1015', 'Rohit Mehta', 52, 'Male', 'Hypertension', 'Medication', '2026-02-12', 'Medication Reimbursement', 8000, 'Religare Health', 'POL9115', 'Individual', '2026-01-01', 20000),
('CLM6016', 'P1016', 'Anil Kumar', 63, 'Male', 'Cardiac Issue', 'Surgery', '2026-01-10', 'Surgery Claim', 150000, 'Star Health Insurance', 'POL9116', 'Family Floater', '2026-01-01', 150000),
('CLM6017', 'P1017', 'Divya Nair', 31, 'Female', 'Allergy', 'Medication', '2026-03-05', 'Medication Reimbursement', 3000, 'HDFC Ergo', 'POL9117', 'Individual', '2026-01-01', 20000),
('CLM6018', 'P1018', 'Manoj Patel', 44, 'Male', 'Fracture', 'Cast', '2026-02-20', 'Emergency Treatment', 18000, 'Max Bupa', 'POL9118', 'Family Floater', '2026-01-01', 20000),
('CLM6019', 'P1019', 'Rina Das', 36, 'Female', 'Skin Infection', 'Medication', '2026-02-25', 'Medication Reimbursement', 3500, 'ICICI Lombard', 'POL9119', 'Individual', '2026-01-01', 20000),
('CLM6020', 'P1020', 'Karan Malhotra', 48, 'Male', 'Ulcer', 'Treatment', '2026-01-18', 'Hospitalization Claim', 30000, 'Religare Health', 'POL9120', 'Individual', '2026-01-01', 20000);
