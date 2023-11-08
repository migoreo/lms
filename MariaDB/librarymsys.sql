SET global sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET time_zone = "+00:00";


--
-- Database: `librarymanagementsystem`
--

==========================================================================================================



--
-- Table Structure for table `librarian`
--

CREATE TABLE IF NOT EXISTS `librarian` (
  `librarian_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `updation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `librarian`
--


INSERT INTO `librarian` (`librarian_id`, `full_name`, `username`, `password`, `updation_date`) VALUES
(1, 'Felix Miguel Eleazar', 'admin', 'password', '2023-11-08 13:42:26');



==========================================================================================================


--
-- Table structure for table `book_authors`
--


CREATE TABLE IF NOT EXISTS `book_authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(159) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updation_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `book_authors`
--


INSERT INTO `book_authors` (`author_id`, `author_name`, `creation_date`, `updation_date`) VALUES
(1, 'Stephenie Meyer', '2017-07-08 12:49:09', '2017-07-08 15:16:59'),
(2, 'Chetan Bhagatt', '2017-07-08 14:30:23', '2017-07-08 15:15:09'),
(3, 'Anita Desai', '2017-07-08 14:35:08', NULL),
(4, 'HC Verma', '2017-07-08 14:35:21', NULL),
(5, 'R.D. Sharma ', '2017-07-08 14:35:36', NULL),
(9, 'fwdfrwer', '2017-07-08 15:22:03', NULL);
