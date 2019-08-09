-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2019 at 08:43 AM
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
-- Table structure for table `attendance_details`
--

CREATE TABLE `attendance_details` (
  `id` int(11) NOT NULL,
  `date` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2) ON UPDATE CURRENT_TIMESTAMP(2),
  `attend_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `training_trainees_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance_details`
--

INSERT INTO `attendance_details` (`id`, `date`, `attend_id`, `created_at`, `updated_at`, `training_trainees_id`) VALUES
(1, '2019-08-09 06:08:47.27', 6, '2019-08-08 22:08:47', '2019-08-08 22:08:47', 3),
(2, '2019-08-09 06:26:40.53', 6, '2019-08-08 22:26:40', '2019-08-08 22:26:40', 6);

-- --------------------------------------------------------

--
-- Table structure for table `attendance_sheet`
--

CREATE TABLE `attendance_sheet` (
  `id` int(11) NOT NULL,
  `attendance_title` text NOT NULL,
  `date_from` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `date_to` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2),
  `pte_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance_sheet`
--

INSERT INTO `attendance_sheet` (`id`, `attendance_title`, `date_from`, `date_to`, `pte_id`, `created_at`, `updated_at`) VALUES
(1, 'Morining in', '2019-08-08 00:00:00.00', '2019-08-08 04:00:00.00', 1, '2019-08-08 19:11:27', '2019-08-08 19:11:27'),
(2, 'Afternoon', '2019-08-08 05:00:00.00', '2019-08-08 09:00:00.00', 1, '2019-08-08 19:12:16', '2019-08-08 19:12:16'),
(3, 'Morning', '2019-08-08 00:00:00.00', '2019-08-08 04:00:00.00', 2, '2019-08-08 19:13:28', '2019-08-08 19:13:28'),
(4, 'Morning', '2019-08-08 00:00:00.00', '2019-08-08 04:00:00.00', 3, '2019-08-08 19:13:43', '2019-08-08 19:13:43'),
(5, 'Afternoon', '2019-08-08 05:00:00.00', '2019-08-08 09:00:00.00', 2, '2019-08-08 19:14:31', '2019-08-08 19:14:31'),
(6, 'Afternoon', '2019-08-08 05:00:00.00', '2019-08-08 09:00:00.00', 3, '2019-08-08 19:14:45', '2019-08-08 19:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_text` varchar(160) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_text`, `created_at`, `updated_at`) VALUES
(1, 'BS IT', '2019-08-08 18:10:32', '2019-08-08 18:10:32');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`id`, `fname`, `mname`, `lname`, `contact_number`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Secret Name', 'Secret MidName', 'Secret LName', '09123456789', 'Naawan, Misamis Oriental', '2019-08-08 18:10:33', '2019-08-08 18:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_question`
--

CREATE TABLE `evaluation_question` (
  `id` int(11) NOT NULL,
  `question_number` int(11) NOT NULL,
  `question_text` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `school_name` varchar(160) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `school_name`, `created_at`, `updated_at`) VALUES
