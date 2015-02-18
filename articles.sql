DROP TABLE if exists Users CASCADE;
DROP TABLE if exists Articles CASCADE;
DROP TABLE if exists Comments CASCADE;
DROP TABLE if exists Votes CASCADE;



CREATE TABLE Articles(
	ArticleID int PRIMARY KEY,
	Title text,
	Authors text,
	URL text,
	Score int
);


INSERT INTO Articles VALUES 
	(1, 'Pericytes are the progenitors of epicardial-derived smooth muscle cells in the heart', 'Volz KS, McKay A, Weissman IL, Red-Horse K', 'http://www.ncbi.nlm.nih.gov/pubmed/25037571', 1456),
	(2, 'The CD47-signal regulatory protein alpha (SIRPa) interaction is a therapeutic target for human solid tumors', 'Willingham SB, Volkmer JP, Gentles AJ, et al.', 'http://www.ncbi.nlm.nih.gov/pubmed/22451913', 271),
	(3, 'mTORC1 controls the adaptive transition of quiescent stem cells from G0 to G(Alert).', 'Rodgers JT, King KY, Brett JO, Cromie MJ, et al.', 'http://www.ncbi.nlm.nih.gov/pubmed/24870234', 113),
	(4, 'Critical components of the pluripotency network are targets for the p300/CBP interacting protein (p/CIP) in embryonic stem cells', 'Chitilian JM, Thillainadesan G, Manias JL, Chang WY, Walker E, et al.', 'http://www.ncbi.nlm.nih.gov/pubmed/24115386', 524),
	(5, 'Sox17-Mediated XEN Cell Conversion Identifies Dynamic Networks Controlling Cell-Fate Decisions in Embryo-Derived Stem Cells', 'McDonald AC, Biechele S, Rossant J, Stanford WL', 'http://www.ncbi.nlm.nih.gov/pubmed/25373912', 785),
	(6, 'Stem cell signaling. An integral program for tissue renewal and regeneration: Wnt signaling and stem cell control.', 'Clevers H, Loh KM, Nusse R', 'http://www.ncbi.nlm.nih.gov/pubmed/25278615', 807),
	(7, 'MRI-guided laser interstitial thermal therapy in neuro-oncology: a review of its current clinical applications.', 'Rahmathulla G, Recinos PF, Kamian K, Mohammadi AM, Ahluwalia MS, Barnett GH', 'http://www.ncbi.nlm.nih.gov/pubmed/24994550', 1115);

CREATE TABLE Users (
	Username VARCHAR(255) PRIMARY KEY,
	Score int
);

CREATE TABLE Comments (
	CommentID int PRIMARY KEY,
	ArticleID int REFERENCES Articles(ArticleID),
	Comment_Text text,
	Username VARCHAR(255),
	Score int
);

CREATE TABLE Votes (
	Username VARCHAR(255) REFERENCES Users(Username),
	ArticleID int REFERENCES Articles(ArticleID)
);


