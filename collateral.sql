DROP TABLE IF EXISTS collateral_appraisal;

CREATE TABLE collateral_appraisal (
    app_id                   TEXT PRIMARY KEY,
    applicant_name           TEXT,
    collateral_type          TEXT,      -- Residential Property | Vehicle | Commercial Property | Equipment | Unsecured
    appraised_value          INTEGER,   -- NULL if unsecured or halted
    appraisal_date           TEXT,      -- ISO date; agent flags stale appraisals
    lien_position            TEXT,      -- 1st Lien | 2nd Lien | N/A
    condition_marketability  TEXT,      -- Excellent | Good | Fair | Poor | N/A
    pipeline_state           TEXT       -- ACTIVE | HALTED
);
-- Agent 5 COMPUTES ltv_pct (= requested_amount / appraised_value) and collateral_status.
-- requested_amount comes from Agent 1's output in context, NOT from this table.
-- Agent checks pipeline_state first; if HALTED, return status "HALT".

INSERT INTO collateral_appraisal VALUES
('APP-001', 'James Smith',         'Residential Property',  562500, '2026-06-10', '1st Lien', 'Good',      'ACTIVE'),
('APP-002', 'Mary Johnson',        'Vehicle',                38900, '2025-08-12', '1st Lien', 'Good',      'ACTIVE'),
('APP-003', 'John Williams',        NULL,                     NULL,  NULL,         NULL,       NULL,       'HALTED'),
('APP-004', 'Patricia Brown',      'Unsecured',               NULL,  NULL,        'N/A',      'N/A',       'ACTIVE'),
('APP-005', 'Robert Jones',        'Residential Property',  631600, '2025-07-28', '1st Lien', 'Good',      'ACTIVE'),
('APP-006', 'Jennifer Garcia',     'Vehicle',                32900, '2025-08-05', '1st Lien', 'Excellent', 'ACTIVE'),
('APP-007', 'Michael Miller',      'Residential Property',  355600, '2025-07-19', '1st Lien', 'Good',      'ACTIVE'),
('APP-008', 'Linda Davis',         'Unsecured',               NULL,  NULL,        'N/A',      'N/A',       'ACTIVE'),
('APP-009', 'David Rodriguez',     'Commercial Property',   416700, '2025-08-01', '1st Lien', 'Good',      'ACTIVE'),
('APP-010', 'Elizabeth Martinez',  'Residential Property', 1214300, '2025-08-14', '1st Lien', 'Excellent', 'ACTIVE'),
('APP-011', 'William Hernandez',   'Vehicle',                38200, '2025-08-08', '1st Lien', 'Fair',      'ACTIVE'),
('APP-012', 'Barbara Lopez',       'Unsecured',               NULL,  NULL,        'N/A',      'N/A',       'ACTIVE'),
('APP-013', 'Richard Gonzalez',    'Residential Property',  262500, '2025-07-30', '1st Lien', 'Good',      'ACTIVE'),
('APP-014', 'Susan Wilson',        'Equipment',              50000, '2025-08-03', '1st Lien', 'Fair',      'ACTIVE'),
('APP-015', 'Joseph Anderson',     'Vehicle',                24000, '2025-08-11', '1st Lien', 'Good',      'ACTIVE'),
('APP-016', 'Jessica Thomas',      'Residential Property',  687500, '2025-08-06', '1st Lien', 'Excellent', 'ACTIVE'),
('APP-017', 'Thomas Taylor',       'Unsecured',               NULL,  NULL,        'N/A',      'N/A',       'ACTIVE'),
('APP-018', 'Sarah Moore',         'Commercial Property',   769200, '2025-07-25', '1st Lien', 'Good',      'ACTIVE'),
('APP-019', 'Christopher Jackson', 'Vehicle',                68400, '2025-08-09', '1st Lien', 'Good',      'ACTIVE'),
('APP-020', 'Karen Martin',        'Residential Property',  447100, '2025-08-13', '1st Lien', 'Good',      'ACTIVE'),
('APP-021', 'Daniel Lee',          'Residential Property',  455600, '2025-08-02', '1st Lien', 'Good',      'ACTIVE');
