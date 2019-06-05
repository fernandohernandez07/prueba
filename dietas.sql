/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     3/6/2019 01:14:40                            */
/*==============================================================*/


drop table if exists CITA;

drop table if exists DATOSATROPOMETRICOS;

drop table if exists DIETA;

drop table if exists EXAMEN;

drop table if exists EXPEDIENTE;

drop table if exists NUTRICIONISTA;

drop table if exists PACIENTE;

drop table if exists PATOLOGIA;

drop table if exists REQUERIMIENTO;

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA
(
   IDCITA               int not null,
   CODIGOEXP            int,
   FECHACITAANT         date not null,
   FECHACITASIG         date not null,
   primary key (IDCITA)
);

/*==============================================================*/
/* Table: DATOSATROPOMETRICOS                                   */
/*==============================================================*/
create table DATOSATROPOMETRICOS
(
   IDANT                int not null,
   CODIGOEXP            int,
   ALTUTE               float(5) not null,
   PESOPRECONC          float(5) not null,
   PESONAC              float(5) not null,
   ALTNAC               float(5) not null,
   PESOACTUAL           float(5) not null,
   ALTACTUAL            float(5) not null,
   CIRCUBRAZO           float(5) not null,
   CIRCUCARPO           float(5) not null,
   PERICEFA             float(5) not null,
   PERICINT             float(5) not null,
   PERICAD              float(5) not null,
   IMC                  float(5) not null,
   primary key (IDANT)
);

/*==============================================================*/
/* Table: DIETA                                                 */
/*==============================================================*/
create table DIETA
(
   IDDIETA              int not null,
   CODIGOEXP            int,
   DESAYUNO             varchar(100) not null,
   REFMATUTINO          varchar(100) not null,
   ALMUERZO             varchar(100) not null,
   REFVESPERTINO        varchar(100) not null,
   CENA                 varchar(100) not null,
   primary key (IDDIETA)
);

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN
(
   IDEXAMEN             char(10) not null,
   CODIGOEXP            int,
   TGL                  char(10) not null,
   COL                  char(10) not null,
   HDL                  char(10) not null,
   LDL                  char(10) not null,
   LINFO                char(10) not null,
   GLUCOSA              char(10) not null,
   ALBUMINA             char(10) not null,
   CREATINA             char(10) not null,
   HEMOGLOB             char(10) not null,
   ACIDOURI             char(10) not null,
   primary key (IDEXAMEN)
);

/*==============================================================*/
/* Table: EXPEDIENTE                                            */
/*==============================================================*/
create table EXPEDIENTE
(
   CODIGOEXP            int not null,
   IDEXAMEN             char(10),
   IDPAC                int,
   MEDICOREF            varchar(50) not null,
   KCALINICIO           float(5) not null,
   LIPINICIO            float(5) not null,
   primary key (CODIGOEXP)
);

/*==============================================================*/
/* Table: NUTRICIONISTA                                         */
/*==============================================================*/
create table NUTRICIONISTA
(
   IDNUT                int not null,
   NOMBRESNUT           varchar(50) not null,
   APELLIDOSNUT         varchar(50) not null,
   TURNO                char(2) not null,
   JVPM                 varchar(15) not null,
   CORREONUT            varchar(50) not null,
   TELEFONONUT          varchar(9) not null,
   USUARIO              varchar(25) not null,
   PASS                 varchar(50) not null,
   primary key (IDNUT)
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE
(
   IDPAC                int not null,
   IDNUT                int,
   NOMBREPAC            varchar(50) not null,
   APELLIDOSPAC         char(50) not null,
   EDAD                 int not null,
   FECHANAC             date not null,
   ESTADOCIVIL          varchar(25) not null,
   OCUPACION            varchar(30) not null,
   TELEFONOPAC          varchar(9) not null,
   CORREOPAC            varchar(50) not null,
   primary key (IDPAC)
);

/*==============================================================*/
/* Table: PATOLOGIA                                             */
/*==============================================================*/
create table PATOLOGIA
(
   IDPAT                int not null,
   CODIGOEXP            int,
   NOMBRE               varchar(50) not null,
   ATTRIBUTE_21         varchar(50) not null,
   primary key (IDPAT)
);

/*==============================================================*/
/* Table: REQUERIMIENTO                                         */
/*==============================================================*/
create table REQUERIMIENTO
(
   IDREQ                int not null,
   CODIGOEXP            int,
   KCALREQ              float(5) not null,
   LIPREQ               float(5) not null,
   CARBTREQ             float(5) not null,
   PROTREQ              float(5) not null,
   primary key (IDREQ)
);

alter table CITA add constraint FK_MUESTRA foreign key (CODIGOEXP)
      references EXPEDIENTE (CODIGOEXP);

alter table DATOSATROPOMETRICOS add constraint FK_CONTIENE foreign key (CODIGOEXP)
      references EXPEDIENTE (CODIGOEXP);

alter table DIETA add constraint FK_TIENE foreign key (CODIGOEXP)
      references EXPEDIENTE (CODIGOEXP);

alter table EXAMEN add constraint FK_DETALLA foreign key (CODIGOEXP)
      references EXPEDIENTE (CODIGOEXP);

alter table EXPEDIENTE add constraint FK_DETALLA2 foreign key (IDEXAMEN)
      references EXAMEN (IDEXAMEN);

alter table EXPEDIENTE add constraint FK_TENDRA foreign key (IDPAC)
      references PACIENTE (IDPAC);

alter table PACIENTE add constraint FK_ATIENDE foreign key (IDNUT)
      references NUTRICIONISTA (IDNUT);

alter table PATOLOGIA add constraint FK_CON foreign key (CODIGOEXP)
      references EXPEDIENTE (CODIGOEXP);

alter table REQUERIMIENTO add constraint FK_ES foreign key (CODIGOEXP)
      references EXPEDIENTE (CODIGOEXP);

