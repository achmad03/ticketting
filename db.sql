/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - dbticketting
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbticketting` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbticketting`;

/*Table structure for table `desa` */

DROP TABLE IF EXISTS `desa`;

CREATE TABLE `desa` (
  `desa_id` int(11) NOT NULL AUTO_INCREMENT,
  `desa_nama` varchar(50) DEFAULT NULL,
  `desa_alamat` varchar(70) DEFAULT NULL,
  `desa_koordinat` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`desa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `desa` */

insert  into `desa`(`desa_id`,`desa_nama`,`desa_alamat`,`desa_koordinat`) values 
(1,'Desa 1','Wukirsari 1','0,0'),
(2,'Desa 2','Wukirsari 2','1,1'),
(3,'Desa 3','Wukirsari 3','2,2'),
(4,'Desa 4','Wukirsari 4','3,3'),
(5,'Desa 5','Wukirsari 5','4,4'),
(6,'Desa 6','Wukirsari 6','5,5'),
(7,'Desa 7','Wukirsari 7','6,6');

/*Table structure for table `galeri` */

DROP TABLE IF EXISTS `galeri`;

CREATE TABLE `galeri` (
  `galeri_id` int(11) NOT NULL AUTO_INCREMENT,
  `galeri_letak` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`galeri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `galeri` */

insert  into `galeri`(`galeri_id`,`galeri_letak`) values 
(1,'galeri/objek/foto1.jpeg'),
(2,'galeri/objek/foto2.jpg'),
(3,'galeri/objek/foto3.jpg'),
(4,'galeri/objek/foto4.jpg'),
(5,'galeri/objek/foto5.jpg'),
(6,'galeri/objek/foto6.jpg'),
(7,'galeri/objek/foto7.jpg'),
(8,'galeri/objek/foto8.jpg');

/*Table structure for table `layanan` */

DROP TABLE IF EXISTS `layanan`;

CREATE TABLE `layanan` (
  `layanan_id` int(11) NOT NULL AUTO_INCREMENT,
  `layanan_objek_id` int(11) DEFAULT NULL,
  `layanan_nama` varchar(40) DEFAULT NULL,
  `layanan_deskripsi` varchar(70) DEFAULT NULL,
  `layanan_biaya` float DEFAULT NULL,
  `layanan_souvenir` varchar(40) DEFAULT NULL,
  `layanan_pemandu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`layanan_id`),
  KEY `fk_layanan_objek` (`layanan_objek_id`),
  CONSTRAINT `fk_layanan_objek` FOREIGN KEY (`layanan_objek_id`) REFERENCES `objek` (`objek_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `layanan` */

insert  into `layanan`(`layanan_id`,`layanan_objek_id`,`layanan_nama`,`layanan_deskripsi`,`layanan_biaya`,`layanan_souvenir`,`layanan_pemandu`) values 
(1,1,'Layanan 1','layanan/layanan1.txt',20000,'Gantungan Kunci','Pemandu 4'),
(2,1,'Layanan 2','layanan/layanan2.txt',15000,'Batik','Pemandu 1'),
(3,2,'Layanan 3','layanan/layanan3.txt',25000,'Gantungan Kunci','Pemandu 5'),
(4,2,'Layanan 4','layanan/layanan4.txt',10000,'Batik','Pemandu 2'),
(5,3,'Layanan 5','layanan/layanan5.txt',30000,'Gantungan Kunci','Pemandu 6'),
(6,3,'Layanan 6','layanan/layanan6.txt',40000,'Gantungan Kunci','Pemandu 7'),
(7,4,'Layanan 7','layanan/layanan7.txt',50000,'Batik','Pemandu 3');

/*Table structure for table `objek` */

DROP TABLE IF EXISTS `objek`;

CREATE TABLE `objek` (
  `objek_id` int(11) NOT NULL AUTO_INCREMENT,
  `objek_desa_id` int(11) DEFAULT NULL,
  `objek_galeri_id` int(11) DEFAULT NULL,
  `objek_nama` varchar(50) DEFAULT NULL,
  `objek_alamat` varchar(50) DEFAULT NULL,
  `objek_letakDeskripsi` varchar(70) DEFAULT NULL,
  `objek_biaya` float DEFAULT NULL,
  PRIMARY KEY (`objek_id`),
  KEY `fk_objek_desa` (`objek_desa_id`),
  KEY `fk_objek_galeri` (`objek_galeri_id`),
  CONSTRAINT `fk_objek_desa` FOREIGN KEY (`objek_desa_id`) REFERENCES `desa` (`desa_id`),
  CONSTRAINT `fk_objek_galeri` FOREIGN KEY (`objek_galeri_id`) REFERENCES `galeri` (`galeri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `objek` */

insert  into `objek`(`objek_id`,`objek_desa_id`,`objek_galeri_id`,`objek_nama`,`objek_alamat`,`objek_letakDeskripsi`,`objek_biaya`) values 
(1,1,1,'Objek 1 1',NULL,'objek/objek11.txt',30000),
(2,2,2,'Objek 2 1',NULL,'objek/objek21.txt',20000),
(3,3,3,'Objek 3 1',NULL,'objek/objek31.txt',15000),
(4,4,4,'Objek 4 1',NULL,'objek/objek41.txt',40000),
(5,5,5,'Objek 5 1',NULL,'objek/objek51.txt',50000),
(6,1,6,'Objek 1 2',NULL,'objek/objek12.txt',30000),
(7,2,1,'Objek 2 2',NULL,'objek/objek22.txt',20000),
(8,3,2,'Objek 3 2',NULL,'objek/objek32.txt',15000),
(9,1,3,'Objek 1 3',NULL,'objek/objek13.txt',20000),
(10,2,4,'Objek 2 3',NULL,'objek/objek23.txt',25000);

/*Table structure for table `paket` */

DROP TABLE IF EXISTS `paket`;

CREATE TABLE `paket` (
  `paket_id` int(11) NOT NULL AUTO_INCREMENT,
  `paket_nama` varchar(40) DEFAULT NULL,
  `paket_letakDeskripsi` varchar(70) DEFAULT NULL,
  `paket_biaya` float DEFAULT NULL,
  PRIMARY KEY (`paket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `paket` */

insert  into `paket`(`paket_id`,`paket_nama`,`paket_letakDeskripsi`,`paket_biaya`) values 
(1,'Paket 1','paket/isi1.txt',300000),
(2,'Paket 2','paket/isi2.txt',400000),
(3,'Paket 3','paket/isi3.txt',500000),
(4,'Paket 4','paket/isi4.txt',200000),
(5,'Paket 5','paket/isi5.txt',500000);

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT,
  `pembayaran_tiket_id` int(11) DEFAULT NULL,
  `pembayaran_tglBayar` date DEFAULT NULL,
  `pembayaran_metode` varchar(20) DEFAULT NULL,
  `pembayaran_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pembayaran_id`),
  KEY `fk_pembayaran_tiket` (`pembayaran_tiket_id`),
  CONSTRAINT `fk_pembayaran_tiket` FOREIGN KEY (`pembayaran_tiket_id`) REFERENCES `tiket` (`tiket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

/*Table structure for table `pengelola` */

DROP TABLE IF EXISTS `pengelola`;

CREATE TABLE `pengelola` (
  `pengelola_id` int(11) NOT NULL AUTO_INCREMENT,
  `pengelola_objek_id` int(11) DEFAULT NULL,
  `pengelola_nama` varchar(50) DEFAULT NULL,
  `pengelola_alamat` varchar(70) DEFAULT NULL,
  `pengelola_noTelepon` varchar(20) DEFAULT NULL,
  `pengelola_jenisKelamin` char(1) DEFAULT NULL,
  `pengelola_role` char(1) DEFAULT NULL,
  `pengelola_user` varchar(50) DEFAULT NULL,
  `pengelola_pass` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pengelola_id`),
  KEY `fk_pengelola_objek` (`pengelola_objek_id`),
  CONSTRAINT `fk_pengelola_desa` FOREIGN KEY (`pengelola_objek_id`) REFERENCES `desa` (`desa_id`),
  CONSTRAINT `fk_pengelola_objek` FOREIGN KEY (`pengelola_objek_id`) REFERENCES `objek` (`objek_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `pengelola` */

insert  into `pengelola`(`pengelola_id`,`pengelola_objek_id`,`pengelola_nama`,`pengelola_alamat`,`pengelola_noTelepon`,`pengelola_jenisKelamin`,`pengelola_role`,`pengelola_user`,`pengelola_pass`) values 
(1,1,'Pengelola 1','Alamat 1','089712431243','L','1','user1','user1'),
(2,1,'Pengelola 2','Alamat 2','089712431243','L','1','user2','user1'),
(3,2,'Pengelola 3','Alamat 3','089712431243','L','1','user3','user1'),
(4,2,'Pengelola 4','Alamat 4','089712431243','P','2','user4','user1'),
(5,3,'Pengelola 5','Alamat 5','089712431243','P','3','user5','user1'),
(6,3,'Pengelola 6','Alamat 6','089712431243','P','1','user6','user1'),
(7,3,'Pengelola 7','Alamat 7','089712431243','P','1','user7','user1'),
(8,4,'Pengelola 8','Alamat 8','089712431243','L','1','user8','user1'),
(9,4,'Pengelola 9','Alamat 9','089712431243','L','2','user9','user1');

/*Table structure for table `pengunjung` */

DROP TABLE IF EXISTS `pengunjung`;

CREATE TABLE `pengunjung` (
  `pengunjung_id` int(11) NOT NULL AUTO_INCREMENT,
  `pengunjung_nama` varchar(50) DEFAULT NULL,
  `pengunjung_alamat` varchar(70) DEFAULT NULL,
  `pengunjung_noTelepon` varchar(20) DEFAULT NULL,
  `pengunjung_jenisKelamin` char(1) DEFAULT NULL,
  PRIMARY KEY (`pengunjung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `pengunjung` */

insert  into `pengunjung`(`pengunjung_id`,`pengunjung_nama`,`pengunjung_alamat`,`pengunjung_noTelepon`,`pengunjung_jenisKelamin`) values 
(1,'Pengunjung 1','Alamat 1','089162736282','L'),
(2,'Pengunjung 2','Alamat 2','089162736282','L'),
(3,'Pengunjung 3','Alamat 3','089162736282','P'),
(4,'Pengunjung 4','Alamat 4','089162736282','P'),
(5,'Pengunjung 5','Alamat 5','089162736282','P');

/*Table structure for table `rencana` */

DROP TABLE IF EXISTS `rencana`;

CREATE TABLE `rencana` (
  `rencana_id` int(11) NOT NULL AUTO_INCREMENT,
  `rencana_pengunjung_id` int(11) DEFAULT NULL,
  `rencana_nama` varchar(40) DEFAULT NULL,
  `rencana_tglBuat` date DEFAULT NULL,
  `rencana_tglPelaksana` date DEFAULT NULL,
  `rencana_jenis` char(1) DEFAULT NULL,
  `rencana_maksPeserta` int(11) DEFAULT NULL,
  PRIMARY KEY (`rencana_id`),
  KEY `fk_rencana_pengunjung` (`rencana_pengunjung_id`),
  CONSTRAINT `fk_rencana_pengunjung` FOREIGN KEY (`rencana_pengunjung_id`) REFERENCES `pengunjung` (`pengunjung_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rencana` */

/*Table structure for table `respon` */

DROP TABLE IF EXISTS `respon`;

CREATE TABLE `respon` (
  `respon_id` int(11) NOT NULL AUTO_INCREMENT,
  `respon_tiket_id` int(11) DEFAULT NULL,
  `respon_galeri_id` int(11) DEFAULT NULL,
  `respon_prosentase` float DEFAULT NULL,
  `respon_alias` varchar(40) DEFAULT NULL,
  `respon_letakRespon` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`respon_id`),
  KEY `fk_respon_tiket` (`respon_tiket_id`),
  KEY `fk_respon_galeri` (`respon_galeri_id`),
  CONSTRAINT `fk_respon_galeri` FOREIGN KEY (`respon_galeri_id`) REFERENCES `galeri` (`galeri_id`),
  CONSTRAINT `fk_respon_tiket` FOREIGN KEY (`respon_tiket_id`) REFERENCES `tiket` (`tiket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `respon` */

/*Table structure for table `rincpaket` */

DROP TABLE IF EXISTS `rincpaket`;

CREATE TABLE `rincpaket` (
  `rincPaket_id` int(11) NOT NULL AUTO_INCREMENT,
  `rincPaket_paket_id` int(11) DEFAULT NULL,
  `rincPaket_objek_id` int(11) DEFAULT NULL,
  `rincPaket_biaya` float DEFAULT NULL,
  PRIMARY KEY (`rincPaket_id`),
  KEY `fk_rincPaket_objek` (`rincPaket_objek_id`),
  KEY `fk_rincPaket_paket` (`rincPaket_paket_id`),
  CONSTRAINT `fk_rincPaket_objek` FOREIGN KEY (`rincPaket_objek_id`) REFERENCES `objek` (`objek_id`),
  CONSTRAINT `fk_rincPaket_paket` FOREIGN KEY (`rincPaket_paket_id`) REFERENCES `paket` (`paket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `rincpaket` */

insert  into `rincpaket`(`rincPaket_id`,`rincPaket_paket_id`,`rincPaket_objek_id`,`rincPaket_biaya`) values 
(1,1,1,40000),
(2,1,2,30000),
(3,2,3,50000),
(4,2,4,20000),
(5,3,5,100000),
(6,4,6,200000);

/*Table structure for table `rincrencana` */

DROP TABLE IF EXISTS `rincrencana`;

CREATE TABLE `rincrencana` (
  `rincRencana_id` int(11) NOT NULL AUTO_INCREMENT,
  `rincRencana_rencana_id` int(11) DEFAULT NULL,
  `rincRencana_objek_id` int(11) DEFAULT NULL,
  `rincRencana_biaya` float DEFAULT NULL,
  `rincRencana_maksPengunjung` int(11) DEFAULT NULL,
  PRIMARY KEY (`rincRencana_id`),
  KEY `fk_rincRencana_rencana` (`rincRencana_rencana_id`),
  KEY `fk_rincRencana_objek` (`rincRencana_objek_id`),
  CONSTRAINT `fk_rincRencana_objek` FOREIGN KEY (`rincRencana_objek_id`) REFERENCES `objek` (`objek_id`),
  CONSTRAINT `fk_rincRencana_rencana` FOREIGN KEY (`rincRencana_rencana_id`) REFERENCES `rencana` (`rencana_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rincrencana` */

/*Table structure for table `tiket` */

DROP TABLE IF EXISTS `tiket`;

CREATE TABLE `tiket` (
  `tiket_id` int(11) NOT NULL AUTO_INCREMENT,
  `tiket_pengunjung_id` int(11) DEFAULT NULL,
  `tiket_tglPesan` date DEFAULT NULL,
  `tiket_totalBiaya` float DEFAULT NULL,
  `tiket_jumlah` int(11) DEFAULT NULL,
  `tiket_totalDiskon` float DEFAULT NULL,
  PRIMARY KEY (`tiket_id`),
  KEY `fk_tiket_pengunjung` (`tiket_pengunjung_id`),
  CONSTRAINT `fk_tiket_pengunjung` FOREIGN KEY (`tiket_pengunjung_id`) REFERENCES `pengunjung` (`pengunjung_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tiket` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
