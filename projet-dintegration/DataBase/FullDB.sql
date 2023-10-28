-- Seance du 09/10/2023

-- Firas Sayeb firassayeb2@gmailom
-- asma letaief asmaletaief33@gmailcom
-- ahmed zrelli ahmed000zrelli@mail.com
-- jamel.miraoui.sl@gmail.com
-- ahmed.oueslati6110@gmail.com
-- sami kechiche kechichesami@gmail.com
-- mohamed aziz khannoussi medazizkh123@gmail.com
-- mohamedaminetrimech mohamedamine.trimech@gmail.com
-- mohamed amine grami mohamedgrami32@gmail.com
-- amira youssef youssefamira964@gmail.com
-- molka baatout molkabaatout@gmail.com
-- sarra mannai sarramannai9@gmail.com
-- wiem sassi wiem.sassi.2000@gmail.com
-- mohamed chaouki zormati zormatistush445@gmail.com
-- med hamed belhaj med belhajmed2001@gmail.com
-- ali mahjoub alimahjoub047@gmail.com


Base de Données  [Scolarite]


-- Firas Sayeb firassayeb2@gmail.com

CREATE TABLE [ProfSituation](
	[CodeProf] [int] NOT NULL PRIMARY KEY,
	[Sess] [int] NOT NULL,
	[Situation] [varchar](35) NULL,
	[Grade] [varchar](25) NULL,
)
	
-- asma letaief asmaletaief33@gmail.com

CREATE TABLE [session](
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Annee] [char](5) NOT NULL,
	[Sem] [char](1) NOT NULL,
	[Debut] [datetime] NULL,
	[Fin] [datetime] NULL,
	[Debsem] [datetime] NULL,
	[Finsem] [datetime] NULL,
	[Annea] [char](5) NULL,
	[Anneab] [char](5) NULL,
	[SemAb] [char] NULL,
 )


-- ahmed zrelli ahmed000zrelli@mail.com

CREATE TABLE [gouvernorats](
	[gouv] [varchar](20) NULL PRIMARY KEY
        codpostal int 
        
)


--  jamel.miraoui.sl@gmail.com


CREATE TABLE [RatVol](
	[NumRatV] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[MatProf] [smallint] NOT NULL,
	[DateRat] [datetime] NOT NULL,
	[Seance] [char](10) NOT NULL,
	[Session] [int] NOT NULL,
	[Salle] [char](10) NOT NULL,
	[Jour] [char](10) NOT NULL,
	[CodeClasse] [char](9) NULL,
	[CodeMatiere] [char](10) NULL,
	[Etat] [bit] NOT NULL,
)




-- ahmed.oueslati6110@gmail.com

CREATE TABLE [Etudiant](
	[Nom] [char](25) NULL CONSTRAINT [DF_Etudiant_Nom]  DEFAULT (0),
	[DateNais] [datetime] NULL,
	[NCIN] [char](10) NOT NULL unique,
	[NCE] [char](15) NULL PRIMARY KEY,
	[TypBac] [char](20) NULL,
	[Prénom] [char](25) NULL,
	[Sexe] [int] NULL,
	[LieuNais] [char](60) NULL,
	[Adresse] [char](100) NULL,
	[Ville] [char](30) NULL,
	[CodePostal] [smallint] NULL,
	[N°Tél] [char](10) NULL,
	[CodClasse] [char](9) NULL foreign key,
	[Décision du Conseil] [char](12) NULL,
	[Année Unversitaire] [char](5) NULL,
	[Semestre] [tinyint] NULL,
	[Dispenser] [bit] NOT NULL,
	[Annees opt] [smalldatetime] NULL,
	[Date Première Inscp] [smalldatetime] NULL,
	[Gouvernorat] [char](12) NULL,
	[Mention du Bac] [char](12) NULL,
	[Nationalité] [char](25) NULL,
	[Code CNSS] [char](3) NULL,
	[NomArabe] [char](25) NULL,
	[PrenomArabe] [char](25) NULL,
	[LieuNaisArabe] [char](60) NULL,
	[AdresseArabe] [char](100) NULL,
	[VilleArabe] [char](30) NULL,
	[GouvernoratArabe] [char](15) NULL,
	[TypeBacAB] [char](15) NULL,
	[Photo] [char](10) NULL,
	[Origine] [char](20) NULL,
	[SituationDpart] [char](25) NULL,
	[NBAC] [char](12) NULL,
	[Redaut] [tinyint] NULL,
)



