-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2016 at 04:34 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fanspot`
--
CREATE DATABASE IF NOT EXISTS `fanspot` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `fanspot`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `addresses`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addresses`()
BEGIN
SELECT * FROM users;
END$$

DROP PROCEDURE IF EXISTS `avgUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `avgUser`()
BEGIN
	SELECT Avg(userId) AS userIdAvg 
    FROM address;
END$$

DROP PROCEDURE IF EXISTS `blobTest`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `blobTest`(IN user blob)
BEGIN
INSERT INTO fans (user) VALUES (user);
END$$

DROP PROCEDURE IF EXISTS `createAddress`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createAddress`(pStreetName varchar(64), pCity varchar(64), pState text, pCountry text, pZipcode int(10), pUserId bigint(20), pUserAddressNumber bigint(20))
BEGIN
INSERT INTO address (streetName, city, state, country, zipcode, userId, userAddressNumber) VALUES (pStreetName, pCity, pState, pCountry, pZipcode, pUserId, pUserAddressNumber);
END$$

DROP PROCEDURE IF EXISTS `createContest`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createContest`(pIdolName varchar(32), pContestName varchar(32), pRewardFanpoints decimal(16,2), pRewardCash decimal(16,2), pRewardOther varchar(32), pContestType tinyint(1), pContestEnds date, pContestPrice decimal(8,2), pContestWinner varchar(32), pContestDescription varchar(256), pIdolId bigint(64))
BEGIN
INSERT INTO contests (idolName, contestName, rewardFanpoints, rewardCash, rewardOther, contestType, contestEnds, contestPrice, contestWinner, contestDescription, idolId) VALUES (pIdolName, pContestName, pRewardFanpoints, pRewardCash, pRewardOther, pContestType, pContestEnds, pContestPrice, pContestWinner, pContestDescription, pIdolId);
END$$

DROP PROCEDURE IF EXISTS `createContestEntry`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createContestEntry`(pContestId bigint(20), pContestName varchar(32), pUser varchar(32), pIdol varchar(32), pWinner tinyint(1), pEntry longblob)
BEGIN
INSERT INTO contestEntries (contestId, contestName, user, idol, winner, entry) VALUES (pContestId, pContestName, pUser, pIdol, pWinner, pEntry);
END$$

DROP PROCEDURE IF EXISTS `createFan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createFan`(pUser varchar(32), pIdol varchar(32), pIdolId bigint(64), pFanpoints int(32), pContestEntries int(32), pContestWins int(32), pFirstDegreeReferrals int(32), pSecondDegreeReferrals int(32), pThirdDegreeReferrals int(32), p321Deal tinyint(1), pReferee varchar(32), pPosition int(32))
BEGIN
INSERT INTO fans (user, idol, idolId, fanpoints, contestEntries, contestWins, firstDegreeReferrals, secondDegreeReferrals, thirdDegreeReferrals, 321Deal, referee, position) VALUES (pUser, pIdol, pIdolId, pFanpoints, pContestEntries, pContestWins, pFirstDegreeReferrals, pSecondDegreeReferrals, pThirdDegreeReferrals, p321Deal, pReferee, pPosition);
END$$

DROP PROCEDURE IF EXISTS `createIdol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createIdol`(pUser varchar(32) , pIdolName varchar(32), pIdolUrl varchar(32), pPriceToBecomeFan decimal(16,2), p321DealActive tinyint(1), pPriceFor321Deal decimal(16,2), pActive tinyint(1))
BEGIN
INSERT INTO idols (user, idolName, idolUrl, priceToBecomeFan, 321DealActive, priceFor321Deal, active) VALUES (pUser, pIdolName, pIdolUrl, pPriceToBecomeFan, p321DealActive, pPriceFor321Deal, pActive);
END$$

