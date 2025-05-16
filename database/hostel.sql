-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 16, 2025 at 05:48 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'code.lpu1@gmail.com', 'Test@1234', '2021-11-03 20:31:45', '2021-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_sn` varchar(255) NOT NULL,
  `course_fn` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(1, 'B10992', 'B.Tech', 'Bachelor  of Technology', '2021-11-09 19:31:42'),
(2, 'BCOM1453', 'B.Com', 'Bachelor Of commerce ', '2021-11-09 19:32:46'),
(3, 'BSC12', 'BSC', 'Bachelor  of Science', '2021-11-09 19:33:23'),
(4, 'BC36356', 'BCA', 'Bachelor Of Computer Applications', '2021-11-09 19:34:18'),
(5, 'MCA565', 'MCA', 'Master of Computer Application', '2021-11-09 19:34:40'),
(7, 'BE765', 'BE', 'Bachelor of Engineering', '2021-11-09 19:35:19'),
(17, 'CS21', 'DB', 'Database ', '2024-03-07 03:26:37'),
(18, 'CS21', 'DB', 'Database ', '2024-03-07 04:54:26');

--
-- Triggers `courses`
--
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `courses` FOR EACH ROW INSERT INTO trig_course
VALUES(null,NEW.id,NEW.course_code,NEW.course_sn,NEW.course_fn,'INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete` BEFORE DELETE ON `courses` FOR EACH ROW INSERT INTO trig_course
VALUES(null,OLD.id,OLD.course_code,OLD.course_sn,OLD.course_fn,'DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `courses` FOR EACH ROW INSERT INTO trig_course
VALUES(null,NEW.id,NEW.course_code,NEW.course_sn,NEW.course_fn,'UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `feespm` int(11) NOT NULL,
  `foodstatus` int(11) NOT NULL,
  `stayfrom` date NOT NULL,
  `duration` int(11) NOT NULL,
  `course` varchar(500) NOT NULL,
  `regno` varchar(255) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `middleName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `emailid` varchar(500) NOT NULL,
  `egycontactno` bigint(11) NOT NULL,
  `guardianName` varchar(500) NOT NULL,
  `guardianRelation` varchar(500) NOT NULL,
  `guardianContactno` bigint(11) NOT NULL,
  `corresAddress` varchar(500) NOT NULL,
  `corresCIty` varchar(500) NOT NULL,
  `corresState` varchar(500) NOT NULL,
  `corresPincode` int(11) NOT NULL,
  `pmntAddress` varchar(500) NOT NULL,
  `pmntCity` varchar(500) NOT NULL,
  `pmnatetState` varchar(500) NOT NULL,
  `pmntPincode` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `feespm`, `foodstatus`, `stayfrom`, `duration`, `course`, `regno`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(8, 112, 3, 4000, 0, '2021-11-20', 5, 'Bachelor  of Science', '102355', 'Harry', 'projects', 'Singh', 'male', 6786786786, 'Harry@gmail.com', 789632587, 'demo', 'demo', 1234567890, 'New Delhi', 'Delhi', 'Delhi (NCT)', 110001, 'New Delhi', 'Delhi', 'Delhi (NCT)', 110001, '2021-11-25 16:31:08', ''),
(9, 132, 5, 2000, 1, '2021-11-22', 6, 'Bachelor of Engineering', '586952', 'Benjamin', '', 'projects', 'male', 8596185625, 'Benjamin@gmail.com', 8285703354, 'demo', 'demo', 8285703354, 'H no- 18/1 Bihari puram phase-1 melrose bye pass', 'Aligarh', 'EPE', 202001, 'H no- 18/1 Bihari puram phase-1 melrose bye pass', 'Aligarh', 'EPE', 202001, '2021-11-28 16:40:07', ''),
(10, 112, 3, 4000, 0, '2022-01-28', 3, 'Bachelor  of Technology', '108061211', 'code', 'test', 'projects', 'male', 8467067344, 'test@gmail.com', 8796547890, 'ABC', 'XYZ', 7654321980, 'Janapriya Bharath Enclave, Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India\r\n#6262 janapriya', 'Bangalore West', 'Karnataka', 560091, 'Janapriya Bharath Enclave, Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India\r\n#6262 janapriya', 'Bangalore West', 'Karnataka', 560091, '2022-01-29 08:12:26', ''),
(11, 200, 2, 6000, 0, '2022-01-06', 9, 'Master of Computer Application', '100', 'Nikhil', 'S', 'Kumar', 'male', 7890872645, 'nikhil2@gmail.com', 8792615890, 'ABC', 'XYZ', 7617682980, '#58 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '#58 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '2022-01-29 08:40:30', ''),
(13, 201, 2, 6000, 0, '2022-01-26', 5, 'Bachelor  of Science', '0', 'sagar', 'g', 'u', 'male', 7655423466, 'sagar@gmail.com', 8796547890, 'ABC', 'XYZ', 7617682980, '#84 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '#84 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '2022-01-30 17:25:04', ''),
(14, 100, 5, 8000, 0, '2021-12-22', 4, 'Bachelor Of Computer Applications', '100', 'Nikhil', 'S', 'Kumar', 'male', 7890872645, 'nikhil@gmail.com', 8796547890, 'Deepa', 'Mother', 7654385980, '#90 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '#90 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '2022-01-31 10:02:25', ''),
(16, 112, 3, 4000, 0, '2022-03-25', 3, 'Bachelor Of Business Administration', '0', 'sam', 'a', 'b', 'male', 7890872145, 'sam@gmail.com', 8793547890, 'Deepa', 'XYZ', 7652121980, '#52 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '#52 Pipeline Road, Madeshwara Nagar, Sunkadakatte, Bengaluru, Karnataka, India', 'Bangalore West', 'Karnataka', 560091, '2022-03-29 04:12:37', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `fees` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `room_no`, `fees`, `posting_date`) VALUES
(1, 5, 100, 8000, '2021-12-01 22:45:43'),
(2, 2, 201, 6000, '2021-12-02 01:30:47'),
(4, 3, 112, 4000, '2021-12-02 01:31:07'),
(5, 5, 132, 2000, '2021-12-02 01:31:15'),
(6, 4, 321, 5000, '2022-01-31 11:04:33'),
(8, 2, 999, 10000, '2022-03-27 10:22:59'),
(10, 2, 1000, 1200, '2024-03-07 04:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Andaman and Nicobar Island (UT)'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh (UT)'),
(7, 'Chhattisgarh'),
(8, 'Dadra and Nagar Haveli (UT)'),
(9, 'Daman and Diu (UT)'),
(10, 'Delhi (NCT)'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu and Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kerala'),
(19, 'Lakshadweep (UT)'),
(20, 'Madhya Pradesh'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'Meghalaya'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Odisha'),
(27, 'Puducherry (UT)'),
(28, 'Punjab'),
(29, 'Rajastha'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telangana'),
(33, 'Tripura'),
(34, 'Uttarakhand'),
(35, 'EPE'),
(36, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `trig_course`
--

CREATE TABLE `trig_course` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_sn` varchar(50) NOT NULL,
  `course_fn` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trig_course`
--

INSERT INTO `trig_course` (`id`, `cid`, `course_code`, `course_sn`, `course_fn`, `operation`, `date`) VALUES
(1, 0, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'INSERTED', '2022-01-28'),
(2, 0, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'DELETED', '2022-01-28'),
(3, 0, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'INSERTED', '2022-01-28'),
(4, 0, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'DELETED', '2022-01-28'),
(5, 0, 'BC36356', 'BCA', 'Bachelor Of Computer Applications', 'UPDATED', '2022-01-28'),
(12, 0, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'INSERTED', '2022-01-30'),
(13, 0, 'BB1200', 'BBA', 'Bachelor Of Business Administrationss', 'UPDATED', '2022-01-30'),
(14, 12, 'BB1200', 'BBA', 'Bachelor Of Business Administrations', 'UPDATED', '2022-01-30'),
(15, 12, 'BB1200', 'BBA', 'Bachelor Of Business Administrations', 'DELETED', '2022-01-30'),
(16, 13, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'INSERTED', '2022-01-31'),
(17, 14, 'BB12000', 'BBA', 'Bachelor Of Business Administration', 'INSERTED', '2022-03-27'),
(18, 13, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'DELETED', '2022-03-27'),
(19, 14, 'BB12000', 'BBA', 'Bachelor Of Business Administration', 'DELETED', '2022-03-27'),
(20, 15, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'INSERTED', '2022-03-29'),
(21, 15, 'BB1200', 'BBA', 'Bachelor Of Business Administration', 'DELETED', '2022-03-29'),
(22, 16, 'CS21', 'DB', 'Database ', 'INSERTED', '2024-03-06'),
(23, 16, 'CS21', 'DB', 'Database ', 'DELETED', '2024-03-06'),
(24, 17, 'CS21', 'DB', 'Database ', 'INSERTED', '2024-03-06'),
(25, 18, 'CS21', 'DB', 'Database ', 'INSERTED', '2024-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userEmail`, `loginTime`) VALUES
(1, 10, 'test@gmail.com', '2021-12-05 06:16:42'),
(2, 10, 'test@gmail.com', '2021-12-06 11:20:28'),
(6, 20, 'Benjamin@gmail.com', '2021-12-06 16:40:57'),
(7, 10, 'test@gmail.com', '2021-12-08 07:43:43'),
(13, 10, 'test@gmail.com', '2022-01-20 07:19:58'),
(16, 10, 'test@gmail.com', '2022-01-30 08:57:11'),
(17, 27, 'sagar@gmail.com', '2022-01-30 17:18:24'),
(18, 27, 'sagar@gmail.com', '2022-01-30 17:22:54'),
(19, 27, 'sagar@gmail.com', '2022-01-31 06:50:48'),
(20, 28, 'nikhil@gmail.com', '2022-01-31 09:11:46'),
(21, 27, 'sagar@gmail.com', '2022-01-31 11:30:09'),
(22, 28, 'nikhil@gmail.com', '2022-01-31 11:31:05'),
(23, 27, 'sagar@gmail.com', '2022-02-01 07:35:44'),
(24, 27, 'sagar@gmail.com', '2022-03-27 06:29:20'),
(25, 29, 'guru@gmail.com', '2022-03-27 10:29:38'),
(26, 27, 'sagar@gmail.com', '2022-03-27 15:54:57'),
(27, 27, 'sagar@gmail.com', '2022-03-27 16:38:35'),
(28, 27, 'sagar@gmail.com', '2022-03-28 16:09:30'),
(29, 10, 'test@gmail.com', '2024-02-18 08:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contactNo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) NOT NULL,
  `passUpdateDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `regNo`, `firstName`, `middleName`, `lastName`, `gender`, `contactNo`, `email`, `password`, `regDate`, `updationDate`, `passUpdateDate`) VALUES
(10, '108061211', 'code', 'test', 'projects', 'male', 8467067344, 'test@gmail.com', 'Test@123', '2021-11-02 04:21:33', '04-11-2021 11:04:15', '23-11-2021 05:16:49'),
(19, '102355', 'Harry', 'projects', 'Singh', 'male', 6786786786, 'Harry@gmail.com', '6786786786', '2021-11-04 16:33:36', '', ''),
(20, '586952', 'Benjamin', '', 'projects', 'male', 8596185625, 'Benjamin@gmail.com', '8596185625', '2021-11-05 16:40:07', '', ''),
(25, '100', 'Nikhil', 'S', 'Kumar', 'male', 7890872645, 'nikhil2@gmail.com', '7890872645', '2022-01-29 08:40:30', '', ''),
(27, '626', 'sagar', 'g', 'u', 'male', 7655423466, 'sagar@gmail.com', 'sag123', '2022-01-30 17:12:31', '28-03-2022 09:40:59', ''),
(28, '100', 'Nikhil', 'S', 'Kumar', 'male', 7890872645, 'nikhil@gmail.com', 'nikku', '2022-01-31 09:09:03', '', ''),
(29, 'MS2', 'Guru', 'kiran', 'm', 'male', 7890798745, 'guru@gmail.com', 'gurukiran1', '2022-03-27 10:28:43', '27-03-2022 04:00:05', ''),
(30, 'MS24', 'sam', 'a', 'b', 'male', 7890872145, 'sam@gmail.com', '7890872145', '2022-03-29 04:12:37', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig_course`
--
ALTER TABLE `trig_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `trig_course`
--
ALTER TABLE `trig_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