CREATE TABLE [OptioNiveau](
	[Option] [char](55) NOT NULL,
	[Niveau] [char](12) NOT NULL,
 CONSTRAINT [PK_OptioNiveau] PRIMARY KEY NONCLUSTERED 

--  sami kechiche kechichesami@gmail.com

CREATE TABLE [Matieres](
	[Code Matière] [char](10) NOT NULL,
	[Nom Matière] [char](50) NULL,
	[Coef Matière] [float] NULL,
	[Département] [char](55) NULL,
	[Semestre] [char](12) NULL,
	[Option] [char](55) NULL,
	[Nb Heure CI] [real] NULL,
	[Nb Heure TP] [real] NULL,
	[TypeLabo] [char](13) NULL,
	[Bonus] [real] NULL,
	[Catègories] [char](35) NULL,
	[SousCatégories] [char](35) NULL,
	[DateDeb] [smalldatetime] NULL,
	[DateFin] [smalldatetime] NULL,
 CONSTRAINT [PK_Matieres] PRIMARY KEY NONCLUSTERED 
)


-- mohamed aziz khannoussi medazizkh123@gmail.com

CREATE TABLE [Departements](
	[Département] [char](55) NOT NULL,
	[Responsable] [char](50) NULL,
	[MatProf] [char](10) NULL,
	[DepartementARAB] [char](55) NULL,
	[CodeDep] [char](2) NULL PRIMARY KEY,
)

-- mohamedaminetrimech mohamedamine.trimech@gmail.com

CREATE TABLE [Jours](
	[N°] [int] NOT NULL,
	[Lundi] [char](10) NULL,
	[Mardi] [char](10) NULL,
	[Mercredi] [char](10) NULL,
	[Jeudi] [char](10) NULL,
	[Vendredi] [char](10) NULL,
	[Samedi] [char](10) NULL,
	[Code Prof] [smallint] NULL,
 CONSTRAINT [PK_Jours] PRIMARY KEY NONCLUSTERED 
)


-- mohamed amine grami mohamedgrami32@gmail.com

CREATE TABLE [Options](
	[Option] [char](55) NOT NULL,
	[Département] [char](55) NULL,
	[OptionAraB] [char](55) NULL,
        [CodeOption] [int] NULL,
)


-- amira youssef youssefamira964@gmail.com

CREATE TABLE [TypeLocal](
	[TypeLocal] [nvarchar](25) NOT NULL,
	[Gategorie] [nvarchar](25) NULL,
 CONSTRAINT [PK_TypeLocal] PRIMARY KEY CLUSTERED 
)

-- molka baatout molkabaatout@gmail.com

CREATE TABLE [SEANCES](
	[SEANCE] [char](3) NOT NULL,
	[Horaire] [char](13) NULL,
	[HDeb] [char](10) NULL,
	[HFin] [char](10) NULL,
 CONSTRAINT [PK_SEANCES] PRIMARY KEY NONCLUSTERED 
)


-- sarra mannai sarramannai9@gmail.com

CREATE TABLE [sess](
	[Numero] [int] NOT NULL,
	[Annee] [char](5) NULL,
	[Sem] [char](1) NULL,
	[Debut] [datetime] NULL,
	[Fin] [datetime] NULL,
	[Debsem] [datetime] NULL,
	[Finsem] [datetime] NULL,
	[NSemSesdeb] [int] NOT NULL,
	[NSemSesFin] [int] NOT NULL,
	[Ann4] [char](9) NULL,
	[Ann4ab] [char](9) NULL,
	[SemAb] [char](10) NULL,
 CONSTRAINT [PK_sess] PRIMARY KEY NONCLUSTERED 
)


-- wiem sassi wiem.sassi.2000@gmail.com

CREATE TABLE [Grades](
	[Grade] [char](25) NOT NULL,
	[ChargeTP] [real] NULL,
	[ChargeC] [real] NULL,
	[ChargeTD] [real] NULL,
	[GradeArab] [char](25) NULL,
	[ChargeCI] [real] NULL,
	[ChargeTotal] [real] NULL,
 CONSTRAINT [PK_Grade_1] PRIMARY KEY NONCLUSTERED 
)



-- mohamed chaouki zormati zormatistush445@gmail.com


CREATE TABLE [Semaine](
	[NumSem] [int] NOT NULL,
	[DateDebut] [datetime] NULL,
	[DateFin] [datetime] NULL,
	[Session] [int] NOT NULL,
 )



-- med hamed belhaj med belhajmed2001@gmail.com

CREATE TABLE [Inscriptions](
	[CodeClasse] [char](9) NOT NULL,
	[MatEtud] [char](10) NOT NULL,
	[Session] [int] NOT NULL,
	[DateInscription] [smalldatetime] NULL,
	[DecisionConseil] [char](12) NULL CONSTRAINT [DF_Inscriptions_DecisionConseil]  DEFAULT ('*****'),
	[Rachat] [bit] NOT NULL CONSTRAINT [DF_Inscriptions_Rachat]  DEFAULT (0),
	[MoyGen] [real] NULL,
	[Dispense] [bit] NOT NULL CONSTRAINT [DF_Inscriptions_Dispense]  DEFAULT (0),
	[TauxAbsences] [float] NULL,
	[Redouble] [bit] NOT NULL CONSTRAINT [DF_Inscriptions_Redouble]  DEFAULT (0),
	[StOuv] [varchar](20) NULL,
	[StTech] [char](20) NULL,
	[TypeInscrip] [char](7) NULL CONSTRAINT [DF_Inscriptions_TypeInscrip]  DEFAULT ('NR'),
	[MontantIns] [char](13) NULL,
	[NumIns] [numeric](6, 0) IDENTITY(100000,1) NOT NULL,
	[Remarque] [char](20) NULL,
	[Sitfin] [char](20) NULL,
	[Montant] [numeric](18, 0) NULL,
	[NoteSO] [real] NULL,
	[NoteST] [real] NULL,
 )


-- ali mahjoub alimahjoub047@gmail.com

CREATE TABLE [DossierEtud](
	[Ndossier] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Motif] [nvarchar](50) NULL,
	[MatEtud] [char](10) NULL,
	[TypePiece] [int] NULL,
	[DatePiece] [smalldatetime] NULL,
	[Session] [int] NULL,
        [nomfichierpiece] [varchar](50) NULL,
)



