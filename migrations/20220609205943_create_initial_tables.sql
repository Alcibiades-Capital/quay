-- Create addresses table
CREATE TABLE addresses
(
    address TEXT PRIMARY KEY
);

CREATE TABLE domains
(
    name   TEXT PRIMARY KEY,
    expires BIGINT NOT NULL
);
CREATE TABLE networks
(
    network INTEGER PRIMARY KEY,
    indexed_block BIGINT NOT NULL
);
CREATE TABLE taxonomies
(
    singular TEXT PRIMARY KEY,
    plural TEXT UNIQUE
);
CREATE TABLE terms
(
    singular TEXT PRIMARY KEY,
    plural TEXT UNIQUE
);
CREATE TABLE domains_taxonomies
(
    domain TEXT NOT NULL,
    taxonomy TEXT NOT NULL,
    PRIMARY KEY(domain, taxonomy),
    FOREIGN KEY (domain) REFERENCES domains(name),
    FOREIGN KEY (taxonomy) REFERENCES taxonomies(singular)
);
CREATE TABLE terms_taxonomies
(
    term TEXT NOT NULL,
    taxonomy TEXT NOT NULL,
    PRIMARY KEY(term, taxonomy),
    FOREIGN KEY (term) REFERENCES terms(singular),
    FOREIGN KEY (taxonomy) REFERENCES taxonomies(singular)
);
