-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2023 at 08:39 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pictogram`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(1, 20, 7, 'test', '2023-04-02 16:34:45'),
(2, 20, 7, 'this is another comment', '2023-04-02 16:36:17'),
(6, 20, 5, 'yo', '2023-04-02 17:02:19'),
(7, 20, 5, 'hi', '2023-04-04 11:38:10'),
(8, 20, 5, 'Amazing Pic', '2023-04-04 11:38:26'),
(9, 15, 5, 'sasdasd', '2023-04-09 20:40:33'),
(10, 20, 5, 'nice', '2023-08-02 20:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `follow_list`
--

CREATE TABLE `follow_list` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow_list`
--

INSERT INTO `follow_list` (`id`, `follower_id`, `user_id`) VALUES
(36, 7, 5),
(37, 12, 5),
(38, 12, 7),
(42, 5, 7),
(44, 16, 5),
(46, 16, 1),
(47, 16, 6),
(48, 7, 16),
(49, 5, 16);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(18, 14, 7),
(20, 20, 7),
(21, 13, 7),
(24, 14, 5),
(26, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `created_at`) VALUES
(11, 5, '1680374373IMG-20220925-WA0030.jpg', '', '2023-04-01 18:39:33'),
(12, 5, '1680374380IMG-20220925-WA0031.jpg', '', '2023-04-01 18:39:40'),
(13, 7, '1680374465IMG-20221023-WA0038.jpg', '', '2023-04-01 18:41:05'),
(14, 7, '1680374471IMG-20221023-WA0039.jpg', '', '2023-04-01 18:41:11'),
(15, 5, '1680383064IMG_9138.jpg', 'Family Trip!!', '2023-04-01 21:04:24'),
(16, 13, '168038324120221225_133700.jpg', 'Maggi time\r\n', '2023-04-01 21:07:21'),
(17, 14, '168038438420221229_111400.jpg', 'Heaven on Earth !', '2023-04-01 21:26:24'),
(18, 14, '168038452320221225_134844.jpg', '', '2023-04-01 21:28:43'),
(19, 15, '168038528620221229_111400.jpg', 'Heaven on Earth!!\r\n', '2023-04-01 21:41:26'),
(20, 16, '1680437042IMG_20210925_181313.jpg', 'Evening at SRM', '2023-04-02 12:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` text NOT NULL DEFAULT 'default_profile.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ac_status` int(11) NOT NULL COMMENT '0=Not Verified, 1=Active, 2=Blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `username`, `password`, `profile_pic`, `created_at`, `updated_at`, `ac_status`) VALUES
(1, 'G', 'Raj', 1, 'gauravxd12341@gmail.com', 'Amaterasu1', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-03-27 12:30:54', '2023-03-30 20:29:35', 1),
(5, 'Gaurav', 'Raj', 1, 'graj.mobile@gmail.com', 'amaterasu5', '4a7b7d4c9c4fa021d60118925152e334', '168038303720221224_113814.jpg', '2023-03-28 10:01:44', '2023-04-01 21:11:21', 1),
(6, 'Ashish', 'Singh', 1, 'singhaashish6303@gmail.com', 'Ashish', 'f190ce9ac8445d249747cab7be43f7d5', 'default_profile.jpg', '2023-03-31 09:34:43', '2023-04-01 20:13:57', 1),
(7, 'Anubhav', 'Vats', 1, 'vatsanubhav933@gmail.com', 'amaterasu6', '4a7b7d4c9c4fa021d60118925152e334', '1680432750IMG_20210917_140423.jpg', '2023-04-01 18:18:18', '2023-04-02 10:52:30', 1),
(8, 'Gayatri', 'Malladi', 2, 'test@gmail.com', 'amaterasu7', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-04-01 18:48:16', '2023-04-01 20:13:31', 1),
(9, 'Kshitij', 'Arya', 1, 'test2@gmail.com', 'itachi', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-04-01 20:09:21', '2023-04-01 20:09:35', 1),
(10, 'Rutuja', 'Pargaonkar', 2, 'test3@gmail.com', 'Konan', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-04-01 20:10:57', '2023-04-01 20:11:08', 1),
(11, 'Rimendra', 'Agarwal', 1, 'test4@gmail.com', 'chutiya', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-04-01 20:12:10', '2023-04-01 20:12:17', 1),
(12, 'Sameeksha', 'Bharadwaj', 2, 'test5@gmail.com', 'summi', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-04-01 20:14:40', '2023-04-01 20:14:46', 1),
(13, 'Rahul', 'Sinha', 1, 'test6@gmail.com', 'rahulS', '4a7b7d4c9c4fa021d60118925152e334', 'default_profile.jpg', '2023-04-01 21:06:06', '2023-04-01 21:06:58', 1),
(14, 'Gaurav', 'Kumar', 1, 'graj.12341@gmail.com', 'G_Raj', '4a7b7d4c9c4fa021d60118925152e334', '168038441720221222_152832.jpg', '2023-04-01 21:25:34', '2023-04-01 21:30:48', 1),
(15, 'Rohan', 'K', 1, 'gr2624@srmist.edu.in', 'RohanS', '4a7b7d4c9c4fa021d60118925152e334', '168038526320221229_105219.jpg', '2023-04-01 21:39:50', '2023-04-04 11:40:28', 2),
(16, 'Kavita', 'Shankar121', 2, 'shankarkavita121@gmail.com', 'kavitaS', '81dc9bdb52d04dc20036dbd8313ed055', '168043697820220410_132817.jpg', '2023-04-02 12:00:58', '2023-04-02 12:08:12', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_list`
--
ALTER TABLE `follow_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `follow_list`
--
ALTER TABLE `follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