CREATE TABLE [Piece](
	[Typepiece] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[LibPiece] [nvarchar](50) NULL,
)




CREATE TABLE [JSSD](
	[Jour] [char](10) NOT NULL,
	[Séance] [char](3) NOT NULL,
	[Salle] [char](10) NOT NULL,
	[NDist] [int] NOT NULL,
	[Groupe] [char](3) NOT NULL,
)



CREATE TABLE [Cellules](
	[NumProf] [smallint] NULL,
	[NumMat] [char](10) NULL,
	[NumCell] [int] IDENTITY(1,1) NOT NULL,
	[NumSession] [int] NULL,
 )




CREATE TABLE [JSSold](
	[Jour] [char](10) NOT NULL,
	[Séance] [char](3) NOT NULL,
	[Salle] [char](10) NOT NULL,
	[Code Classe] [char](9) NULL,
	[code  Prof] [smallint] NULL,
	[code Matière] [char](10) NULL,
	[Type Séance] [char](10) NULL,
	[Groupe] [char](3) NULL,
	[Activité] [char](50) NULL,
	[Session] [int] NOT NULL,
)



CREATE TABLE [ActionMembres](
	[NumAction] [int] NOT NULL,
	[NumProf] [smallint] NOT NULL,
	[DatePart] [datetime] NOT NULL,
	[Qualité] [nvarchar](20) NULL,
	[Dpt] [char](55) NULL,
	[Opt] [char](55) NULL,
	[Niveau] [char](12) NULL,
	[CodeMat] [char](10) NULL,
	[Remarque] [nvarchar](30) NULL,
 )




CREATE TABLE [Classe](
	[CodClasse] [char](9) NOT NULL,
	[IntClasse] [char](60) NULL,
	[Département] [char](55) NULL,
	[Option] [char](55) NULL,
	[Niveau] [char](12) NULL,
	[IntCalsseArabB] [char](60) NULL,
	[OptionAaraB] [char](55) NULL,
	[DepartementAaraB] [char](55) NULL,
	[NiveauAaraB] [char](10) NULL,
	[CodeEtape] [varchar](8) NULL,
	[CodeSalima] [nvarchar](15) NULL,
)




CREATE TABLE [Salle](
	[Salle] [char](20) NOT NULL,
	[Département] [char](55) NULL,
	[Catégorie] [char](12) NULL,
	[Responsable] [char](10) NULL,
	[Charge] [tinyint] NULL,
	[Nb Place Examen] [tinyint] NULL,
	[Nb Lignes] [tinyint] NULL,
	[NB Col] [tinyint] NULL,
	[NB Surv] [smallint] NULL,
	[Type] [nvarchar](25) NULL,
	[Disponible] [bit] NOT NULL CONSTRAINT [DF_Salle_Disponible]  DEFAULT (1),
 )




CREATE TABLE [Matière](
	[Code Matière] [char](10) NOT NULL,
	[Sess] [int] NOT NULL,
	[Nom Matière] [char](50) NULL,
	[Coef Matière] [float] NULL,
	[Département] [char](55) NULL,
	[Semestre] [char](12) NULL,
	[Option] [char](55) NULL,
	[Nb Heure CI] [real] NULL,
	[Nb Heure TP] [real] NULL,
	[TypeLabo] [nvarchar](25) NULL,
	[Bonus] [real] NULL,
	[Catègories] [char](35) NULL,
	[SousCatégories] [char](35) NULL,
	[DateDeb] [smalldatetime] NULL,
	[DateFin] [smalldatetime] NULL,
	[session] [int] NOT NULL,
	[Responsable] [smallint] NULL,
	[C] [real] NULL,
	[TD] [real] NULL,
 )