DROP PROCEDURE IF EXISTS `createPaymentOption`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPaymentOption`(pFirstName text, pMiddleInitial text, pLastName text, pCardNumber int(16), pCardExperationDate date, pCardSecurityCode int(3))
BEGIN
INSERT INTO paymentInformation (firstName, middleInitial, lastName, cardNumber, cardExpirationDate, cardSecurityCode) VALUES (pFirstName, pMiddleInitial, pLastName, pCardNumber, pCardExpirationDate, pCardSecurityCode);
END$$

DROP PROCEDURE IF EXISTS `createPaymentTransaction`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPaymentTransaction`(pItemName varchar(32), pItemType varchar(32), pSeller varchar(32), pPurchaser varchar(32), pPrice decimal(32,2))
BEGIN
INSERT INTO createPaymentTransaction (itemName, itemType, seller, purchaser, price) VALUES (pItemName, pItemType, pSeller, pPurchaser, pPrice);
END$$

DROP PROCEDURE IF EXISTS `createUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(IN pUsername varchar(16), pPassword varchar(32), pEmail varchar(32), pVerified tinyint(1), pAmountOwed decimal(30,2), pTotalEarned decimal(30,2), pActive tinyint(1))
INSERT INTO users (username, password, email, verified, amountOwed, totalEarned, active) VALUES (pUsername, pPassword, pEmail, pVerified, pAmountOwed, pTotalEarned, pActive)$$

DROP PROCEDURE IF EXISTS `selectAddress`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectAddress`(IN `pUserId` BIGINT(64))
BEGIN
SELECT
    streetName,
    city,
    state,
    country,
    zipcode
FROM
	address
WHERE
	userId = pUserId;
END$$

DROP PROCEDURE IF EXISTS `selectAddresses`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectAddresses`(IN `pUserId` INT)
BEGIN
SET @userId = pUserId;
SET @adrQry = 'SELECT streetName, city, state, country, zipcode 
FROM address
WHERE userId = @userId;';
SELECT @adrQry;
END$$

DROP PROCEDURE IF EXISTS `selectContest`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectContest`(IN pIdolId bigint(64))
BEGIN
SELECT contestName, rewardFanpoints, rewardCash, rewardOther, contestType, creationTime, contestEnds, contestPrice, contestWinner, contestDescription, creationTime
FROM contests
WHERE idolId=pIdolId;
END$$

DROP PROCEDURE IF EXISTS `selectContestByIdolId`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectContestByIdolId`(IN pIdolId bigint(64))
BEGIN
SELECT contestName, rewardFanpoints, rewardCash, rewardOther, contestType, creationTime, contestEnds, contestPrice, contestWinner, contestDescription
FROM contests
WHERE idolId=pIdolId;
END$$

DROP PROCEDURE IF EXISTS `selectContestEntries`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectContestEntries`(pContestId bigint(64))
BEGIN
    SELECT contestName, user, idol, winner, entry, entryTime 
    FROM contestentries 
    WHERE contestId = pContestId;
END$$

DROP PROCEDURE IF EXISTS `selectContests`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectContests`(IN pIdolId bigint(64))
BEGIN
SELECT contestName, rewardFanpoints, rewardCash, rewardOther, contestType, creationTime, contestEnds, contestPrice, contestWinner, contestDescription
FROM contests
WHERE idolId=pIdolId;
END$$

DROP PROCEDURE IF EXISTS `selectFan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectFan`(IN pFanId BIGINT(64), IN pIdolId BIGINT(64))
BEGIN
SELECT 
	user, 
    idol, 
    idolId, 
    fanpoints, 
    contestEntries, 
    contestWins, 
    firstDegreeReferrals, 
    secondDegreeReferrals, 
    thirdDegreeReferrals, 
    321Deal, 
    referee, 
    position
FROM
	fans
WHERE 
	fanId = pFanId && idolId = pIdolId;
END$$

DROP PROCEDURE IF EXISTS `selectFanByIdolIdandUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectFanByIdolIdandUser`(IN pIdolId int(64), IN pUser varchar(64))
BEGIN
SELECT user FROM fans WHERE idolId = pIdolId & user = pUser;
END$$

DROP PROCEDURE IF EXISTS `selectIdol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectIdol`(IN pIdolUrl VARCHAR(64))
BEGIN
		SELECT idolName, idolUrl, priceToBecomeFan, 321DealActive, priceFor321Deal, active FROM idols WHERE idolId=pIdolId;
    END$$

DROP PROCEDURE IF EXISTS `selectIdolIdAndIdolNameByFan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectIdolIdAndIdolNameByFan`(IN pUsername varchar(64))
BEGIN
SELECT idolId, idol FROM fans WHERE user = pUsername;
END$$

DROP PROCEDURE IF EXISTS `selectIdolNameByFan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectIdolNameByFan`(IN pUsername varchar(64))
BEGIN
SELECT idol FROM fans WHERE user = pUsername;
END$$

DROP PROCEDURE IF EXISTS `selectIdolPicture`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectIdolPicture`(IN pIdolId BIGINT(64))
BEGIN
	SELECT picture FROM idolpictures WHERE idolId = pIdolId;
