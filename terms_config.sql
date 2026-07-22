DROP TABLE IF EXISTS terms_config;

CREATE TABLE terms_config (
    config_type  TEXT,     -- base_rate | risk_spread | ltv_adj | security_adj | covenant | condition | ecoa_reason
    config_key   TEXT,
    num_value    REAL,
    text_value   TEXT
);

INSERT INTO terms_config VALUES
('base_rate',    'Mortgage',              5.30, '360'),
('base_rate',    'Auto',                  5.20, '84'),
('base_rate',    'SME',                   6.80, '120'),
('base_rate',    'Personal',              6.50, '60'),
('risk_spread',  'Very Low',              0.10, NULL),
('risk_spread',  'Low',                   0.55, NULL),
('risk_spread',  'Moderate',              1.40, NULL),
('risk_spread',  'Elevated',              2.60, NULL),
('risk_spread',  'High',                  NULL, 'Not priceable - decline'),
('risk_spread',  'Very High',             NULL, 'Not priceable - decline'),
('ltv_adj',      '0-60',                  0.00, NULL),
('ltv_adj',      '61-70',                 0.10, NULL),
('ltv_adj',      '71-80',                 0.25, NULL),
('ltv_adj',      '81-90',                 0.35, NULL),
('ltv_adj',      '91-100',                0.60, NULL),
('security_adj', 'Secured',               0.00, NULL),
('security_adj', 'Unsecured',             2.50, NULL),
('covenant',     'Mortgage',              NULL, 'Escrow taxes and insurance; owner-occupancy certification'),
('covenant',     'Auto',                  NULL, 'Comprehensive and collision insurance'),
('covenant',     'SME',                   NULL, 'Minimum DSCR 1.25x; quarterly financial statements'),
('covenant',     'Personal',              NULL, 'None'),
('condition',    'Mortgage',              NULL, 'Clear title and lien perfection; hazard insurance binder'),
('condition',    'Auto',                  NULL, 'Lien recorded on vehicle title'),
('condition',    'SME',                   NULL, 'Personal guarantee from principals'),
('condition',    'Personal',              NULL, 'Standard closing conditions'),
('ecoa_reason',  'insufficient_credit',   NULL, 'Credit score below minimum requirement'),
('ecoa_reason',  'serious_delinquency',   NULL, 'Delinquent past or present credit obligations'),
('ecoa_reason',  'high_utilization',      NULL, 'Excessive obligations in relation to credit limits'),
('ecoa_reason',  'insufficient_history',  NULL, 'Length of credit history is insufficient'),
('ecoa_reason',  'prior_bankruptcy',      NULL, 'Bankruptcy or public record on file'),
('ecoa_reason',  'dti_exceeds_limit',     NULL, 'Excessive obligations in relation to income'),
('ecoa_reason',  'income_unverified',     NULL, 'Unable to verify income'),
('ecoa_reason',  'insufficient_collateral', NULL, 'Value or type of collateral not sufficient'),
('ecoa_reason',  'exceeds_risk_appetite', NULL, 'Application does not meet credit policy standards'),
('ecoa_reason',  'sanctions_hit',         NULL, 'Unable to verify identity or account information'),
('ecoa_reason',  'id_mismatch',           NULL, 'Unable to verify identity or account information'),
('ecoa_reason',  'synthetic_identity',    NULL, 'Unable to verify identity or account information');
