DROP TABLE IF EXISTS income_verification;

CREATE TABLE income_verification (
    app_id                  TEXT PRIMARY KEY,
    applicant_name          TEXT,
    verified_annual_income  INTEGER,   -- NULL if HALTED
    monthly_gross_income    INTEGER,
    other_monthly_debt      INTEGER,   -- existing obligations (excl. the proposed loan)
    employment_verified     TEXT,      -- Yes | No | Pending
    pipeline_state          TEXT       -- ACTIVE | HALTED
);
-- Agent 4 COMPUTES proposed_payment, dti_pct, cashflow_coverage, capacity_status.
-- Those are intentionally absent so the agent does the math, not a lookup.
-- Agent checks pipeline_state first; if HALTED, return status "HALT".

INSERT INTO income_verification VALUES
('APP-001', 'James Smith',          96000,  8000,     0, 'Yes',     'ACTIVE'),
('APP-002', 'Mary Johnson',         68000,  5667,  1718, 'Yes',     'ACTIVE'),
('APP-003', 'John Williams',         NULL,  NULL,  NULL, NULL,      'HALTED'),
('APP-004', 'Patricia Brown',       90000,  7500,  1855, 'Pending', 'ACTIVE'),
('APP-005', 'Robert Jones',        155000, 12917,  2452, 'Pending', 'ACTIVE'),
('APP-006', 'Jennifer Garcia',      45000,  3750,   587, 'Pending', 'ACTIVE'),
('APP-007', 'Michael Miller',       92000,  7667,   784, 'Yes',     'ACTIVE'),
('APP-008', 'Linda Davis',          32000,  2667,  1126, 'Yes',     'ACTIVE'),
('APP-009', 'David Rodriguez',     195000, 16250,  1146, 'Yes',     'ACTIVE'),
('APP-010', 'Elizabeth Martinez',  196000, 16333,     0, 'Yes',     'ACTIVE'),
('APP-011', 'William Hernandez',    89000,  7417,  2431, 'Yes',     'ACTIVE'),
('APP-012', 'Barbara Lopez',        54000,  4500,  1179, 'Yes',     'ACTIVE'),
('APP-013', 'Richard Gonzalez',     60000,  5000,   384, 'Pending', 'ACTIVE'),
('APP-014', 'Susan Wilson',         41000,  3417,  1162, 'Yes',     'ACTIVE'),
('APP-015', 'Joseph Anderson',      38000,  3167,   374, 'Pending', 'ACTIVE'),
('APP-016', 'Jessica Thomas',      124000, 10333,     0, 'Pending', 'ACTIVE'),
('APP-017', 'Thomas Taylor',        33000,  2750,   935, 'Pending', 'ACTIVE'),
('APP-018', 'Sarah Moore',         369000, 30750,  1169, 'Yes',     'ACTIVE'),
('APP-019', 'Christopher Jackson', 108000,  9000,  3123, 'Yes',     'ACTIVE'),
('APP-020', 'Karen Martin',         91000,  7583,   275, 'Yes',     'ACTIVE'),
('APP-021', 'Daniel Lee',          108000,  9000,   927, 'Pending', 'ACTIVE');
