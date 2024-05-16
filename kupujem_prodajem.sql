-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 02:07 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kupujem_prodajem`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikal`
--

CREATE TABLE `artikal` (
  `artikal_id` int(11) NOT NULL,
  `artikal_ime` varchar(255) NOT NULL,
  `artikal_opis` varchar(255) NOT NULL,
  `artikal_cena` double NOT NULL,
  `artikal_boja` varchar(255) NOT NULL,
  `artikal_slika` varchar(255) NOT NULL,
  `grad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikal`
--

INSERT INTO `artikal` (`artikal_id`, `artikal_ime`, `artikal_opis`, `artikal_cena`, `artikal_boja`, `artikal_slika`, `grad_id`) VALUES
(1, 'DELL INSPIRON 3502 N5030 8GB 256GB SSD W10HOME', 'Dijagonala ekrana : 15,6\"\r\nProcesor : Intel Pentium\r\nGrafi?ka karta : Intel UHD\r\nOS : Windows 10 Home\r\nRAM memorija : 8 GB DDR4\r\nHDD : 256 GB SSD', 49999, 'crna', 'DELL INSPIRON 3502.jpg', 1),
(2, 'DELL VOSTRO 3515 AMD RYZEN 5 3450U 8GB 256GB SSD', 'Dijagonala ekrana : 15,6\"\r\nProcesor : AMD RYZEN 5\r\nGrafi?ka karta : AMD Radeon\r\nOS : Linux\r\nRAM memorija : 8 GB DDR4\r\nHDD : 256 GB SSD\r\nRezolucija ekrana : 1920 x 1080 pix\r\nMaterijal ku?ista : plastika\r\nTežina : 1,7 kg', 60861, 'crna', 'DELL VOSTRO 3515.jpg', 2),
(3, 'HP PAVILION GAMING 15-DK2067NM ', 'Dijagonala ekrana : 15,6\"\r\nProcesor : Intel Core i5\r\nGrafi?ka karta : nVidia\r\nOS : bez operativnog sistema\r\nRAM memorija : 16 GB DDR4\r\nHDD : 512 GB SSD\r\nRezolucija ekrana : 1920 x 1080 pix\r\nMaterijal ku?ista : plastika\r\nTežina : 2,23 kg', 119999, 'crna', 'HP PAVILION GAMING.jpg', 1),
(5, 'ASUS X515EA-BQ322', 'Dijagonala ekrana : 15,6\"\r\nProcesor : Intel Core i3\r\nGrafi?ka karta : Intel UHD\r\nOS : bez operativnog sistema\r\nRAM memorija : 8 GB DDR4\r\nHDD : 512 GB SSD\r\nRezolucija ekrana : 1920 x 1080 pix\r\nMaterijal ku?ista : plastika\r\nTežina : 1,8 kg', 62999, 'srebrna', 'ASUS X515EA-BQ322.jpg', 4),
(6, 'HP 250 G8 2X7L6EA', 'Dijagonala ekrana : 15,6\"\r\nProcesor : Intel Celeron\r\nGrafi?ka karta : Intel UHD\r\nOS : Windows 10 Home\r\nRAM memorija : 8 GB DDR4\r\nHDD : 256 GB SSD\r\nRezolucija ekrana : 1920 x 1080 pix\r\nMaterijal ku?ista : plastika\r\nTežina : 1,74 kg', 53732, 'srebrna', 'HP 250 G8 2X7L6EA.jpg', 4),
(7, 'HP 15S-FQ2042NM ', 'Dijagonala ekrana : 15,6\"\r\nProcesor : Intel Core i3\r\nGrafi?ka karta : Intel UHD\r\nOS : bez operativnog sistema\r\nRAM memorija : 8 GB DDR4\r\nHDD : 512 GB SSD\r\nRezolucija ekrana : 1920 x 1080 pix\r\nMaterijal ku?ista : plastika\r\nTežina : 1,69 kg', 68999, 'bela', 'HP 15S-FQ2042NM 434D5EA.jpg', 5),
(8, 'DELL INSPIRON 5402 14\" FHD', 'Dijagonala ekrana : 14\"\r\nProcesor : Intel Core i7\r\nGrafi?ka karta : nVidia\r\nOS : Linux\r\nRAM memorija : 8 GB DDR4\r\nHDD : 512 GB SSD\r\nRezolucija ekrana : 1920 x 1080 pix\r\nMaterijal ku?ista : aluminijum\r\nTežina : 1,4 kg', 99999, 'srebrna', 'DELL INSPIRON 5402.jpg', 1),
(16, 'SAMSUNG A7 LITE WIFI ', 'Dijagonala ekrana : 8.7\"\r\nRezolucija : 1340 x 800\r\nProcesor : Octa Core\r\nRAM memorija : 3 GB\r\nInterna memorija : 32 GB\r\nZadnja kamera : 8 Mpix\r\nPrednja kamera : 2 Mpix', 15799, 'siva', 'SAMSUNG A7 LITE.jpg', 1),
(17, 'SAMSUNG GALAXY A8  WIFI', 'Dijagonala ekrana : 10,5\"\r\nRezolucija : 1920 x 1200\r\nProcesor : Octa Core\r\nRAM memorija : 4 GB\r\nInterna memorija : 64 GB\r\nZadnja kamera : 8 Mpix\r\nPrednja kamera : 5 Mpix', 29238, 'siva', 'SAMSUNG GALAXY A8.jpg', 3),
(18, 'LENOVO TAB M10 HD TB-X306X', 'Dijagonala ekrana : 10,1\"\r\nRezolucija : 1280 x 800\r\nProcesor : Octa Core\r\nRAM memorija : 4 GB\r\nInterna memorija : 64 GB\r\nZadnja kamera : 8 Mpix\r\nPrednja kamera : 5 Mpix', 24999, 'siva', 'LENOVO TAB M10.jpg', 2),
(19, 'LENOVO M10 ZA6V0030RS', 'Dijagonala ekrana : 10,1\"\r\nRezolucija : 1280 x 800\r\nProcesor : Octa Core\r\nSIM kartica : da\r\nRAM memorija : 4 GB\r\nInterna memorija : 64 GB\r\nZadnja kamera : 8 Mpix\r\nPrednja kamera : 5 Mpix', 23999, 'siva', 'LENOVO M10.jpg', 1),
(20, 'HUAWEI MATEPAD T 10 4/64GB WIF', 'Dijagonala ekrana : 9,7\"\r\nRezolucija : 1280 x 880\r\nProcesor : Octa Core\r\nRAM memorija : 4 GB\r\nInterna memorija : 64 GB\r\nZadnja kamera : 8 Mpix\r\nPrednja kamera : 2 Mpix', 19799, 'plava', 'HUAWEI MATEPAD T 10.jpg', 1),
(21, 'SAMSUNG GALAXY A52 6GB/128GB ', 'Ekran : 6,5\"\r\nZadnja kamera : 64+8+5+2 Mpix\r\nPrednja kamera : 32 Mpix\r\nRAM memorija : 6 GB\r\nProcesor : Octa Core 2,3 GHz, 1,8 GHz\r\nKapacitet baterije : 4500 mAh\r\nInterna memorija : 128 GB\r\nSIM kartica : dve', 34599, 'crna', 'SAMSUNG GALAXY A52.jpg', 1),
(22, 'APPLE IPHONE SE3 64GB ', 'Ekran : 4,7\"\r\nZadnja kamera : 12,0 Mpix\r\nPrednja kamera : 7,0 Mpix\r\nRAM memorija : 4 GB\r\nProcesor : Hexa Core\r\nKapacitet baterije : 2018 mAh\r\nInterna memorija : 64 GB\r\nSIM kartica : dve', 71999, 'crna', 'APPLE IPHONE SE3.jpg', 3),
(23, 'APPLE IPHONE 11 64GB ', 'Ekran : 6,1\"\r\nZadnja kamera : 12 + 12 Mpix\r\nPrednja kamera : 12,0 Mpix\r\nRAM memorija : 4 GB\r\nProcesor : Hexa Core 2,65 GHz, 1,8 GHz\r\nKapacitet baterije : 3110 mAh\r\nInterna memorija : 64 GB\r\nSIM kartica : dve', 69999, 'crvena', 'APPLE IPHONE 11.jpg', 4),
(24, 'SAMSUNG GALAXY Z FOLD3', 'Ekran : 7,6\"-6,2\"\r\nZadnja kamera : 12 + 12 + 12 Mpix\r\nPrednja kamera : 10-4 Mpix\r\nRAM memorija : 12 GB\r\nProcesor : Octa Core 2,84/2,42/1,8 GHz\r\nKapacitet baterije : 4400 mAh\r\nInterna memorija : 256 GB\r\nSIM kartica : dve', 217827, 'srebrna', 'SAMSUNG GALAXY Z FOLD3.jpg', 1),
(30, 'samsung', 'opis', 20000, 'siva', 'samsung-galaxy-s10.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `artikal_kategorija`
--

CREATE TABLE `artikal_kategorija` (
  `artikal_kategorija_id` int(11) NOT NULL,
  `artikal_id` int(11) NOT NULL,
  `kategorija_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikal_kategorija`
--

INSERT INTO `artikal_kategorija` (`artikal_kategorija_id`, `artikal_id`, `kategorija_id`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 3),
(5, 5, 3),
(6, 6, 3),
(7, 7, 3),
(8, 8, 3),
(11, 16, 2),
(12, 17, 2),
(13, 18, 2),
(14, 19, 2),
(15, 20, 2),
(16, 21, 1),
(17, 22, 1),
(18, 23, 1),
(19, 24, 1),
(22, 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `grad`
--

CREATE TABLE `grad` (
  `grad_id` int(11) NOT NULL,
  `grad_ime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grad`
--

INSERT INTO `grad` (`grad_id`, `grad_ime`) VALUES
(1, 'Beograd'),
(2, 'Novi Sad'),
(3, 'Nis'),
(4, 'Subotica'),
(5, 'Uzice');

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `kategorija_id` int(11) NOT NULL,
  `kategorija_ime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`kategorija_id`, `kategorija_ime`) VALUES
(1, 'Mobilni telefon'),
(2, 'Tablet'),
(3, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `korisnik_id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`korisnik_id`, `ime`, `prezime`, `username`, `password`) VALUES
(1, 'Mladen', 'Milic', 'mladen', 'mladen'),
(2, 'Kosta', 'Milic', 'kosta', 'kosta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikal`
--
ALTER TABLE `artikal`
  ADD PRIMARY KEY (`artikal_id`),
  ADD KEY `grad_id` (`grad_id`);

--
-- Indexes for table `artikal_kategorija`
--
ALTER TABLE `artikal_kategorija`
  ADD PRIMARY KEY (`artikal_kategorija_id`),
  ADD KEY `artikal_id` (`artikal_id`),
  ADD KEY `artikal_id_2` (`artikal_id`),
  ADD KEY `kategorija_id` (`kategorija_id`);

--
-- Indexes for table `grad`
--
ALTER TABLE `grad`
  ADD PRIMARY KEY (`grad_id`);

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`kategorija_id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`korisnik_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikal`
--
ALTER TABLE `artikal`
  MODIFY `artikal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `artikal_kategorija`
--
ALTER TABLE `artikal_kategorija`
  MODIFY `artikal_kategorija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `grad`
--
ALTER TABLE `grad`
  MODIFY `grad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `kategorija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `korisnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikal`
--
ALTER TABLE `artikal`
  ADD CONSTRAINT `artikal_ibfk_1` FOREIGN KEY (`grad_id`) REFERENCES `grad` (`grad_id`);

--
-- Constraints for table `artikal_kategorija`
--
ALTER TABLE `artikal_kategorija`
  ADD CONSTRAINT `artikal_kategorija_ibfk_1` FOREIGN KEY (`artikal_id`) REFERENCES `artikal` (`artikal_id`),
  ADD CONSTRAINT `artikal_kategorija_ibfk_2` FOREIGN KEY (`kategorija_id`) REFERENCES `kategorija` (`kategorija_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