END$$

DROP PROCEDURE IF EXISTS `selectLoginInformationByEmail`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectLoginInformationByEmail`(IN pEmail varchar(128))
BEGIN
SELECT userPassword, username FROM users WHERE email = pEmail;
END$$

DROP PROCEDURE IF EXISTS `selectPaymentHistory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectPaymentHistory`(IN pPurchaser VARCHAR(64), IN pSeller VARCHAR(64))
BEGIN
		SELECT itemName, itemType, seller, purchaser, price FROM paymentHistory WHERE purchaser=pPurchaser OR seller=pSeller;
    END$$

DROP PROCEDURE IF EXISTS `selectPaymentInformation`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectPaymentInformation`(IN pUserId bigint(64))
BEGIN
		SELECT firstName, middlInitial, lastName, cardNumber, cardExpirationDate, cardSecurityCode
        FROM paymentInformation 
        WHERE userId=pUserId;
    END$$

DROP PROCEDURE IF EXISTS `selects`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selects`()
BEGIN
SELECT * FROM users;
END$$

DROP PROCEDURE IF EXISTS `selectUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectUser`(IN pUserId bigint(64))
BEGIN
		SELECT username, password, verified, amountOwed, totalEarned, creationTime, active
        FROM paymentInformation 
        WHERE userId=pUserId;
    END$$

DROP PROCEDURE IF EXISTS `upload`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `upload`(IN tableName varchar(255), entry1 varchar(255), entry2 varchar(255), entry3 varchar(255), entry4  varchar(255), entry5 varchar(255), entry6 varchar(255), entry7 varchar(255), entry8 varchar(255), entry9 varchar(255), entry10 varchar(255))
BEGIN
END$$

DROP PROCEDURE IF EXISTS `uploadIdolPicture`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `uploadIdolPicture`(idolId bigint, user varchar(32), picture blob)
BEGIN
INSERT INTO idolPictures (idolId, user, picture) VALUES (idolId, 'user', picture);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `AddressId` int(64) NOT NULL AUTO_INCREMENT,
  `streetName` varchar(64) COLLATE utf8_bin NOT NULL,
  `city` varchar(64) COLLATE utf8_bin NOT NULL,
  `state` text COLLATE utf8_bin NOT NULL,
  `country` text COLLATE utf8_bin NOT NULL,
  `zipcode` int(10) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `userAddressNumber` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `contestentries`
--

DROP TABLE IF EXISTS `contestentries`;
CREATE TABLE IF NOT EXISTS `contestentries` (
  `entryId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contestName` varchar(32) COLLATE utf8_bin NOT NULL,
  `user` varchar(32) COLLATE utf8_bin NOT NULL,
  `idol` varchar(32) COLLATE utf8_bin NOT NULL,
  `winner` tinyint(1) DEFAULT NULL,
  `entry` longblob NOT NULL,
  `entryTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `contestId` bigint(64) DEFAULT NULL,
  `idolId` int(64) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `id` (`entryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
CREATE TABLE IF NOT EXISTS `contests` (
  `contestId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idolName` varchar(32) COLLATE utf8_bin NOT NULL,
  `contestName` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `rewardFanpoints` decimal(16,2) NOT NULL,
  `rewardCash` decimal(16,2) NOT NULL,
  `rewardOther` varchar(32) COLLATE utf8_bin NOT NULL,
  `contestType` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creationTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `contestEnds` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `contestPrice` decimal(10,0) DEFAULT NULL,
  `contestWinner` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `contestDescription` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `idolId` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`contestId`),
  UNIQUE KEY `id` (`contestId`),
  UNIQUE KEY `id_2` (`contestId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Table structure for table `fans`
--

DROP TABLE IF EXISTS `fans`;
CREATE TABLE IF NOT EXISTS `fans` (
  `fanId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(32) COLLATE utf8_bin NOT NULL,
  `idol` varchar(32) COLLATE utf8_bin NOT NULL,
  `fanpoints` int(32) NOT NULL,
  `contestEntries` int(32) NOT NULL,
  `contestWins` int(32) NOT NULL,
  `firstDegreeReferrals` int(32) NOT NULL,
  `secondDegreeReferrals` int(32) NOT NULL,
  `thirdDegreeReferrals` int(32) NOT NULL,
  `321Deal` tinyint(1) NOT NULL,
  `referee` varchar(32) COLLATE utf8_bin NOT NULL,
  `position` int(32) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `idolId` bigint(64) DEFAULT NULL,
  UNIQUE KEY `id` (`fanId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `idolpictures`
--

DROP TABLE IF EXISTS `idolpictures`;
CREATE TABLE IF NOT EXISTS `idolpictures` (
  `idolPictureId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idolId` bigint(64) NOT NULL,
  `user` varchar(32) COLLATE utf8_bin NOT NULL,
  `picture` blob NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profilePicture` int(1) DEFAULT NULL,
  UNIQUE KEY `idolPictureId` (`idolPictureId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `idols`
--

DROP TABLE IF EXISTS `idols`;
CREATE TABLE IF NOT EXISTS `idols` (
  `idolId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(32) COLLATE utf8_bin NOT NULL,
  `idolName` varchar(32) COLLATE utf8_bin NOT NULL,
  `creationTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `idolUrl` varchar(32) COLLATE utf8_bin NOT NULL,
  `priceToBecomeFan` decimal(16,2) NOT NULL,
  `321DealActive` tinyint(1) NOT NULL,
  `priceFor321Deal` decimal(16,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `totalFans` int(64) DEFAULT NULL,
  PRIMARY KEY (`idolId`),
  UNIQUE KEY `idolUrl` (`idolUrl`),
  UNIQUE KEY `id` (`idolId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `paymenthistory`
--

DROP TABLE IF EXISTS `paymenthistory`;
CREATE TABLE IF NOT EXISTS `paymenthistory` (
  `paymentHistoryId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(32) COLLATE utf8_bin NOT NULL,
  `itemType` varchar(32) COLLATE utf8_bin NOT NULL,
  `seller` varchar(32) COLLATE utf8_bin NOT NULL,
  `purchaser` varchar(32) COLLATE utf8_bin NOT NULL,
  `price` decimal(32,2) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  UNIQUE KEY `id` (`paymentHistoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paymentinformation`
--

DROP TABLE IF EXISTS `paymentinformation`;
CREATE TABLE IF NOT EXISTS `paymentinformation` (
  `paymentInformationId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` text COLLATE utf8_bin NOT NULL,
  `middleInitial` text COLLATE utf8_bin NOT NULL,
  `lastName` text COLLATE utf8_bin NOT NULL,
  `cardNumber` int(16) NOT NULL,
  `cardExpirationDate` date NOT NULL,
  `cardSecurityCode` int(3) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `userId` bigint(64) DEFAULT NULL,
  UNIQUE KEY `id` (`paymentInformationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) COLLATE utf8_bin NOT NULL,
  `userPassword` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `verified` tinyint(1) NOT NULL,
  `amountOwed` decimal(30,2) NOT NULL,
  `totalEarned` decimal(30,2) NOT NULL,
  `creationTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `active` tinyint(1) NOT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id` (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
