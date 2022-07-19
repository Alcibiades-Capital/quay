-- Create addresses table
CREATE TABLE addresses
(
    address TEXT PRIMARY KEY
);

CREATE TABLE users
(
    "user" TEXT REFERENCES addresses(address) PRIMARY KEY,
    -- TODO(Are we using ceramic here, or storing user data in a database?)
    -- Which details are valuable for us to have? Email, perhaps?
    email TEXT,
    picture TEXT,
    bio TEXT,
    twitter TEXT,
    instagram TEXT,
    webLink TEXT,
    banner TEXT
);

CREATE TABLE domains
(
    name   TEXT PRIMARY KEY,
    expires BIGINT NOT NULL,
    tokenId TEXT
);

CREATE TABLE likes
(
   "user" TEXT REFERENCES users("user"),
   domain TEXT REFERENCES domains(name),
   PRIMARY KEY(domain, "user"),
   liked BOOLEAN
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
    domain TEXT NOT NULL REFERENCES domains(name),
    taxonomy TEXT NOT NULL REFERENCES taxonomies(singular),
    PRIMARY KEY(domain, taxonomy)
);

CREATE TABLE terms_taxonomies
(
    term TEXT NOT NULL REFERENCES terms(singular),
    taxonomy TEXT NOT NULL REFERENCES taxonomies(singular),
    PRIMARY KEY(term, taxonomy)
);

CREATE TABLE ens_sales (
                           domain TEXT REFERENCES domains(name) PRIMARY KEY,
                           contract TEXT REFERENCES addresses(address),
                           orderSource TEXT,
                           fillSource TEXT,
                           orderSide TEXT,
                           fromAddr TEXT REFERENCES addresses(address),
                           toAddr TEXT REFERENCES addresses(address),
                           amount TEXT,
                           txHash TEXT,
                           timestamp DATE,
                           price TEXT,
                           saleAsset TEXT,
                           bundleId TEXT,
                           bundle BOOLEAN,
                           blockNumber BIGINT
);

-- TODO(Do we need these right now if we are using seaport?)
CREATE TABLE kodex_listings (
                                domain TEXT REFERENCES domains(name) PRIMARY KEY,
                                owner TEXT REFERENCES addresses(address),
                                buyer TEXT REFERENCES addresses(address),
                                askPrice TEXT,
                                duration TEXT,
                                active boolean,
                                executed boolean,
                                executedPrice TEXT,
                                listingTxHash TEXT,
                                executedTxHash TEXT,
                                listedAt BIGINT,
                                executedAt BIGINT,
                                delistedAt BIGINT
);

CREATE TABLE kodex_offers (
                              domain TEXT REFERENCES domains(name) PRIMARY KEY,
                              owner TEXT REFERENCES addresses(address),
                              offerer TEXT REFERENCES addresses(address),
                              offerAmount TEXT,
                              duration TEXT,
                              active boolean,
                              executed boolean,
                              executedPrice TEXT,
                              offerTxHash TEXT,
                              executedTxHash TEXT,
                              listedAt BIGINT,
                              executedAt BIGINT,
                              delistedAt BIGINT
);
