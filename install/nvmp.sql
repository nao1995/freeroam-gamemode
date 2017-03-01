-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2017 at 07:36 PM
-- Server version: 5.5.40
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nvmp`
--

-- --------------------------------------------------------

--
-- Table structure for table `game_bases`
--

CREATE TABLE `game_bases` (
  `id` int(10) UNSIGNED NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `faction_owner` int(10) UNSIGNED NOT NULL,
  `worldspace_x` float NOT NULL COMMENT 'X coordiate of base.',
  `worldspace_y` float NOT NULL COMMENT 'Y coordiate of base.',
  `worldspace_z` float NOT NULL COMMENT 'Z coordiate of base.',
  `worldspace_zone` int(10) UNSIGNED NOT NULL COMMENT 'Set to zero to disable worldspace ownership.',
  `worldspace_radius` float NOT NULL COMMENT 'Radius of worldpsace ownership.',
  `interior_ownerships` varchar(255) NOT NULL COMMENT 'CSV list of interior IDs owned by base',
  `spawn_x` float NOT NULL,
  `spawn_y` float NOT NULL,
  `spawn_z` float NOT NULL,
  `spawn_zone` int(10) UNSIGNED NOT NULL COMMENT 'Set to zero to disable exterior spawning.',
  `spawn_world_x` int(11) NOT NULL,
  `spawn_world_y` int(11) NOT NULL,
  `spawn_cell` varchar(64) NOT NULL,
  `has_spawn` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game_characters`
--

CREATE TABLE `game_characters` (
  `id` int(10) UNSIGNED NOT NULL,
  `fid` int(10) UNSIGNED NOT NULL,
  `active_token` varchar(128) DEFAULT NULL COMMENT 'The user''s active token session.',
  `active_logintime` int(32) UNSIGNED DEFAULT NULL,
  `is_alive` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `xp` float NOT NULL DEFAULT '0',
  `xp_base` float NOT NULL DEFAULT '0',
  `actionpoints` float NOT NULL DEFAULT '80',
  `actionpoints_base` float NOT NULL DEFAULT '80',
  `av_fatigue` float NOT NULL DEFAULT '200',
  `av_fatigue_base` float NOT NULL DEFAULT '200',
  `av_karma` float NOT NULL DEFAULT '0',
  `av_karma_base` float NOT NULL DEFAULT '0',
  `av_head` float NOT NULL DEFAULT '100',
  `av_head_base` float NOT NULL DEFAULT '100',
  `av_chest` float NOT NULL DEFAULT '100',
  `av_chest_base` float NOT NULL DEFAULT '100',
  `av_left_leg` float NOT NULL DEFAULT '100',
  `av_left_leg_base` float NOT NULL DEFAULT '100',
  `av_right_leg` float NOT NULL DEFAULT '100',
  `av_right_leg_base` float NOT NULL DEFAULT '100',
  `av_left_arm` float NOT NULL DEFAULT '100',
  `av_left_arm_base` float NOT NULL DEFAULT '100',
  `av_right_arm` float NOT NULL DEFAULT '100',
  `av_right_arm_base` float NOT NULL DEFAULT '100',
  `av_unarmeddamage` float NOT NULL DEFAULT '1.25',
  `av_unarmeddamage_base` float NOT NULL DEFAULT '1.25',
  `av_damageresistance` float NOT NULL DEFAULT '0',
  `av_damageresistance_base` float NOT NULL DEFAULT '0',
  `av_skill_bigguns` float NOT NULL DEFAULT '0',
  `av_skill_energyweapons` float NOT NULL DEFAULT '0',
  `av_skill_explosives` float NOT NULL DEFAULT '0',
  `av_skill_lockpick` float NOT NULL DEFAULT '0',
  `av_skill_medicine` float NOT NULL DEFAULT '0',
  `av_skill_meleeweapons` float NOT NULL DEFAULT '0',
  `av_skill_repair` float NOT NULL DEFAULT '0',
  `av_skill_science` float NOT NULL DEFAULT '0',
  `av_skill_sneak` float NOT NULL DEFAULT '0',
  `av_skill_speech` float NOT NULL DEFAULT '0',
  `av_skill_barter` float NOT NULL DEFAULT '0',
  `av_skill_throwing` float NOT NULL DEFAULT '0',
  `av_skill_unarmed` float NOT NULL DEFAULT '0',
  `av_stat_strength` float NOT NULL DEFAULT '5',
  `av_stat_strength_base` float NOT NULL DEFAULT '5',
  `av_stat_perception` float NOT NULL DEFAULT '5',
  `av_stat_perception_base` float NOT NULL DEFAULT '5',
  `av_stat_endurance` float NOT NULL DEFAULT '5',
  `av_stat_endurance_base` float NOT NULL DEFAULT '5',
  `av_stat_charisma` float NOT NULL DEFAULT '5',
  `av_stat_charisma_base` float NOT NULL DEFAULT '5',
  `av_stat_intelligence` float NOT NULL DEFAULT '5',
  `av_stat_intelligence_base` float NOT NULL DEFAULT '5',
  `av_stat_agility` float NOT NULL DEFAULT '5',
  `av_stat_agility_base` float NOT NULL DEFAULT '5',
  `av_stat_luck` float NOT NULL DEFAULT '5',
  `av_stat_luck_base` float NOT NULL DEFAULT '5',
  `game_minutes` float NOT NULL DEFAULT '0',
  `health` float NOT NULL DEFAULT '200',
  `health_base` float NOT NULL DEFAULT '200',
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `created` tinyint(1) NOT NULL DEFAULT '0',
  `cellid` varchar(32) DEFAULT NULL,
  `is_exterior` tinyint(1) NOT NULL,
  `exteriorx` int(11) NOT NULL DEFAULT '0',
  `exteriory` int(11) NOT NULL DEFAULT '0',
  `exteriorz` int(11) NOT NULL DEFAULT '4' COMMENT 'The zone the user is in.',
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `rotp` float NOT NULL DEFAULT '0',
  `roty` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game_items`
--

CREATE TABLE `game_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `health` float NOT NULL DEFAULT '100',
  `equipped` tinyint(1) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game_keys`
--

CREATE TABLE `game_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `bin` varchar(32) NOT NULL,
  `xf_owner` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `xf_creator` int(10) UNSIGNED NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `source` varchar(16) NOT NULL DEFAULT 'raw'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game_bases`
--
ALTER TABLE `game_bases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_characters`
--
ALTER TABLE `game_characters`
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `game_items`
--
ALTER TABLE `game_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Owner pair` (`owner`);

--
-- Indexes for table `game_keys`
--
ALTER TABLE `game_keys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game_bases`
--
ALTER TABLE `game_bases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `game_characters`
--
ALTER TABLE `game_characters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `game_items`
--
ALTER TABLE `game_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `game_keys`
--
ALTER TABLE `game_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=729;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
