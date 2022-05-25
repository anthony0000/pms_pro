-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 25, 2022 at 04:20 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

DROP TABLE IF EXISTS `admin_credentials`;
CREATE TABLE IF NOT EXISTS `admin_credentials` (
  `USERNAME` varchar(50) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `IS_LOGGED_IN` varchar(30) COLLATE utf16_bin NOT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `PHARMACY_NAME` varchar(100) COLLATE utf16_bin DEFAULT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf16_bin DEFAULT NULL,
  `CONTACT_NUMBER` varchar(13) COLLATE utf16_bin DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `IS_LOGGED_IN`, `PASSWORD`, `PHARMACY_NAME`, `ADDRESS`, `EMAIL`, `CONTACT_NUMBER`) VALUES
('admin', 'true', 'admin123', 'Dilimi Pharmacy', 'Jos, Plateau State', 'dilimi@gmail.com', '0219293832');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `DOCTOR_NAME` varchar(20) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `DOCTOR_ADDRESS` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `CONTACT_NUMBER`, `ADDRESS`, `DOCTOR_NAME`, `DOCTOR_ADDRESS`) VALUES
(15, 'James Gordon', '1234567890', 'No 3 Beach Road', 'Cartel Spooke', 'No 8 Isheru, Diamond Estate Lagos'),
(16, 'Fear Street', '0902051442', 'Abuja, Nigeria', 'Anthony Phillips', 'Jos, Plateau State');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `INVOICE_ID` int NOT NULL AUTO_INCREMENT,
  `NET_TOTAL` double NOT NULL DEFAULT '0',
  `INVOICE_DATE` date NOT NULL,
  `CUSTOMER_ID` int NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `TOTAL_DISCOUNT` double NOT NULL,
  PRIMARY KEY (`INVOICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`INVOICE_ID`, `NET_TOTAL`, `INVOICE_DATE`, `CUSTOMER_ID`, `TOTAL_AMOUNT`, `TOTAL_DISCOUNT`) VALUES
(6, 47250, '2022-05-13', 15, 50000, 2750);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
CREATE TABLE IF NOT EXISTS `medicines` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `PACKING` varchar(20) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `GENERIC_NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `SUPPLIER_NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`ID`, `NAME`, `PACKING`, `GENERIC_NAME`, `SUPPLIER_NAME`) VALUES
(9, 'Paracetamols', '250', 'PCT', 'Jane Vision'),
(10, 'Binace', '150', 'BI', 'Jane Vision'),
(11, 'Paracetamols', '15', 'PR', 'Jane Vision'),
(12, 'Paracetamol', '150', 'PCT', 'Scammer James'),
(13, 'Paracetamol', '12', 'PCT', 'Phillips Caleb'),
(14, 'Paracetamol', '15', 'PCT', 'Scammer James');

-- --------------------------------------------------------

--
-- Table structure for table `medicines_stock`
--

DROP TABLE IF EXISTS `medicines_stock`;
CREATE TABLE IF NOT EXISTS `medicines_stock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `BATCH_ID` varchar(20) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `EXPIRY_DATE` varchar(10) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `QUANTITY` int NOT NULL,
  `MRP` double NOT NULL,
  `RATE` double NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `BATCH_ID` (`BATCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines_stock`
--

INSERT INTO `medicines_stock` (`ID`, `NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`, `CREATED_AT`) VALUES
(8, 'Paracetamols', '15', '05/2022', 130, 5000, 1250, '2022-05-13 08:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `CUSTOMER_ID` int NOT NULL,
  `SUPPLIER_NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `INVOICE_NUMBER` int NOT NULL,
  `VOUCHER_NUMBER` int NOT NULL AUTO_INCREMENT,
  `PURCHASE_DATE` varchar(10) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `PAYMENT_STATUS` varchar(20) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`VOUCHER_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`CUSTOMER_ID`, `SUPPLIER_NAME`, `INVOICE_NUMBER`, `VOUCHER_NUMBER`, `PURCHASE_DATE`, `TOTAL_AMOUNT`, `PAYMENT_STATUS`) VALUES
(15, 'Scammer James', 6, 2, '2022-05-13', 15000, 'DUE');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(30, 'Jane Vision', 'jane@gmail.com', '1829930229', 'Lagos, Nigeria'),
(31, 'Moses Akpudo', 'phillipsanthony2001@gmail.com', '0921930234', 'James Jacob'),
(32, 'Kennedy Emmanuel', 'kennedyemma@gmail.com', '0128932928', 'James Sequel'),
(33, 'Phillips Caleb', 'caleb@gmail.com', '8129320435', 'No 3 Beach Road2'),
(34, 'New Supplys', 'everday@gmail.com', '0128293204', 'No 3 Beach Road2'),
(35, 'Scammer James', 'james@gmail.com', '2819302494', 'Saiudsahdiuhi Oasuhdoisa Ud');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