(1, 'MSU Naawan', '2019-08-08 18:10:33', '2019-08-08 18:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `trainee`
--

CREATE TABLE `trainee` (
  `id` int(11) NOT NULL,
  `trainee_fname` varchar(45) NOT NULL,
  `trainee_mname` varchar(45) DEFAULT NULL,
  `trainee_lname` varchar(45) NOT NULL,
  `trainee_bdate` date NOT NULL,
  `trainee_home_add` varchar(145) NOT NULL,
  `trainee_sex` varchar(45) NOT NULL,
  `trainee_contact_no` varchar(15) NOT NULL,
  `required_no_of_hrs` double NOT NULL,
  `purpose_of_stay` varchar(45) NOT NULL,
  `date_submitted` timestamp(2) NOT NULL DEFAULT CURRENT_TIMESTAMP(2) ON UPDATE CURRENT_TIMESTAMP(2),
  `course_idcourse` int(11) NOT NULL,
  `school_idschool` int(11) NOT NULL,
  `emergency_contact` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainee`
--

INSERT INTO `trainee` (`id`, `trainee_fname`, `trainee_mname`, `trainee_lname`, `trainee_bdate`, `trainee_home_add`, `trainee_sex`, `trainee_contact_no`, `required_no_of_hrs`, `purpose_of_stay`, `date_submitted`, `course_idcourse`, `school_idschool`, `emergency_contact`, `created_at`, `updated_at`) VALUES
(2, 'Derkwin', 'IDK', 'Dela Cerna', '1990-01-01', 'Naawan, Misamis Oriental update', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-09 02:10:34.89', 1, 1, 1, '2019-08-08 18:10:34', '2019-08-08 18:10:34'),
(3, 'Fabian Jr.', 'Bantaculo', 'Eslit', '1999-01-27', 'Naawan, Misamis Oriental update', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-09 02:51:47.73', 1, 1, 1, '2019-08-08 18:51:47', '2019-08-08 18:51:47'),
(4, 'Axelle', NULL, 'Taleon', '1999-01-27', 'Naawan, Misamis Oriental update', 'Female', '09123456789', 400, 'Doctoral Degree', '2019-08-09 02:57:27.20', 1, 1, 1, '2019-08-08 18:57:27', '2019-08-08 18:57:27'),
(5, 'Joshua', 'Ardoza', 'Gervacio', '1999-01-27', 'Naawan, Misamis Oriental update', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-09 02:58:37.29', 1, 1, 1, '2019-08-08 18:58:37', '2019-08-08 18:58:37'),
(6, 'Paul Jerome', 'Jaudian', 'hambre', '1999-01-27', 'Naawan, Misamis Oriental', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-09 02:59:39.86', 1, 1, 1, '2019-08-08 18:59:39', '2019-08-08 18:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `trainee_evaluation_answer`
--

CREATE TABLE `trainee_evaluation_answer` (
  `id` int(11) NOT NULL,
  `eval_ans` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `training_questions_id` int(11) NOT NULL,
  `training_trainees_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `title_of_training`, `location`, `trainer`, `date_from`, `date_to`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Fish Processing', 'MSUN FH', 'Derkwin', '2019-08-08 08:00:00', '2019-08-10 17:00:00', 1, '2019-08-08 18:00:12', '2019-08-08 18:00:12'),
(2, 'Squid Processing', 'MSUN FH', 'Axelle', '2019-08-08 08:00:00', '2019-08-10 17:00:00', 1, '2019-08-08 19:03:00', '2019-08-08 19:03:00'),
(3, 'Tilapia Processing', 'MSUN FH', 'Axelle', '2019-08-08 08:00:00', '2019-08-10 17:00:00', 1, '2019-08-08 19:03:54', '2019-08-08 19:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `training_questions`
--

CREATE TABLE `training_questions` (
  `id` int(11) NOT NULL,
  `evaluation_question_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `training_trainees`
--

CREATE TABLE `training_trainees` (
  `id` int(11) NOT NULL,
  `comment_text` text,
  `trainee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `training_trainees`
--

INSERT INTO `training_trainees` (`id`, `comment_text`, `trainee_id`, `training_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 1, '2019-08-08 18:32:26', '2019-08-08 18:32:26'),
(2, NULL, 2, 2, '2019-08-08 19:21:14', '2019-08-08 19:21:14'),
(3, NULL, 2, 3, '2019-08-08 19:21:30', '2019-08-08 19:21:30'),
(4, NULL, 3, 1, '2019-08-08 19:21:54', '2019-08-08 19:21:54'),
(5, NULL, 3, 2, '2019-08-08 19:22:06', '2019-08-08 19:22:06'),
(6, NULL, 3, 3, '2019-08-08 19:22:19', '2019-08-08 19:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `account_type` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `remember_token` varchar(100) NOT NULL DEFAULT 'NO',
  `created_at` timestamp(2) NULL DEFAULT NULL,
  `updated_at` timestamp(2) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `account_type`, `firstname`, `middlename`, `lastname`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$qfXnK1OsGRUx746OoHF5i.7wk7ZJwPn3.Oqwn6WoJK/AVakuurW6G', 'admin@sampleemail.com', 'Admin', 'Admin', 'Admin', 'Admin', 'NO', '2019-08-08 17:51:48.00', '2019-08-08 17:51:48.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_details_attendance_sheet1_idx` (`attend_id`),
  ADD KEY `fk_attendance_details_training_trainees1_idx` (`training_trainees_id`);

--
-- Indexes for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_sheet_participant_training-evaluation1_idx` (`pte_id`);

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
-- Indexes for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
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
  ADD KEY `fk_trainee_registration_form_course1_idx` (`course_idcourse`),
  ADD KEY `fk_trainee_registration_form_school1_idx` (`school_idschool`),
  ADD KEY `fk_trainee_registration_form_emergency_contact1_idx` (`emergency_contact`);

--
-- Indexes for table `trainee_evaluation_answer`
--
ALTER TABLE `trainee_evaluation_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trainee_evaluation_answer_training_questions1_idx` (`training_questions_id`),
  ADD KEY `fk_trainee_evaluation_answer_training_trainees1_idx` (`training_trainees_id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_participant_training-evaluation_account_idx` (`user_id`);

--
-- Indexes for table `training_questions`
--
ALTER TABLE `training_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_training_questions_evaluation_question1_idx` (`evaluation_question_id`),
  ADD KEY `fk_training_questions_training1_idx` (`training_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
-- AUTO_INCREMENT for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `trainee_evaluation_answer`
--
ALTER TABLE `trainee_evaluation_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `training_questions`
--
ALTER TABLE `training_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `training_trainees`
--
ALTER TABLE `training_trainees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD CONSTRAINT `fk_attendance_details_attendance_sheet1` FOREIGN KEY (`attend_id`) REFERENCES `attendance_sheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attendance_details_training_trainees1` FOREIGN KEY (`training_trainees_id`) REFERENCES `training_trainees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD CONSTRAINT `fk_attendance_sheet_participant_training-evaluation1` FOREIGN KEY (`pte_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainee`
--
ALTER TABLE `trainee`
  ADD CONSTRAINT `fk_trainee_registration_form_course1` FOREIGN KEY (`course_idcourse`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_emergency_contact1` FOREIGN KEY (`emergency_contact`) REFERENCES `emergency_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_school1` FOREIGN KEY (`school_idschool`) REFERENCES `schools` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainee_evaluation_answer`
--
ALTER TABLE `trainee_evaluation_answer`
  ADD CONSTRAINT `fk_trainee_evaluation_answer_training_questions1` FOREIGN KEY (`training_questions_id`) REFERENCES `training_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_evaluation_answer_training_trainees1` FOREIGN KEY (`training_trainees_id`) REFERENCES `training_trainees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `fk_participant_training-evaluation_account` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training_questions`
--
ALTER TABLE `training_questions`
  ADD CONSTRAINT `fk_training_questions_evaluation_question1` FOREIGN KEY (`evaluation_question_id`) REFERENCES `evaluation_question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_training_questions_training1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
