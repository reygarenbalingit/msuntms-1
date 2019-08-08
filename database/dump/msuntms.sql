-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2019 at 04:54 AM
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
  `trainee_Id` int(11) NOT NULL,
  `attend_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
  `pte_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance_sheet`
--

INSERT INTO `attendance_sheet` (`id`, `attendance_title`, `date_from`, `date_to`, `pte_id`, `created_at`, `updated_at`) VALUES
(1, 'Morning In', '2019-08-08 00:00:00.00', '2019-08-08 09:00:00.00', 1, '2019-08-06 23:25:42', '2019-08-06 23:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_text` text NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 'BS MB', '2019-08-06 22:17:07', '2019-08-06 22:50:11'),
(4, 'BS IT', '2019-08-06 23:59:09', '2019-08-06 23:59:09');

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
(1, 'Parent', 'Or', 'Guardian update', '09123456789', 'Naawan, Misamis Oriental', '2019-08-06 22:32:41', '2019-08-06 22:52:43');

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
(1, 'MSU-Naawan', '2019-08-06 22:29:21', '2019-08-06 22:46:43');

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
(1, 'Derkwin', 'IDK', 'Dela Cerna', '1990-01-01', 'Naawan, Misamis Oriental update', 'Male', '09123456789', 400, 'Doctoral Degree', '2019-08-07 07:02:57.47', 3, 1, 1, '2019-08-06 23:01:31', '2019-08-06 23:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `trainee_evaluation_answer`
--

CREATE TABLE `trainee_evaluation_answer` (
  `id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `eval_ans` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `training_questions_training_id` int(11) NOT NULL,
  `training_questions_evaluation_question_id` int(11) NOT NULL,
  `training_questions_id` int(11) NOT NULL
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
(1, 'Fish', 'MSU-Naawan', 'Erven Patoc', '2019-08-08 00:00:00', '2019-08-10 00:00:00', 1, '2019-08-06 23:13:31', '2019-08-06 23:17:10');

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `account_type` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `created_at` timestamp(2) NULL DEFAULT NULL,
  `updated_at` timestamp(2) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `account_type`, `firstname`, `middlename`, `lastname`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@sampleemail.com', '$2y$10$NxyOSRQih3GPKM.8MtA50OZt79ntIXNT7i7lCM76p6.V2iTIxUjkS', 'Admin', 'Admin', 'Admin', 'Admin', '2019-08-06 21:58:42.00', '2019-08-06 21:58:42.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_details_trainee_registration_form1_idx` (`trainee_Id`),
  ADD KEY `fk_attendance_details_attendance_sheet1_idx` (`attend_id`);

--
-- Indexes for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_sheet_participant_training-evaluation1_idx` (`pte_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`trainee_id`,`training_id`),
  ADD KEY `fk_trainee_registration_form_has_training_training1_idx` (`training_id`),
  ADD KEY `fk_trainee_registration_form_has_training_trainee_registrat_idx` (`trainee_id`);

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
  ADD KEY `fk_trainee_evaluation-answer_trainee_registration_form1_idx` (`trainee_id`),
  ADD KEY `fk_trainee_evaluation_answer_training_questions1_idx` (`training_questions_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `trainee_evaluation_answer`
--
ALTER TABLE `trainee_evaluation_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `training_questions`
--
ALTER TABLE `training_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `fk_attendance_details_trainee_registration_form1` FOREIGN KEY (`trainee_Id`) REFERENCES `trainee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD CONSTRAINT `fk_attendance_sheet_participant_training-evaluation1` FOREIGN KEY (`pte_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_trainee_registration_form_has_training_trainee_registratio1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_has_training_training1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_trainee_evaluation-answer_trainee_registration_form1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_evaluation_answer_training_questions1` FOREIGN KEY (`training_questions_id`) REFERENCES `training_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
