DROP TABLE IF EXISTS applicant_linkage;

CREATE TABLE applicant_linkage (
    app_id                 TEXT PRIMARY KEY,
    applicant_name         TEXT,
    bureau_id              TEXT,     -- bureau's own subject identifier
    shared_address_hash    TEXT,     -- normalized address hash; equal hash = same premises
    co_applicant_id        TEXT,     -- app_id of a linked co-applicant, blank if none
    relationship_declared  TEXT,     -- Spouse | Co-borrower | Guarantor | None
    guarantor_id           TEXT,     -- shared guarantor identifier, blank if none
    prior_defaults         INTEGER,  -- defaults on record across all bureaus
    active_credit_lines    INTEGER,
    pipeline_state         TEXT      -- ACTIVE | HALTED
);
-- Identity-graph feed used by the Fraud/KYC gate for ring and linked-exposure
-- detection (lending policy 2.3). The gate DERIVES ring findings; no ring verdict
-- is stored here.
--
-- Key signal: an UNDECLARED link (relationship_declared = 'None') between applicants
-- sharing an address hash is a fraud-ring indicator. A DECLARED link (Spouse /
-- Co-borrower / Guarantor) is normal lending activity and must NOT be flagged as
-- fraud, though it still counts toward linked exposure under policy 5.3.

INSERT INTO applicant_linkage VALUES
('APP-001', 'James Smith', 'BRU-100137', 'ADDR-5C1D40', 'APP-016', 'Spouse', '', 0, 10, 'ACTIVE'),
('APP-002', 'Mary Johnson', 'BRU-100274', 'ADDR-99E7D1', '', 'None', '', 2, 3, 'ACTIVE'),
('APP-003', 'John Williams', 'BRU-100411', 'ADDR-7F3A9C', 'APP-008', 'None', 'GTR-9902', 2, 3, 'HALTED'),
('APP-004', 'Patricia Brown', 'BRU-100548', 'ADDR-A86E86', '', 'None', '', 0, 16, 'ACTIVE'),
('APP-005', 'Robert Jones', 'BRU-100685', 'ADDR-C4092D', 'APP-014', 'None', '', 1, 9, 'ACTIVE'),
('APP-006', 'Jennifer Garcia', 'BRU-100822', 'ADDR-B76777', '', 'None', '', 1, 7, 'ACTIVE'),
('APP-007', 'Michael Miller', 'BRU-100959', 'ADDR-AF8558', '', 'None', '', 0, 18, 'ACTIVE'),
('APP-008', 'Linda Davis', 'BRU-101096', 'ADDR-7F3A9C', 'APP-011', 'None', 'GTR-9902', 2, 2, 'ACTIVE'),
('APP-009', 'David Rodriguez', 'BRU-101233', 'ADDR-A41F07', '', 'Guarantor', 'GTR-1180', 0, 10, 'ACTIVE'),
('APP-010', 'Elizabeth Martinez', 'BRU-101370', 'ADDR-202B93', '', 'None', '', 0, 3, 'ACTIVE'),
('APP-011', 'William Hernandez', 'BRU-101507', 'ADDR-7F3A9C', 'APP-003', 'None', 'GTR-9902', 3, 3, 'ACTIVE'),
('APP-012', 'Barbara Lopez', 'BRU-101644', 'ADDR-40B17D', '', 'None', '', 0, 2, 'ACTIVE'),
('APP-013', 'Richard Gonzalez', 'BRU-101781', 'ADDR-2B8E11', 'APP-017', 'None', 'GTR-4471', 0, 7, 'ACTIVE'),
('APP-014', 'Susan Wilson', 'BRU-101918', 'ADDR-C4092D', 'APP-005', 'None', '', 0, 4, 'ACTIVE'),
('APP-015', 'Joseph Anderson', 'BRU-102055', 'ADDR-D7321C', '', 'None', '', 0, 12, 'ACTIVE'),
('APP-016', 'Jessica Thomas', 'BRU-102192', 'ADDR-5C1D40', 'APP-001', 'Spouse', '', 0, 9, 'ACTIVE'),
('APP-017', 'Thomas Taylor', 'BRU-102329', 'ADDR-2B8E11', 'APP-020', 'None', 'GTR-4471', 0, 7, 'ACTIVE'),
('APP-018', 'Sarah Moore', 'BRU-102466', 'ADDR-D93B26', '', 'Guarantor', 'GTR-1180', 0, 9, 'ACTIVE'),
('APP-019', 'Christopher Jackson', 'BRU-102603', 'ADDR-80C6A5', '', 'None', '', 1, 8, 'ACTIVE'),
('APP-020', 'Karen Martin', 'BRU-102740', 'ADDR-2B8E11', 'APP-013', 'None', 'GTR-4471', 0, 12, 'ACTIVE'),
('APP-021', 'Daniel Lee', 'BRU-102877', 'ADDR-94E551', '', 'None', '', 0, 11, 'ACTIVE');
