CREATE TABLE domains
(
    name   VARCHAR(255) PRIMARY KEY,
    expires BIGINT NOT NULL
);
CREATE TABLE networks
(
    network INTEGER PRIMARY KEY,
    indexed_block BIGINT NOT NULL
);
CREATE TABLE taxonomies
(
    singular VARCHAR(65) PRIMARY KEY,
    plural VARCHAR(65) UNIQUE
);
CREATE TABLE terms
(
    singular VARCHAR(65) PRIMARY KEY,
    plural VARCHAR(65) UNIQUE
);
CREATE TABLE domains_taxonomies
(
    domain VARCHAR(255) NOT NULL,
    taxonomy VARCHAR(65) NOT NULL,
    PRIMARY KEY(domain, taxonomy),
    FOREIGN KEY (domain) REFERENCES domains(name),
    FOREIGN KEY (taxonomy) REFERENCES taxonomies(singular)
);
CREATE TABLE terms_taxonomies
(
    term VARCHAR(255) NOT NULL,
    taxonomy VARCHAR(65) NOT NULL,
    PRIMARY KEY(term, taxonomy),
    FOREIGN KEY (term) REFERENCES terms(singular),
    FOREIGN KEY (taxonomy) REFERENCES taxonomies(singular)
);
