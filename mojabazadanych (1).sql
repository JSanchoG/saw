-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 11, 2023 at 08:05 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mojabazadanych`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE IF NOT EXISTS `kategorie` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id`, `nazwa`) VALUES
(1, 'Peryferia'),
(2, 'Audio'),
(3, 'Sprzęt'),
(4, 'Video'),
(5, 'Oprogramowanie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adres` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`, `telefon`, `adres`) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@gmail.com', '555-123-456', 'ul. Kwiatowa 10, 00-001 Warszawa'),
(2, 'Anna', 'Nowak', 'anna.nowak@yahoo.com', '555-234-567', 'ul. Wrocławska 20, 50-001 Wrocław'),
(3, 'Adam', 'Nowacki', 'adam.nowacki@gmail.com', '555-345-678', 'ul. Gdańska 30, 80-001 Gdańsk'),
(4, 'Maria', 'Kowalczyk', 'maria.kowalczyk@onet.pl', '555-456-789', 'ul. Krakowska 40, 30-001 Kraków'),
(5, 'Piotr', 'Wisniewski', 'piotr.wisniewski@hotmail.com', '555-567-890', 'ul. Słoneczna 50, 40-001 Katowice'),
(6, 'Karolina', 'Kaczmarek', 'karolina.kaczmarek@gmail.com', '555-678-901', 'ul. Zakopiańska 60, 30-002 Zakopane'),
(7, 'Tomasz', 'Krajewski', 'tomasz.krajewski@wp.pl', '555-789-012', 'ul. Szczecińska 70, 70-001 Szczecin'),
(8, 'Marta', 'Kowalewska', 'marta.kowalewska@gmail.com', '555-890-123', 'ul. Poznańska 80, 60-001 Poznań'),
(9, 'Andrzej', 'Lewandowski', 'andrzej.lewandowski@yahoo.com', '555-901-234', 'ul. Łódzka 90, 90-001 Łódź'),
(10, 'Magdalena', 'Jankowska', 'magdalena.jankowska@o2.pl', '555-012-345', 'ul. Lubelska 100, 20-001 Lublin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE IF NOT EXISTS `produkty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `cena` decimal(8,2) DEFAULT NULL,
  `kategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategoria_id` (`kategoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `nazwa`, `cena`, `kategoria_id`) VALUES
(1, 'Klawiatura mechaniczna', 299.99, 1),
(2, 'Mysz gamingowa', 149.99, 1),
(3, 'Słuchawki bezprzewodowe', 349.99, 2),
(4, 'Głośniki bluetooth', 199.99, 2),
(5, 'Smartfon', 1999.99, 3),
(6, 'Laptop', 4999.99, 3),
(7, 'Konsola do gier', 1899.99, 3),
(8, 'Gry komputerowe', 99.99, 5),
(9, 'Monitor', 1299.99, 4),
(10, 'Projektor multimedialny', 3999.99, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczegoly_zamowien`
--

CREATE TABLE IF NOT EXISTS `szczegoly_zamowien` (
  `id` int(11) NOT NULL,
  `zamowienie_id` int(11) DEFAULT NULL,
  `produkt_id` int(11) DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `cena` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zamowienie_id` (`zamowienie_id`),
  KEY `produkt_id` (`produkt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `szczegoly_zamowien`
--

INSERT INTO `szczegoly_zamowien` (`id`, `zamowienie_id`, `produkt_id`, `ilosc`, `cena`) VALUES
(1, 1, 1, 1, 299.99),
(2, 1, 2, 2, 299.98),
(3, 2, 3, 1, 349.99),
(4, 3, 5, 1, 199.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE IF NOT EXISTS `zamowienia` (
  `id` int(11) NOT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `data_zamowienia` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klient_id` (`klient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `klient_id`, `data_zamowienia`, `status`) VALUES
(0, 1, '2022-04-20', 'Zrealizowane'),
(1, 3, '2022-01-01', 'Złożone'),
(2, 1, '2022-02-01', 'Przyjęte do realizac'),
(3, 5, '2022-03-01', 'Zrealizowane'),
(4, 2, '2022-04-01', 'Anulowane'),
(5, 6, '2022-05-01', 'Złożone'),
(6, 4, '2022-06-01', 'Przyjęte do realizac'),
(7, 8, '2022-07-01', 'Zrealizowane'),
(8, 7, '2022-08-01', 'Anulowane'),
(9, 10, '2022-09-01', 'Złożone'),
(10, 9, '2022-10-01', 'Przyjęte do realizac'),
(11, 1, '2022-04-01', 'Zrealizowane');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `produkty_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategorie` (`id`);

--
-- Constraints for table `szczegoly_zamowien`
--
ALTER TABLE `szczegoly_zamowien`
  ADD CONSTRAINT `szczegoly_zamowien_ibfk_1` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienia` (`id`),
  ADD CONSTRAINT `szczegoly_zamowien_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkty` (`id`);

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