CREATE TABLE [dbo].[MembreCell](
	[NumCell] [int] NOT NULL,
	[NumProf] [smallint] NOT NULL,
 )



CREATE TABLE [Repartition](
	[Numdist] [int] IDENTITY(1,1) NOT NULL,
	[NumSes] [int] NOT NULL,
	[NSemDeb] [int] NOT NULL,
	[NSemFin] [int] NOT NULL,
	[TypeSeance] [char](10) NOT NULL,
	[NbGrp] [real] NOT NULL,
	[NBHDT] [real] NULL,
	[CodeClasse] [char](9) NOT NULL,
	[CodeProf] [smallint] NOT NULL,
	[CodeMat] [char](10) NOT NULL,
	[NBHD] [real] NOT NULL,
	[TypeGest] [char](12) NOT NULL,
)




CREATE TABLE [ModifGrade](
	[NGmodif] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](30) NULL,
	[DateNomin] [smalldatetime] NULL,
	[MatProf] [smallint] NULL,
 
)





CREATE TABLE [AbsEnsg](
	[NumAbs] [int] IDENTITY(1,1) NOT NULL,
	[MatriculeProf] [smallint] NOT NULL,
	[Session] [int] NOT NULL,
	[DateAbs] [datetime] NOT NULL,
	[Seance] [char](10) NOT NULL,
	[Motif] [char](60) NULL,
	[TypeSeance] [char](10) NULL,
	[CodeClasse] [char](9) NULL,
	[CodeMatiere] [char](10) NULL,
	[Justifier] [bit] NOT NULL CONSTRAINT [DF_AbsEnsg_Justifier]  DEFAULT (0),
 )




CREATE TABLE [HeureSup](
	[Session] [int] NOT NULL,
	[MatProf] [smallint] NOT NULL,
	[CI] [real] NULL,
	[TP] [real] NULL,
	[Tot] [real] NULL,
 )




CREATE TABLE [Conges](
	[NumConge] [int] IDENTITY(1,1) NOT NULL,
	[MatriculeProf] [smallint] NULL,
	[DateDeb] [datetime] NULL,
	[DateFin] [char](10) NULL,
)




CREATE TABLE [Prof](
	[Matricule Prof] [smallint] NOT NULL,
	[Nom] [char](50) NULL,
	[Prénom] [char](50) NULL,
	[CIN ou Passeport] [char](15) NULL,
	[Identifiant CNRPS] [char](15) NULL,
	[Date de naissance] [smalldatetime] NULL,
	[Nationalité] [char](20) NULL,
	[Sexe (M/F)] [char](1) NULL,
	[Date  Ent Adm] [smalldatetime] NULL,
	[Date Ent Etbs] [smalldatetime] NULL,
	[Diplôme] [char](30) NULL,
	[Adresse] [char](50) NULL,
	[Ville] [char](50) NULL,
	[Code postal] [smallint] NULL,
	[N° Téléphone] [char](16) NULL,
	[Grade] [char](25) NULL,
	[Date de nomination dans le grade] [smalldatetime] NULL,
	[Date de titulirisation] [smalldatetime] NULL,
	[N° Poste] [char](10) NULL,
	[Département] [char](55) NULL,
	[Situation] [char](35) NULL,
	[Spécialité] [char](35) NULL,
	[N° de Compte] [char](30) NULL,
	[Banque] [char](15) NULL,
	[Agence] [char](35) NULL,
	[Adr pendant les vacances] [char](50) NULL,
	[Tél pendant les vacances] [char](16) NULL,
	[Lieu de naissance] [char](25) NULL,
	[Début du Contrat] [smalldatetime] NULL,
	[Fin du Contrat] [smalldatetime] NULL,
	[Type de Contrat] [char](5) NULL,
	[NB contrat ISETSOUSSE] [tinyint] NULL,
	[NB contrat Autre Etb] [char](10) NULL,
	[Bureau] [char](10) NULL,
	[Email] [char](60) NULL,
	[Email Interne] [char](60) NULL,
	[NomArabe] [char](35) NULL,
	[PrenomArabe] [char](25) NULL,
	[LieuNaisArabe] [char](20) NULL,
	[AdresseArabe] [char](50) NULL,
	[VilleArabe] [char](25) NULL,
	[Disponible] [char](10) NULL CONSTRAINT [DF_Prof_Disponible]  DEFAULT ('oui'),
	[SousSP] [char](35) NULL,
	[EtbOrigine] [char](50) NULL,
	[TypeEnsg] [char](30) NULL,
	[ControlAcces] [char](11) NULL,
)
