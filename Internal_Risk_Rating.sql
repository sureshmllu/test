DROP TABLE IF EXISTS risk_pd_base;
DROP TABLE IF EXISTS risk_pd_factor;
DROP TABLE IF EXISTS risk_lgd_matrix;
DROP TABLE IF EXISTS risk_grade_map;

-- 1. Base 12-month PD by FICO band (secured baseline, %)
CREATE TABLE risk_pd_base (
    fico_min   INTEGER,
    fico_max   INTEGER,
    base_pd    REAL
);
INSERT INTO risk_pd_base VALUES
(800, 900,  0.3),
(760, 799,  1.0),
(720, 759,  1.5),
(680, 719,  1.8),
(640, 679,  3.0),
(620, 639,  5.5),
(580, 619,  7.0),
(  0, 579, 10.0);

-- 2. Multiplicative adjustments applied to base_pd
CREATE TABLE risk_pd_factor (
    factor_type  TEXT,     -- product | dti | delinquency
    factor_key   TEXT,
    multiplier   REAL
);
INSERT INTO risk_pd_factor VALUES
('product',     'Mortgage',  0.9),
('product',     'Auto',      1.0),
('product',     'SME',       1.2),
('product',     'Personal',  1.3),
('dti',         '0-36',      0.9),
('dti',         '37-43',     1.0),
('dti',         '44-49',     1.2),
('dti',         '50+',       1.5),
('delinquency', '0',         0.9),
('delinquency', '1',         1.1),
('delinquency', '2',         1.25),
('delinquency', '3-4',       1.5),
('delinquency', '5+',        1.8);
-- PD = base_pd x product x dti x delinquency, rounded to 1 decimal.

-- 3. LGD: slope form for secured products, flat rate otherwise
CREATE TABLE risk_lgd_matrix (
    product_type  TEXT,
    secured       TEXT,      -- Yes | No
    ltv_offset    INTEGER,   -- LGD = (LTV - offset) / divisor
    divisor       REAL,
    flat_lgd      REAL,      -- used when secured = 'No'
    lgd_cap       REAL
);
INSERT INTO risk_lgd_matrix VALUES
('Mortgage', 'Yes', 50, 1.2, NULL, 45),
('Auto',     'Yes', 40, 1.2, NULL, 55),
('SME',      'Yes', NULL, NULL, 45, 45),
('SME',      'No',  NULL, NULL, 55, 55),
('Personal', 'No',  NULL, NULL, 65, 65);

-- 4. PD -> grade, tier, appetite note
CREATE TABLE risk_grade_map (
    pd_upper_exclusive  REAL,
    internal_grade      TEXT,
    risk_tier           TEXT,
    appetite_note       TEXT
);
INSERT INTO risk_grade_map VALUES
( 0.5,  'AAA', 'Very Low',  'Within risk appetite'),
( 1.0,  'AA',  'Low',       'Within risk appetite'),
( 2.0,  'A',   'Low',       'Within risk appetite'),
( 3.5,  'BBB', 'Moderate',  'Within risk appetite'),
( 5.0,  'BB',  'Moderate',  'Within risk appetite'),
( 8.0,  'B',   'Elevated',  'Watch - elevated PD'),
(12.0,  'CCC', 'High',      'Exceeds risk appetite'),
(999.0, 'CC',  'Very High', 'Exceeds risk appetite');
