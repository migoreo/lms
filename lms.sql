-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 07:40 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `ISBN_number` bigint(20) NOT NULL,
  `book_price` float DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT NULL,
  `updation_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `category_id`, `author_id`, `ISBN_number`, `book_price`, `registration_date`, `updation_date`) VALUES
(1, 'The Chemist', 1, 1, 9783596298938, 2, '2023-11-09 05:50:12', '2023-11-09 05:50:12'),
(2, 'The Fifth Vial', 1, 2, 9780099489764, 1450, '2023-11-08 16:00:00', '2023-11-08 16:00:00'),
(3, 'Harry Potter and The Sorcerer\'s Stone', 2, 3, 9780605656444, 830, '2023-11-08 16:00:00', '2023-11-08 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(159) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`author_id`, `author_name`, `creation_date`, `updation_date`) VALUES
(1, 'Stephenie Meyer', '2023-11-08 06:06:51', '2023-11-08 06:06:51'),
(2, 'Michael Palmer', '2023-11-08 06:09:33', '2023-11-08 06:09:33'),
(3, 'Joanne Rowling', '2023-11-08 06:12:14', '2023-11-08 06:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `book_loans`
--

CREATE TABLE `book_loans` (
  `loan_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `loan_date` int(11) NOT NULL,
  `due_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `Status`, `creation_date`, `updation_date`) VALUES
(1, 'Medical', 1, '2023-11-09 05:59:30', NULL),
(2, 'Fantasy', 1, '2023-11-09 06:00:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issuedbook_details`
--

CREATE TABLE `issuedbook_details` (
  `ibd_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `student_id` varchar(150) DEFAULT NULL,
  `issued_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `return_status` int(1) NOT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `issuedbook_details`
--

INSERT INTO `issuedbook_details` (`ibd_id`, `book_id`, `student_id`, `issued_date`, `return_date`, `return_status`, `fine`) VALUES
(1, 1, 'STUDID002', '2023-11-09 06:07:19', NULL, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `librarian_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`librarian_id`, `full_name`, `username`, `password`, `updation_date`) VALUES
(1, 'Felix Miguel Eleazar', 'admin', 'password', '2023-11-08 05:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `full_name` varchar(120) DEFAULT NULL,
  `pass_word` varchar(120) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `full_name`, `pass_word`, `status`, `registration_date`, `updation_date`) VALUES
(1, 11, 'Elkes Pearl Lopez', 'lopezpass', 1, '2023-11-09 06:17:00', NULL),
(2, 12, 'Analie Alcantara', 'alcantarapassword', 1, '2023-11-09 06:18:31', NULL),
(3, 13, 'Kim Ebora', 'eborapass', 1, '2023-11-09 06:19:03', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_id` (`book_id`,`book_name`,`category_id`,`author_id`,`ISBN_number`,`book_price`,`registration_date`,`updation_date`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `author_id` (`author_id`,`author_name`,`creation_date`,`updation_date`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_id` (`category_id`,`category_name`,`Status`,`creation_date`,`updation_date`);

--
-- Indexes for table `issuedbook_details`
--
ALTER TABLE `issuedbook_details`
  ADD PRIMARY KEY (`ibd_id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`librarian_id`),
  ADD KEY `librarian_id` (`librarian_id`,`full_name`,`username`,`password`,`updation_date`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `id` (`id`,`student_id`,`full_name`,`pass_word`,`status`,`registration_date`,`updation_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `issuedbook_details`
--
ALTER TABLE `issuedbook_details`
  MODIFY `ibd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `librarian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
