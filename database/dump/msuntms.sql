-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2019 at 04:12 PM
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trainee_Id` int(11) NOT NULL,
  `attend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_sheet`
--

CREATE TABLE `attendance_sheet` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `pte_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(16, 'BS IT', '2019-07-13 05:43:52', '2019-07-13 05:45:51');

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
(4, 'Fabian Jr.', 'Bantaculo', 'Eslit', '0926294787', 'Naawan, Misamis Oriental', '2019-07-13 05:29:46', '2019-07-13 05:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_question`
--

CREATE TABLE `evaluation_question` (
  `id` int(11) NOT NULL,
  `question_text` varchar(250) NOT NULL,
  `participant_training-evaluation_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_000000_create_users_table', 1),
(21, '2014_10_12_100000_create_password_resets_table', 1),
(22, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(23, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(24, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(25, '2016_06_01_000004_create_oauth_clients_table', 1),
(26, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `school_name` varchar(160) NOT NULL,
  `address` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `school_name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'MSU-Naawan', 'Naawan, Misamis Oriental', '2019-07-13 04:51:51', '2019-07-13 05:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `trainee_evaluation-answer`
--

CREATE TABLE `trainee_evaluation-answer` (
  `id` int(11) NOT NULL,
  `evaluation_question_eq_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `eval_ans` int(11) NOT NULL,
  `eval_comment` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trainee_registration_form`
--

CREATE TABLE `trainee_registration_form` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_idcourse` int(11) NOT NULL,
  `school_idschool` int(11) NOT NULL,
  `emergency_contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `title_of_training` varchar(160) NOT NULL,
  `location` varchar(45) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `account_type` varchar(191) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `middlename` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `account_type`, `firstname`, `middlename`, `lastname`, `remember_token`, `created_at`, `updated_at`) VALUES
(43, 'fabianeslit@email.com', 'fabianeslit', '$2y$10$osG0IMJ6b6N4ElNn88pL/u857u/.F9fFN8jy6.KV9dMTovM16zDL2', 'ADMIN', 'fabian', 'jr', 'eslit', NULL, '2019-07-11 18:39:55', '2019-07-11 18:39:55');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evaluation_question_participant_training-evaluation1_idx` (`participant_training-evaluation_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainee_evaluation-answer`
--
ALTER TABLE `trainee_evaluation-answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evaluation-answer_evaluation_question1_idx` (`evaluation_question_eq_id`),
  ADD KEY `fk_trainee_evaluation-answer_trainee_registration_form1_idx` (`trainee_id`);

--
-- Indexes for table `trainee_registration_form`
--
ALTER TABLE `trainee_registration_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trainee_registration_form_course1_idx` (`course_idcourse`),
  ADD KEY `fk_trainee_registration_form_school1_idx` (`school_idschool`),
  ADD KEY `fk_trainee_registration_form_emergency_contact1_idx` (`emergency_contact`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

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
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `trainee_evaluation-answer`
--
ALTER TABLE `trainee_evaluation-answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trainee_registration_form`
--
ALTER TABLE `trainee_registration_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD CONSTRAINT `fk_attendance_details_attendance_sheet1` FOREIGN KEY (`attend_id`) REFERENCES `attendance_sheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attendance_details_trainee_registration_form1` FOREIGN KEY (`trainee_Id`) REFERENCES `trainee_registration_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attendance_sheet`
--
ALTER TABLE `attendance_sheet`
  ADD CONSTRAINT `fk_attendance_sheet_participant_training-evaluation1` FOREIGN KEY (`pte_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `evaluation_question`
--
ALTER TABLE `evaluation_question`
  ADD CONSTRAINT `fk_evaluation_question_participant_training-evaluation1` FOREIGN KEY (`participant_training-evaluation_id`) REFERENCES `training` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainee_evaluation-answer`
--
ALTER TABLE `trainee_evaluation-answer`
  ADD CONSTRAINT `fk_evaluation-answer_evaluation_question1` FOREIGN KEY (`evaluation_question_eq_id`) REFERENCES `evaluation_question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_evaluation-answer_trainee_registration_form1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee_registration_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainee_registration_form`
--
ALTER TABLE `trainee_registration_form`
  ADD CONSTRAINT `fk_trainee_registration_form_course1` FOREIGN KEY (`course_idcourse`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_emergency_contact1` FOREIGN KEY (`emergency_contact`) REFERENCES `emergency_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trainee_registration_form_school1` FOREIGN KEY (`school_idschool`) REFERENCES `schools` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
