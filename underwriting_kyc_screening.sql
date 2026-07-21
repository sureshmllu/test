DROP TABLE IF EXISTS underwriting_kyc_screening;

CREATE TABLE underwriting_kyc_screening (
    app_id                    TEXT PRIMARY KEY,
    applicant_name            TEXT,
    id_verification           TEXT,     -- Pass | Fail
    doc_authenticity          TEXT,     -- Genuine | Suspect | Edited
    sanctions_ofac            TEXT,     -- Clear | Hit
    pep_check                 TEXT,     -- Clear | Match
    adverse_media             TEXT,     -- Clear | Flag
    synthetic_fraud_score     INTEGER,  -- 0-100 (>=85 = hard stop)
    device_ip_risk            TEXT,     -- Low | Medium | High
    vpn_proxy_tor             INTEGER,  -- 0 | 1
    ip_geo                    TEXT,
    email_age_days            INTEGER,
    existing_customer         TEXT,     -- Yes | No
    internal_fraud_blocklist  TEXT,     -- No | Yes
    aml_risk_rating           TEXT      -- Low | Medium | High
);

INSERT INTO underwriting_kyc_screening VALUES
('APP-001', 'James Smith',       'Pass', 'Genuine', 'Clear', 'Clear', 'Clear',  8, 'Low',    0, 'Naples, FL, US',       2190, 'Yes', 'No',  'Low'),
('APP-002', 'Mary Johnson',      'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 12, 'Low',    0, 'Austin, TX, US',       1400, 'Yes', 'No',  'Low'),
('APP-003', 'John Williams',     'Fail', 'Suspect', 'Clear', 'Clear', 'Clear', 88, 'Medium', 0, 'New York, NY, US',       45, 'No',  'No',  'High'),
('APP-004', 'Patricia Brown',    'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 15, 'Low',    0, 'Miami, FL, US',         320, 'No',  'No',  'Medium'),
('APP-005', 'Robert Jones',      'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 18, 'Medium', 0, 'Chicago, IL, US',       980, 'Yes', 'No',  'Low'),
('APP-006', 'Jennifer Garcia',   'Pass', 'Genuine', 'Clear', 'Clear', 'Clear',  9, 'Low',    0, 'Philadelphia, PA, US', 1650, 'Yes', 'No',  'Low'),
('APP-007', 'Michael Miller',    'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 21, 'Low',    0, 'Columbus, OH, US',      760, 'No',  'No',  'Low'),
('APP-008', 'Linda Davis',       'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 17, 'Medium', 0, 'Atlanta, GA, US',       210, 'No',  'No',  'Medium'),
('APP-009', 'David Rodriguez',   'Pass', 'Genuine', 'Clear', 'Clear', 'Clear',  6, 'Low',    0, 'Charlotte, NC, US',    2400, 'Yes', 'No',  'Low'),
('APP-010', 'Elizabeth Martinez','Pass', 'Genuine', 'Clear', 'Clear', 'Clear',  5, 'Low',    0, 'Detroit, MI, US',      2800, 'Yes', 'No',  'Low'),
('APP-011', 'William Hernandez', 'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 19, 'Medium', 0, 'Naples, FL, US',        540, 'No',  'No',  'Medium'),
('APP-012', 'Barbara Lopez',     'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 41, 'High',   1, 'Austin, TX, US',        120, 'No',  'No',  'Medium'),
('APP-013', 'Richard Gonzalez',  'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 11, 'Low',    0, 'New York, NY, US',     1300, 'Yes', 'No',  'Low'),
('APP-014', 'Susan Wilson',      'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 16, 'Medium', 0, 'Miami, FL, US',         680, 'No',  'No',  'Medium'),
('APP-015', 'Joseph Anderson',   'Pass', 'Genuine', 'Clear', 'Clear', 'Clear',  7, 'Low',    0, 'Chicago, IL, US',      2100, 'Yes', 'No',  'Low'),
('APP-016', 'Jessica Thomas',    'Pass', 'Genuine', 'Clear', 'Clear', 'Clear',  4, 'Low',    0, 'Philadelphia, PA, US', 2900, 'Yes', 'No',  'Low'),
('APP-017', 'Thomas Taylor',     'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 20, 'Medium', 0, 'Columbus, OH, US',      260, 'No',  'No',  'Medium'),
('APP-018', 'Sarah Moore',       'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 13, 'Low',    0, 'Atlanta, GA, US',      1550, 'Yes', 'No',  'Low'),
('APP-019', 'Christopher Jackson','Pass','Genuine', 'Clear', 'Clear', 'Clear', 18, 'Medium', 0, 'Charlotte, NC, US',     430, 'No',  'No',  'Medium'),
('APP-020', 'Karen Martin',      'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 10, 'Low',    0, 'Detroit, MI, US',      1800, 'Yes', 'No',  'Low'),
('APP-021', 'Daniel Lee',        'Pass', 'Genuine', 'Clear', 'Clear', 'Clear', 14, 'Low',    0, 'Naples, FL, US',       1100, 'Yes', 'No',  'Low')
