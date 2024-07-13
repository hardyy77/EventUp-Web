-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Lip 2024, 15:42
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `eventup`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `genres` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `interest` int(11) NOT NULL DEFAULT 1,
  `added_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `events`
--

INSERT INTO `events` (`id`, `name`, `location`, `date`, `genres`, `description`, `interest`, `added_date`) VALUES
(22, 'Luxtorpeda Concert', 'Gdynia', '2024-06-30', 'Rock', 'Koncert zespołu Luxtorpeda z ich najnowszymi utworami i klasycznymi hitami.', 500, '2023-10-25 22:00:00'),
(23, 'ORW Festiwal', 'Bałtów', '2024-07-01', 'Music', 'Festiwal muzyczny w Bałtowie z występami artystów z różnych gatunków muzycznych.', 750, '2023-11-20 23:00:00'),
(24, 'Grzegorz Dolniak Stand-up', 'Gniezno', '2024-07-05', 'Comedy', 'Grzegorz Dolniak występuje ze swoim nowym programem stand-upowym.', 200, '2023-07-20 22:00:00'),
(25, 'GONG Performance', 'Warszawa', '2024-07-10', 'Theatre', 'Teatralne widowisko GONG z udziałem znanych aktorów.', 300, '2023-08-26 22:00:00'),
(26, '3-Majówka 2024', 'Wrocław', '2024-07-15', 'Music', 'Muzyczna majówka z koncertami popularnych polskich artystów.', 600, '2024-03-02 23:00:00'),
(27, 'Jezioro Łabędzie - Kyiv Classic Ballet', 'Kalisz', '2024-07-20', 'Ballet', 'Występ Kyiv Classic Ballet prezentujący klasyczne Jezioro Łabędzie.', 450, '2023-06-14 22:00:00'),
(28, 'Popiór Performance', 'Wrocław', '2024-07-25', 'Theatre', 'Teatralne przedstawienie \'Popiór\' z udziałem lokalnych artystów.', 500, '2024-04-27 22:00:00'),
(29, 'Wszystkie drogi prowadzą do Rzymu - Sanremo n', 'Katowice', '2024-07-30', 'Music', 'Koncert z przebojami festiwalu Sanremo.', 700, '2023-10-22 22:00:00'),
(30, 'Skrzypek Na Dachu', 'Kraków', '2024-08-05', 'Musical', 'Musical \'Skrzypek Na Dachu\' w wykonaniu znanej trupy teatralnej.', 800, '2023-08-19 22:00:00'),
(31, 'Stand-up: Karol Modzelewski', 'Gdańsk', '2024-08-10', 'Comedy', 'Wieczór stand-upu z Karolem Modzelewskim i jego najnowszym programem.', 350, '2024-04-22 22:00:00'),
(32, 'Piaf The Show', 'Poznań', '2024-08-15', 'Music', 'Muzyczny spektakl poświęcony życiu i twórczości Edith Piaf.', 400, '2024-03-16 23:00:00'),
(33, 'ATB Concert', 'Gdynia', '2024-08-20', 'Electronic', 'Koncert znanego DJ-a ATB z jego największymi hitami.', 600, '2023-08-31 22:00:00'),
(34, 'Klimakterium i już', 'Kraków', '2024-08-25', 'Theatre', 'Komedio-muzyczne przedstawienie \'Klimakterium i już\'.', 550, '2024-04-09 22:00:00'),
(35, 'Film Festival', 'Gdynia', '2024-09-01', 'Film', 'Festiwal filmowy z premierami najnowszych produkcji.', 700, '2023-12-06 23:00:00'),
(37, 'Stand-up: Arkadiusz Jaksa Jakszewicz', 'Łódź', '2024-09-10', 'Comedy', 'Wieczór stand-upu z Arkadiuszem Jakszewiczem i jego nowym programem.', 300, '2023-10-12 22:00:00'),
(38, 'MAMMA MIA Show', 'Łomża', '2024-09-15', 'Musical', 'Spektakl musicalowy \'MAMMA MIA\' z hitami zespołu ABBA.', 800, '2024-04-02 22:00:00'),
(39, 'Dziadek do Orzechów - Ukrainian Classical Bal', 'Kraków', '2024-09-20', 'Ballet', 'Klasyczny balet \'Dziadek do Orzechów\' w wykonaniu ukraińskich artystów.', 500, '2023-06-28 22:00:00'),
(40, 'Open\'er Festival 2024', 'Gdynia', '2024-06-28', 'Various', 'A massive music festival featuring artists like Skrillex, Foo Fighters, and Dua Lipa. Runs from June 28 to August 24.', 20000, '2024-04-03 22:00:00'),
(42, 'Sunrise Festival 2024', 'Kołobrzeg', '2024-07-19', 'Electronic', 'Jedno z największych wydarzeń muzyki elektronicznej w Europie Środkowo-Wschodniej.', 800, '2023-08-24 22:00:00'),
(43, 'Mystic Festival 2024', 'Gdańsk', '2024-06-28', 'Metal', 'Festiwal prezentujący największe gwiazdy metalu i muzyki alternatywnej.', 1000, '2023-09-08 22:00:00'),
(44, 'Męskie Granie 2024', 'Poznań', '2024-07-10', 'Various', 'Popularny festiwal muzyczny prezentujący czołowych polskich artystów.', 700, '2024-01-20 23:00:00'),
(45, 'Sun Festival 2024', 'Kołobrzeg', '2024-07-26', 'Hip-Hop', 'Największy hip-hopowy festiwal w Polsce, z udziałem topowych wykonawców.', 600, '2023-10-08 22:00:00'),
(46, 'Olsztyn Green Festival 2024', 'Olsztyn', '2024-08-15', 'Various', 'Festiwal muzyczny na świeżym powietrzu, promujący ekologię i zrównoważony rozwój.', 500, '2024-03-31 22:00:00'),
(47, 'Top of the Top Sopot Festival 2024', 'Sopot', '2024-08-19', 'Pop', 'Festiwal muzyki pop, prezentujący największe hity i gwiazdy.', 750, '2023-06-27 22:00:00'),
(48, 'SBM FFestival 2024', 'Warszawa', '2024-08-29', 'Hip-Hop', 'Festiwal hip-hopowy organizowany przez wytwórnię SBM Label.', 400, '2024-04-07 22:00:00'),
(50, 'Sunset Square 2024', 'Gdynia', '2024-08-08', 'Various', 'Letni festiwal muzyczny na świeżym powietrzu.', 550, '2023-12-08 23:00:00'),
(51, 'Audioriver Festival 2024', 'Łódź', '2024-07-12', 'Electronic', 'Festiwal muzyki elektronicznej, prezentujący najlepszych DJ-ów i artystów.', 800, '2023-12-10 23:00:00'),
(52, 'Mazury Hip Hop Festiwal 2024', 'Giżycko', '2024-07-18', 'Hip-Hop', 'Festiwal hip-hopowy odbywający się na Mazurach.', 650, '2023-06-17 22:00:00'),
(53, 'OFF Festival 2024', 'Katowice', '2024-08-02', 'Alternative', 'Festiwal muzyki alternatywnej z udziałem międzynarodowych artystów.', 700, '2024-01-15 23:00:00'),
(56, 'Before Festival 2024', 'Siedlce', '2024-06-22', 'Various', 'Festiwal muzyczny z udziałem znanych artystów różnych gatunków.', 500, '2024-05-11 22:00:00'),
(57, 'Tauron Nowa Muzyka 2024', 'Katowice', '2024-08-04', 'Electronic', 'Festiwal muzyki elektronicznej i eksperymentalnej.', 800, '2024-03-17 23:00:00'),
(58, 'Czad Festiwal 2024', 'Strzyżów', '2024-07-25', 'Rock', 'Festiwal rockowy z udziałem znanych zespołów i artystów.', 700, '2023-07-12 22:00:00'),
(59, 'Rock For People 2024', 'Warszawa', '2024-08-18', 'Rock', 'Festiwal muzyki rockowej, odbywający się w Warszawie.', 900, '2023-07-30 22:00:00'),
(60, 'Summer Jazz Festival 2024', 'Kraków', '2024-07-01', 'Jazz', 'Letni festiwal jazzowy z udziałem międzynarodowych artystów.', 300, '2023-11-13 23:00:00'),
(61, 'Pol\'and\'Rock Festival 2024', 'Lotnisko Czaplinek-Broczyno', '2024-08-01', 'Rock', 'Największy festiwal rockowy w Polsce, dawniej znany jako Woodstock.', 20000, '2024-02-28 23:00:00'),
(62, 'Coldplay - Music Of The Spheres World Tour', 'Warszawa', '2024-07-05', 'Rock', 'Coldplay powraca do Polski z trasą \'Music Of The Spheres\', prezentując swoje największe hity.', 750, '2023-10-08 22:00:00'),
(63, 'P!NK - Summer Carnival 2024', 'Kraków', '2024-07-17', 'Pop', 'Koncert P!NK w ramach trasy Summer Carnival, pełen energii i spektakularnych występów.', 900, '2023-12-04 23:00:00'),
(64, 'U2 - The Joshua Tree Tour', 'Warszawa', '2024-08-08', 'Rock', 'U2 wykonuje klasyki z albumu \'The Joshua Tree\' podczas swojej trasy koncertowej.', 850, '2023-11-18 23:00:00'),
(65, 'The Weeknd - After Hours Tour', 'Gdańsk', '2024-07-22', 'R&B', 'The Weeknd powraca z trasą After Hours, prezentując swoje najnowsze hity.', 650, '2024-03-10 23:00:00'),
(66, 'Baroness - Gold & Grey Tour', 'Wrocław', '2024-07-11', 'Metal', 'Baroness zagrają koncert promujący album \'Gold & Grey\'.', 400, '2023-11-15 23:00:00'),
(67, 'All Them Witches', 'Poznań', '2024-08-14', 'Rock', 'Koncert zespołu All Them Witches, prezentującego mieszankę rocka i psychodelii.', 500, '2024-05-12 22:00:00'),
(68, 'Red Fang', 'Katowice', '2024-07-25', 'Metal', 'Red Fang zagrają swoje największe przeboje i nowe utwory.', 550, '2023-09-30 22:00:00'),
(69, 'Movements', 'Łódź', '2024-09-05', 'Rock', 'Koncert zespołu Movements, znanego z emocjonalnych występów.', 600, '2024-03-21 23:00:00'),
(71, 'Apocalyptica', 'Gdańsk', '2024-08-30', 'Metal', 'Apocalyptica zagra klasyki metalu na wiolonczelach.', 800, '2023-12-31 23:00:00'),
(72, 'Tech N9ne', 'Wrocław', '2024-07-27', 'Hip-Hop', 'Koncert Tech N9ne, jednego z najbardziej dynamicznych raperów.', 450, '2024-04-19 22:00:00'),
(73, 'Code Orange', 'Poznań', '2024-08-18', 'Metal', 'Code Orange zagrają koncert promujący ich nowy album.', 500, '2024-01-22 23:00:00'),
(74, 'The Amity Affliction', 'Kraków', '2024-07-29', 'Metalcore', 'The Amity Affliction powraca do Polski z nowym materiałem.', 600, '2023-12-16 23:00:00'),
(75, 'Miss May I', 'Łódź', '2024-09-10', 'Metalcore', 'Koncert Miss May I, pełen intensywnych riffów i emocji.', 550, '2024-03-04 23:00:00'),
(76, 'Currents', 'Katowice', '2024-08-12', 'Metalcore', 'Currents zagrają swoje największe hity i nowe utwory.', 700, '2023-07-25 22:00:00'),
(77, 'Moon Fever', 'Warszawa', '2024-09-15', 'Rock', 'Koncert zespołu Moon Fever, prezentującego energetyczne rockowe brzmienia.', 450, '2023-11-11 23:00:00'),
(78, 'Tim Montana', 'Poznań', '2024-07-21', 'Country', 'Koncert Tima Montany z jego największymi hitami.', 300, '2024-03-07 23:00:00'),
(80, 'Fleshwater', 'Kraków', '2024-09-03', 'Rock', 'Fleshwater zagrają swoje najbardziej znane utwory.', 400, '2023-06-13 22:00:00'),
(81, 'SiM', 'Warszawa', '2024-07-18', 'Punk', 'Koncert japońskiego zespołu punkowego SiM.', 500, '2024-02-22 23:00:00'),
(83, 'Justin Timberlake - The Forget Tomorrow Tour', 'Kraków', '2024-07-15', 'Pop', 'Justin Timberlake powraca do Polski z nową trasą koncertową.', 223, '2023-10-28 22:00:00'),
(84, 'Cirque du Soleil - OVO', 'Warszawa', '2024-08-01', 'Circus', 'Spektakl cyrkowy Cirque du Soleil, pełen akrobacji i magii.', 616, '2023-11-12 23:00:00'),
(86, 'Billie Eilish - Happier Than Ever Tour', 'Warszawa', '2024-08-20', 'Pop', 'Billie Eilish powraca z koncertem pełnym emocji i hitów.', 78, '2024-01-21 23:00:00'),
(87, 'Dua Lipa - Future Nostalgia Tour', 'Kraków', '2024-07-22', 'Pop', 'Dua Lipa wystąpi na żywo z utworami z albumu \'Future Nostalgia\'.', 213, '2023-08-04 22:00:00'),
(88, 'Adele - 30 Tour', 'Warszawa', '2024-09-01', 'Pop', 'Adele zagra koncert promujący jej najnowszy album \'30\'.', 61, '2024-05-08 22:00:00'),
(89, 'Foo Fighters - Medicine at Midnight Tour', 'Gdańsk', '2024-08-05', 'Rock', 'Foo Fighters wystąpią na żywo z nowym materiałem.', 217, '2023-07-19 22:00:00'),
(90, 'The Rolling Stones - No Filter Tour', 'Warszawa', '2024-07-18', 'Rock', 'The Rolling Stones zagrają swoje największe hity na PGE Narodowym.', 612, '2024-03-29 23:00:00'),
(91, 'Kendrick Lamar - The Big Steppers Tour', 'Kraków', '2024-08-25', 'Hip-Hop', 'Kendrick Lamar powraca do Polski z nową trasą koncertową.', 745, '2024-02-20 23:00:00'),
(92, 'Shawn Mendes - Wonder Tour', 'Warszawa', '2024-07-12', 'Pop', 'Shawn Mendes zagra koncert pełen hitów i emocji.', 941, '2023-07-08 22:00:00'),
(93, 'Harry Styles - Love On Tour', 'Gdańsk', '2024-08-15', 'Pop', 'Harry Styles powraca do Polski z trasą \'Love On Tour\'.', 145, '2023-09-28 22:00:00'),
(94, 'Ed Sheeran - + - = ÷ x Tour', 'Warszawa', '2024-09-10', 'Pop', 'Ed Sheeran zagra koncert promujący jego najnowszy album.', 285, '2023-09-18 22:00:00'),
(95, 'The Weeknd - After Hours Til Dawn Tour', 'Kraków', '2024-09-20', 'R&B', 'The Weeknd wystąpi na żywo z utworami z albumu \'After Hours\'.', 862, '2023-11-28 23:00:00'),
(96, 'Beyoncé - Renaissance World Tour', 'Warszawa', '2024-08-10', 'R&B', 'Beyoncé powraca do Polski z nową trasą koncertową.', 28, '2023-12-20 23:00:00'),
(97, 'Coldplay - Music of the Spheres Tour', 'Kraków', '2024-09-05', 'Rock', 'Coldplay zagrają koncert pełen emocji i hitów.', 292, '2023-09-03 22:00:00'),
(98, 'Bruno Mars - 24K Magic Tour', 'Warszawa', '2024-08-18', 'Pop', 'Bruno Mars wystąpi na żywo z utworami z albumu \'24K Magic\'.', 600, '2024-01-11 23:00:00'),
(99, 'Rammstein - Europe Stadium Tour', 'Chorzów', '2024-07-29', 'Metal', 'Rammstein zagrają koncert pełen ognia i energii.', 645, '2023-09-09 22:00:00'),
(100, 'Lana Del Rey - Chemtrails Over The Country Cl', 'Warszawa', '2024-09-15', 'Pop', 'Lana Del Rey wystąpi na żywo z utworami z albumu \'Chemtrails Over The Country Club\'.', 10, '2023-12-03 23:00:00'),
(101, 'Måneskin - Loud Kids Tour', 'Gdańsk', '2024-08-22', 'Rock', 'Måneskin powraca do Polski z nową trasą koncertową.', 650, '2024-02-10 23:00:00'),
(102, 'Max & Iggor Cavalera', 'Wrocław', '2024-06-23', 'Hard Rock', 'Koncert legendarnego duetu Max & Iggor Cavalera.', 789, '2024-05-04 22:00:00'),
(103, 'Silverstein with Deez Nuts', 'Kraków', '2024-06-25', 'Hard Rock', 'Energetyczny koncert zespołu Silverstein z Deez Nuts.', 456, '2023-12-09 23:00:00'),
(104, 'Matteo Bocelli', 'Poznań', '2024-06-26', 'Classical', 'Wspaniały koncert Matteo Bocelli, syna Andrea Bocelli.', 234, '2024-03-25 23:00:00'),
(105, 'Atreyu', 'Warszawa', '2024-06-26', 'Hard Rock', 'Koncert zespołu Atreyu z ich najnowszymi hitami.', 678, '2023-11-24 23:00:00'),
(106, 'Nervosa', 'Kraków', '2024-06-28', 'Hard Rock', 'Intensywny koncert zespołu Nervosa w Krakowie.', 345, '2024-05-12 22:00:00'),
(107, 'Diana Krall', 'Kraków', '2024-06-30', 'Jazz', 'Występ jazzowej legendy Diany Krall.', 567, '2023-09-07 22:00:00'),
(108, 'Travis Scott', 'Kraków', '2024-07-02', 'Rap', 'Koncert Travis Scott na Tauron Arenie w Krakowie.', 789, '2023-11-21 23:00:00'),
(109, 'Thievery Corporation', 'Warszawa', '2024-07-02', 'Electronic', 'Występ Thievery Corporation w Klubie Stodoła.', 456, '2023-12-19 23:00:00'),
(110, 'Open\'er Festival', 'Gdynia', '2024-07-03', 'Festival', 'Wielki festiwal muzyczny z udziałem światowych gwiazd.', 890, '2023-09-20 22:00:00'),
(111, 'Pet Shop Boys', 'Warszawa', '2024-07-03', 'Electronic', 'Koncert Pet Shop Boys na COS Torwar.', 123, '2024-04-06 22:00:00'),
(112, 'Santander Letnie Brzmienia 2024', 'Kraków', '2024-07-05', 'Various', 'Festiwal letnich brzmień z udziałem wielu artystów.', 456, '2023-09-21 22:00:00'),
(113, 'Kings of Leon', 'Kraków', '2024-07-17', 'Rock', 'Koncert zespołu Kings of Leon w TAURON Arenie.', 789, '2024-05-21 22:00:00'),
(114, 'Lenny Kravitz', 'Kraków', '2024-07-21', 'Rock', 'Koncert Lenny\'ego Kravitza w Krakowie.', 345, '2024-04-30 22:00:00'),
(115, 'Chopiniana', 'Warszawa', '2024-07-25', 'Classical', 'Festiwal poświęcony twórczości Fryderyka Chopina.', 567, '2024-01-19 23:00:00'),
(116, 'St Dominic\'s Fair', 'Gdańsk', '2024-07-27', 'Festival', 'Tradycyjny jarmark dominikański w Gdańsku.', 234, '2023-10-28 22:00:00'),
(117, 'Summer Jazz Days', 'Warszawa', '2024-08-01', 'Jazz', 'Letni festiwal jazzowy z udziałem międzynarodowych gwiazd.', 789, '2023-07-12 22:00:00'),
(118, 'Coke Live Music Festival', 'Kraków', '2024-08-02', 'Indie', 'Festiwal muzyki indie i pop w Krakowie.', 456, '2023-09-26 22:00:00'),
(119, 'Gdańsk Shakespeare Festival', 'Gdańsk', '2024-08-05', 'Theatre', 'Festiwal teatralny poświęcony twórczości Williama Szekspira.', 123, '2023-08-28 22:00:00'),
(120, 'Singer\'s Jewish Culture Festival', 'Warszawa', '2024-08-20', 'Cultural', 'Festiwal kultury żydowskiej w Warszawie.', 567, '2023-08-24 22:00:00'),
(121, 'International Highlanders\' Folk Festival', 'Zakopane', '2024-09-01', 'Folk', 'Międzynarodowy festiwal folkloru góralskiego.', 890, '2023-10-25 22:00:00'),
(122, 'Harakiri For The Sky', 'Wrocław', '2024-06-23', 'Metal', 'Koncert zespołu Harakiri For The Sky w klubie Łącznik.', 626, '2023-09-12 22:00:00'),
(123, 'Boston Manor', 'Warszawa', '2024-06-26', 'Punk', 'Koncert zespołu Boston Manor w klubie Hydrozagadka.', 4, '2023-08-12 22:00:00'),
(124, 'While She Sleeps', 'Poznań', '2024-07-01', 'Metalcore', 'Koncert zespołu While She Sleeps w klubie Tama.', 616, '2023-07-12 22:00:00'),
(126, 'Pet Shop Boys', 'Warszawa', '2024-07-03', 'Electronic', 'Koncert Pet Shop Boys na COS Torwar.', 769, '2023-11-01 23:00:00'),
(127, 'Jimmy Gnecco and OURS', 'Kraków', '2024-07-04', 'Rock', 'Koncert Jimmy Gnecco i zespołu OURS w klubie Gwarek.', 902, '2023-08-14 22:00:00'),
(128, 'Santander Letnie Brzmienia', 'Kraków', '2024-07-05', 'Various', 'Festiwal letnich brzmień z udziałem wielu artystów.', 328, '2024-02-27 23:00:00'),
(129, 'Hulder', 'Kraków', '2024-07-06', 'Metal', 'Koncert zespołu Hulder w klubie Gwarek.', 250, '2023-06-28 22:00:00'),
(130, 'Summer Jazz Festival', 'Kraków', '2024-07-12', 'Jazz', 'Festiwal jazzowy z występami międzynarodowych artystów.', 309, '2023-07-18 22:00:00'),
(131, 'Ski Mask The Slump God', 'Kraków', '2024-07-15', 'Rap', 'Koncert Ski Mask The Slump God w Klubie Studio.', 366, '2023-10-24 22:00:00'),
(132, 'Kings of Leon', 'Kraków', '2024-07-17', 'Rock', 'Koncert zespołu Kings of Leon w TAURON Arenie.', 894, '2023-12-28 23:00:00'),
(133, 'Infected Rain', 'Kraków', '2024-07-17', 'Metal', 'Koncert zespołu Infected Rain w klubie Kwadrat.', 517, '2024-01-28 23:00:00'),
(134, 'Lenny Kravitz', 'Kraków', '2024-07-21', 'Rock', 'Koncert Lenny\'ego Kravitza w TAURON Arenie.', 426, '2023-12-20 23:00:00'),
(135, 'Chopiniana', 'Warszawa', '2024-07-25', 'Classical', 'Festiwal poświęcony twórczości Fryderyka Chopina.', 862, '2024-03-05 23:00:00'),
(136, 'St Dominic\'s Fair', 'Gdańsk', '2024-07-27', 'Festival', 'Tradycyjny jarmark dominikański w Gdańsku.', 781, '2023-07-17 22:00:00'),
(137, 'Summer Jazz Days', 'Warszawa', '2024-08-01', 'Jazz', 'Letni festiwal jazzowy z udziałem międzynarodowych gwiazd.', 337, '2023-10-01 22:00:00'),
(138, 'Coke Live Music Festival', 'Kraków', '2024-08-02', 'Indie', 'Festiwal muzyki indie i pop w Krakowie.', 462, '2023-09-04 22:00:00'),
(139, 'Gdańsk Shakespeare Festival', 'Gdańsk', '2024-08-05', 'Theatre', 'Festiwal teatralny poświęcony twórczości Williama Szekspira.', 627, '2023-09-14 22:00:00'),
(140, 'Singer\'s Jewish Culture Festival', 'Warszawa', '2024-08-20', 'Cultural', 'Festiwal kultury żydowskiej w Warszawie.', 24, '2024-01-18 23:00:00'),
(141, 'International Highlanders\' Folk Festival', 'Zakopane', '2024-09-01', 'Folk', 'Międzynarodowy festiwal folkloru góralskiego.', 77, '2023-09-09 22:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `todayinterestingevents`
--

CREATE TABLE `todayinterestingevents` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `genres` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `interest` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `todayinterestingevents`
--

INSERT INTO `todayinterestingevents` (`id`, `name`, `location`, `date`, `genres`, `description`, `interest`, `updated_at`) VALUES
(22, 'Luxtorpeda Concert', 'Gdynia', '2024-06-30', 'Rock', 'Koncert zespołu Luxtorpeda z ich najnowszymi utworami i klasycznymi hitami.', 500, NULL),
(78, 'Tim Montana', 'Poznań', '2024-07-21', 'Country', 'Koncert Tima Montany z jego największymi hitami.', 300, NULL),
(101, 'Måneskin - Loud Kids Tour', 'Gdańsk', '2024-08-22', 'Rock', 'Måneskin powraca do Polski z nową trasą koncertową.', 650, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `displayName` varchar(45) NOT NULL DEFAULT 'user',
  `role` varchar(45) NOT NULL DEFAULT 'user',
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`uid`, `email`, `displayName`, `role`, `password`) VALUES
(2, 'testdwa@gmail.com', 'user', 'user', 'abe31fe1a2113e7e8bf174164515802806d388cf4f394cceace7341a182271ab'),
(3, 'test@gmail.com', 'admin', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_favorites`
--

CREATE TABLE `user_favorites` (
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `user_favorites`
--

INSERT INTO `user_favorites` (`user_id`, `event_id`) VALUES
(2, 22),
(2, 28),
(2, 43),
(2, 61),
(2, 106),
(3, 22),
(3, 27),
(3, 40),
(3, 43),
(3, 61),
(3, 88),
(3, 113);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `todayinterestingevents`
--
ALTER TABLE `todayinterestingevents`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- Indeksy dla tabeli `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`user_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT dla tabeli `todayinterestingevents`
--
ALTER TABLE `todayinterestingevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `user_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `user_favorites_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
