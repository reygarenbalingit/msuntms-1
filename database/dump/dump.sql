-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2019 at 07:35 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msuntms`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `idanswer` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `eval_question_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_details`
--

CREATE TABLE `attendance_details` (
  `id` int(11) NOT NULL,
  `date` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2) ON UPDATE CURRENT_TIMESTAMP(2),
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `training_trainees_id` int(11) NOT NULL,
  `attendance_sheet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_sheet`
--

CREATE TABLE `attendance_sheet` (
  `id` int(11) NOT NULL,
  `attendance_title` text NOT NULL,
  `date_from` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `date_to` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `training_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` text,
  `evaluation_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_text` varchar(160) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_text`, `created_at`, `updated_at`) VALUES
(1, 'None', '2019-08-16 03:50:19', '2019-08-16 03:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `id` int(11) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`id`, `fname`, `mname`, `lname`, `contact_number`, `address`, `created_at`, `updated_at`) VALUES
(1, 'None', 'None', 'None', 'None', 'None', '2019-08-16 03:53:32', '2019-08-16 03:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eval_question`
--

CREATE TABLE `eval_question` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question_text` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `school_name` varchar(160) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `school_name`, `created_at`, `updated_at`) VALUES
(1, 'None', '2019-08-16 03:51:21', '2019-08-16 03:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `trainee`
--

CREATE TABLE `trainee` (
  `id` int(11) NOT NULL,
  `trainee_fname` varchar(45) NOT NULL,
  `trainee_mname` varchar(45) NOT NULL,
  `trainee_lname` varchar(45) NOT NULL,
  `trainee_bdate` date NOT NULL,
  `trainee_home_add` varchar(145) NOT NULL,
  `trainee_sex` varchar(45) NOT NULL,
  `trainee_contact_no` varchar(15) NOT NULL,
  `required_no_of_hrs` double NOT NULL,
  `purpose_of_stay` varchar(45) NOT NULL,
  `date_submitted` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `courses_id` int(11) NOT NULL,
  `schools_id` int(11) NOT NULL,
  `emergency_contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainee`
--

INSERT INTO `trainee` (`id`, `trainee_fname`, `trainee_mname`, `trainee_lname`, `trainee_bdate`, `trainee_home_add`, `trainee_sex`, `trainee_contact_no`, `required_no_of_hrs`, `purpose_of_stay`, `date_submitted`, `courses_id`, `schools_id`, `emergency_contact_id`, `created_at`, `updated_at`) VALUES
(1, 'Paul Jerome', 'Jaudian', 'hambre', '1999-01-27', 'Naawan, Misamis Oriental', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-16 04:19:11.45', 1, 1, 1, '2019-08-15 20:19:11', '2019-08-15 20:19:11'),
(2, 'Fabian Sr.', 'Rosalejos', 'Eslit', '1961-01-20', 'Naawan, Misamis Oriental', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-16 04:20:46.77', 1, 1, 1, '2019-08-15 20:20:46', '2019-08-15 20:20:46'),
(3, 'Rene', 'Avila', 'Balingit', '1961-01-20', 'Naawan, Misamis Oriental', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-16 04:22:03.56', 1, 1, 1, '2019-08-15 20:22:03', '2019-08-15 20:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `title_of_training` varchar(160) NOT NULL,
  `location` varchar(45) NOT NULL,
  `trainer` text NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `title_of_training`, `location`, `trainer`, `date_from`, `date_to`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 'Fishes', 'MSUN FH', 'Reygaren Balingit', '2019-08-16 08:00:00', '2019-08-16 17:00:00', 1, '2019-08-15 20:06:15', '2019-08-15 20:06:15'),
(2, 'Sharks', 'MSUN FH', 'Derkwin Dela Cerna', '2019-08-17 08:00:00', '2019-08-17 17:00:00', 1, '2019-08-15 20:06:59', '2019-08-15 20:06:59'),
(3, 'Turtles', 'MSUN FH', 'Paul Jerome Hambre', '2019-08-18 08:00:00', '2019-08-18 17:00:00', 1, '2019-08-15 20:07:34', '2019-08-15 20:07:34'),
(4, 'Squids', 'MSUN FH', 'Erven Kent Patoc', '2019-08-19 08:00:00', '2019-08-19 17:00:00', 1, '2019-08-15 20:08:47', '2019-08-15 20:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `training_trainees`
--

CREATE TABLE `training_trainees` (
  `id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_trainees`
--

INSERT INTO `training_trainees` (`id`, `trainee_id`, `training_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-08-15 20:19:11', '2019-08-15 20:19:11'),
(2, 2, 1, '2019-08-15 20:20:46', '2019-08-15 20:20:46'),
(3, 3, 1, '2019-08-15 20:22:03', '2019-08-15 20:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `account_type` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `account_type`, `firstname`, `middlename`, `lastname`, `created_at`, `updated_at`, `password`) VALUES
(1, 'admin', 'admin@sampleemail.com', 'Admin', 'Admin', 'Admin', 'Admin', '2019-08-15 19:59:42', '2019-08-15 19:59:42', '$2y$10$oYJH0pD8/Dp3ZvaRDfj40uqM6RmhaiINHcz4WzrH7NWcakAmD9OYa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`idanswer`),
  ADD KEY `fk_answer_eval_question1_idx` (`eval_question_id`);

--
-- Indexes for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_details_training_trainees1_idx` (`training_trainees_id`),
  ADD KEY `fk_attendance_details_attendance_sheet1_idx` (`attendance_sheet_id`);

--
-- Indexes for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_sheet_participant_training-evaluation1_idx` (`training_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_evaluation1_idx` (`evaluation_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evaluation_training1_idx` (`training_id`);

--
-- Indexes for table `eval_question`
--
ALTER TABLE `eval_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_eval_question_evaluation1_idx` (`evaluation_id`),
  ADD KEY `fk_eval_question_questions1_idx` (`questions_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainee`
--
ALTER TABLE `trainee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trainee_registration_form_course1_idx` (`courses_id`),
  ADD KEY `fk_trainee_registration_form_school1_idx` (`schools_id`),
  ADD KEY `fk_trainee_registration_form_emergency_contact1_idx` (`emergency_contact_id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_participant_training-evaluation_account_idx` (`users_id`);

--
-- Indexes for table `training_trainees`
--
ALTER TABLE `training_trainees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_training_trainees_trainee1_idx` (`trainee_id`),
  ADD KEY `fk_training_trainees_training1_idx` (`training_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_details`
--
ALTER TABLE `attendance_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eval_question`
--
ALTER TABLE `eval_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `trainee`
--
ALTER TABLE `trainee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `training_trainees`
--
ALTER TABLE `training_trainees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `fk_answer_eval_question1` FOREIGN KEY (`eval_question_id`) REFERENCES `eval_question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD CONSTRAINT `fk_attendance_details_attendance_sheet1` FOREIGN KEY (`attendance_sheet_id`) REFERENCES `attendance_sheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attendance_details_training_trainees1` FOREIGN KEY (`training_trainees_id`) REFERENCES `training_trainees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD CONSTRAINT `fk_attendance_sheet_participant_training-evaluation1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_evaluation1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `fk_evaluation_training1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `eval_question`
--
ALTER TABLE `eval_question`
  ADD CONSTRAINT `fk_eval_question_evaluation1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_eval_question_questions1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainee`
--
ALTER TABLE `trainee`
  ADD CONSTRAINT `fk_trainee_registration_form_course1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_emergency_contact1` FOREIGN KEY (`emergency_contact_id`) REFERENCES `emergency_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_school1` FOREIGN KEY (`schools_id`) REFERENCES `schools` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `fk_participant_training-evaluation_account` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training_trainees`
--
ALTER TABLE `training_trainees`
  ADD CONSTRAINT `fk_training_trainees_trainee1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_training_trainees_training1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
