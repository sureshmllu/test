DROP TABLE IF EXISTS credit_bureau;

CREATE TABLE credit_bureau (
    app_id              TEXT PRIMARY KEY,
    applicant_name      TEXT,
    fico_score          INTEGER,   -- NULL if pipeline_state = 'HALTED'
    bureau              TEXT,      -- Experian | Equifax | TransUnion | NULL
    history_years       INTEGER,
    open_trade_lines    INTEGER,
    delinquencies_24mo  INTEGER,
    utilization_pct     INTEGER,
    public_records      TEXT,      -- None | 1 Collection | Prior BK | NULL
    pipeline_state      TEXT       -- ACTIVE | HALTED
);
-- pipeline_state = 'HALTED' = upstream KYC hard stop; no bureau pull was run.
-- Agent 3 checks pipeline_state FIRST. If HALTED, return status "HALT" immediately.
-- credit_status omitted intentionally — Agent 3 derives it from the raw fields.

INSERT INTO credit_bureau VALUES
('APP-001', 'James Smith',          760, 'Experian',   12,  7, 0, 16, 'None',          'ACTIVE'),
('APP-002', 'Mary Johnson',         680, 'Equifax',     7,  7, 2, 25, 'None',          'ACTIVE'),
('APP-003', 'John Williams',       NULL,  NULL,        NULL,NULL,NULL,NULL, NULL,       'HALTED'),
('APP-004', 'Patricia Brown',       710, 'Experian',   10, 16, 1, 16, 'None',          'ACTIVE'),
('APP-005', 'Robert Jones',         620, 'TransUnion',  6,  5, 1, 62, '1 Collection',  'ACTIVE'),
('APP-006', 'Jennifer Garcia',      740, 'TransUnion', 11,  7, 0, 21, 'None',          'ACTIVE'),
('APP-007', 'Michael Miller',       690, 'TransUnion',  8, 15, 0, 41, 'None',          'ACTIVE'),
('APP-008', 'Linda Davis',          580, 'Experian',    3,  2, 5, 81, 'Prior BK',      'ACTIVE'),
('APP-009', 'David Rodriguez',      780, 'Equifax',    12, 15, 0, 14, 'None',          'ACTIVE'),
('APP-010', 'Elizabeth Martinez',   790, 'Experian',   14,  8, 0, 10, 'None',          'ACTIVE'),
('APP-011', 'William Hernandez',    650, 'Equifax',     9, 10, 3, 48, '1 Collection',  'ACTIVE'),
('APP-012', 'Barbara Lopez',        700, 'Experian',    9, 22, 1, 20, 'None',          'ACTIVE'),
('APP-013', 'Richard Gonzalez',     715, 'Equifax',     6, 12, 1, 17, 'None',          'ACTIVE'),
('APP-014', 'Susan Wilson',         640, 'Equifax',     7,  8, 2, 40, '1 Collection',  'ACTIVE'),
('APP-015', 'Joseph Anderson',      750, 'Equifax',     9, 19, 0, 21, 'None',          'ACTIVE'),
('APP-016', 'Jessica Thomas',       810, 'TransUnion', 12, 12, 0, 18, 'None',          'ACTIVE'),
('APP-017', 'Thomas Taylor',        670, 'TransUnion',  9, 12, 2, 25, 'None',          'ACTIVE'),
('APP-018', 'Sarah Moore',          730, 'Equifax',     8,  6, 0, 23, 'None',          'ACTIVE'),
('APP-019', 'Christopher Jackson',  610, 'Equifax',     6,  5, 5, 75, 'Prior BK',      'ACTIVE'),
('APP-020', 'Karen Martin',         745, 'Equifax',     7,  6, 1, 17, 'None',          'ACTIVE'),
('APP-021', 'Daniel Lee',           705, 'Equifax',    11, 11, 1, 28, 'None',          'ACTIVE');
