-- Active: 1682105095359@@127.0.0.1@3306

CREATE DATABASE
    IF NOT EXISTS `rescue_transport`
    /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */
    /*!80016 DEFAULT ENCRYPTION='N' */
;

USE `rescue_transport`;

-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)

--

-- Host: localhost \   Database: rescue_transport

-- ------------------------------------------------------

-- Server version	8.0.33-cluster

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!50503 SET NAMES utf8 */;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;

/*!40103 SET TIME_ZONE='+00:00' */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--

-- Table structure for table `knex_migrations`

--

DROP TABLE IF EXISTS `knex_migrations`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `knex_migrations` (
        `id` int unsigned NOT NULL AUTO_INCREMENT,
        `name` varchar(255) DEFAULT NULL,
        `batch` int DEFAULT NULL,
        `migration_time` timestamp NULL DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `knex_migrations`

--

LOCK TABLES `knex_migrations` WRITE;

/*!40000 ALTER TABLE `knex_migrations` DISABLE KEYS */

;

INSERT INTO `knex_migrations`
VALUES (
        1,
        '20230512011357_create_request_tables.js',
        1,
        '2023-05-12 01:16:27'
    );

/*!40000 ALTER TABLE `knex_migrations` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `knex_migrations_lock`

--

DROP TABLE IF EXISTS `knex_migrations_lock`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `knex_migrations_lock` (
        `index` int unsigned NOT NULL AUTO_INCREMENT,
        `is_locked` int DEFAULT NULL,
        PRIMARY KEY (`index`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `knex_migrations_lock`

--

LOCK TABLES `knex_migrations_lock` WRITE;

/*!40000 ALTER TABLE `knex_migrations_lock` DISABLE KEYS */

;

INSERT INTO `knex_migrations_lock` VALUES (1,0);

/*!40000 ALTER TABLE `knex_migrations_lock` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `requests`

--

DROP TABLE IF EXISTS `requests`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `requests` (
        `id` char(36) NOT NULL,
        `animal_image` varchar(2500) DEFAULT NULL,
        `animal` varchar(255) NOT NULL,
        `organization` varchar(255) DEFAULT NULL,
        `origin` varchar(255) NOT NULL,
        `destination` varchar(255) NOT NULL,
        `date` date NOT NULL,
        `time` varchar(255) NOT NULL,
        `description` varchar(7500) NOT NULL,
        `medical` varchar(255) NOT NULL,
        `user_id` char(36) DEFAULT NULL,
        `driver_id` char(36) DEFAULT NULL,
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        `phone` varchar(500) DEFAULT NULL,
        `origin_id` varchar(500) DEFAULT NULL COMMENT '	',
        `email` varchar(500) DEFAULT NULL COMMENT '	',
        `destination_id` varchar(500) DEFAULT NULL,
        `origin_location` varchar(500) DEFAULT NULL,
        `destination_location` varchar(500) DEFAULT NULL,
        `destination_comp` varchar(500) DEFAULT NULL,
        `origin_comp` varchar(45) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `requests_user_id_foreign` (`user_id`),
        KEY `requests_driver_id_foreign` (`driver_id`),
        CONSTRAINT `requests_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `requests`

--

LOCK TABLES `requests` WRITE;

/*!40000 ALTER TABLE `requests` DISABLE KEYS */

;

INSERT INTO `requests`
VALUES (
        '002928f2-00ae-4590-b7fe-48ba5dfe2baf',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJcSURBVDjLjZPfS5NRHMYHQn9AIeRd0za9KEMi7U4oiIZRVFSUVJvbHEyo1GXrB8XsYpDWwjKardKZ3WjKa+p0iTo1jVgs1kusWKQ3XYwhw/3+xdP7fWXvfHEXHng4nIvn+X7OczgSABKPx3N8vkODGaMCTlUFJBJJ9Ta1h8yVbrc78nV5Ed+WXZi8Wo5MJrMt8SFGo3EHwzDKKbMOn3t0mLxSjng8LlI0GkUkEhG0vr6OdDq9ESAmmIOjXr4lIBeSUzgcRiqVEhM4HuqwaG2E46IciUSC152BVRj7V3GLU5t9BW29KzBwIgohQCBY2iAYPy9HMpnkReb+uQDsnPpmA+idCaD5zV8+gKhEBOPtjVh4ocXYORmfTto8tZUzttj8uP7Kz3cQi8WyBQlGz8j4giggdxUSTaS7kzkUCmFtbS3CBRzMEzzQYv65BqOn9wrm1rcraH79B9d6/Giy/ob+5S/on7EIBAIIBoMFOliaA3OyjA+gDnKTOVxMfBnCTasSjU9OQfVIAcv7dhQVFR0WCD7e08DVpcZIXZlQIonMH1x2mAZVGGO78f2fE5ZPelyw7MeB+uJ3IgI3RzCsKBVKJAJqvIGbyPx4CuZnF2h1TmthmdahRl+SzBPcVmPWosLwsXwATafiTtytwgRrw+Y16u1GTVMJthAMHZUim83yL5EjqL1Rig5nA8xOJW82TynFBAaDQTpQtw8jlw9h8IgUfr8fPp8PLMvC6/XCZGvB2c4KPHZq+Mm005nvgL4zSSnbWXu/ardJLd+lKfR1Ky8V91XrS6KETTud6Tv/BxVpxDzfgUo/AAAAAElFTkSuQmCC',
        'Bee-eater, carmine',
        'Rescue Paws',
        '123 North French Avenue, Sanford, FL, USA',
        '258 Tenafly Road, Tenafly, NJ, USA',
        '2023-06-08',
        'morning',
        'Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.',
        'yes',
        '1a0aff12-89a8-422a-9f8c-725f5726d6ef',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '2023-05-13 17:27:34',
        '(856) 1566443',
        'EigxMjMgTiBGcmVuY2ggQXZlLCBTYW5mb3JkLCBGTCAzMjc3MSwgVVNBIjASLgoUChIJHUPbkZ8T54gRTuYq1qowfiwQeyoUChIJacYY26ET54gR3BtRHTYx5FQ',
        'rpudenb@statcounter.com',
        'ChIJ0dTl27rxwokRsjQ006FAJzE',
        '{\"lat\":28.81187929999999,\"lng\":-81.2731786}',
        '{\"lat\":40.9216495,\"lng\":-73.96873029999999}',
        NULL,
        NULL
    ), (
        '11acaf5f-3892-47d3-876b-8032d9fd16e5',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHySURBVDjLpVNBaxpBGH2z7rrb6poNG0lSi0VyiA1I6a2XUtBLyD/oyV/gvSD03Gv/Q7El5NZDhBDx1lPpQUyRbg9SoUYTsEs21XVdM9/QWdZePGTgY2beft/33pudYcvlEvcZCu45VLno9Xrni8WizANBEGA+n0fh+34Us9mM5la1Wq1QHSMLvPhVMplsZ7NZkfT/iNvUNA3tdhv9fr9Sq9VaQgFnfGtZFobDIXRdj4rihbQeDAbIZDIoFApEWudwi3U6HcFu2zZc112RS1aokDGGRCIh2E3TRCqVQrPZhOM4FZXYSTp5pSTDMERI9rgSmsMwxHQ6RalUQrfbravE5HkexuOxOCCZRIdJs9xLjPaqqiKdTguV1KBM3WlDCdySkKwoyooC2Sifz4u8XC5HNWWFWMkrBX2QITGJP//2CdbVT1gTB896H6JfrFIDWUQMxWIxkkysEn/y6wJP/3yFzTYxe5TGFceiBvQHpL+4XHl45uf3SO15sPU9oMxg9D0cOCdCHWs0Gqfcy2HslkUzxaF9jH3NwcbONnR3Eziii8Mb/7jF98nDS7buMf1+wRraG7w2sQP92gJecnCDx5jf2Hc3H9c/Jh+j5Rnwd3fELYXA5T/8SwC4GK1X8Jg94E9uAhNJxVeC7ewWYHDkhrcOYd0B0mCFUhT4PX8AAAAASUVORK5CYII=',
        'Armadillo, common long-nosed',
        'Rescue Paws',
        '123 North French Avenue, Sanford, FL, USA',
        '8965 Frank Street, Dallas, Texas, USA',
        '2023-08-03',
        'afternoon',
        'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc.',
        'no',
        '1a0aff12-89a8-422a-9f8c-725f5726d6ef',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '2023-05-13 17:27:34',
        '(658) 2719990',
        'EigxMjMgTiBGcmVuY2ggQXZlLCBTYW5mb3JkLCBGTCAzMjc3MSwgVVNBIjASLgoUChIJHUPbkZ8T54gRTuYq1qowfiwQeyoUChIJacYY26ET54gR3BtRHTYx5FQ',
        'zharteganf@guardian.co.uk',
        'EiQ4OTY1IEZyYW5rIFN0LCBEYWxsYXMsIFRYIDc1MjEwLCBVU0EiMRIvChQKEgk99YA_caJOhhGHrbHoGteMdxCFRioUChIJA7W7IXiiToYRcrw0RMFpP-I',
        '{\"lat\":28.81187929999999,\"lng\":-81.2731786}',
        '{\"lat\":32.7780881,\"lng\":-96.74277239999999}',
        NULL,
        NULL
    ), (
        '197484f9-d6bc-4d4d-b202-54b6bcd1baa6',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJpSURBVDjLpZNNSJRhEMd/z7vr9m7t2oopZl/UoVWpQ0RC0EFL6FAQ4a0OXbrVLaJDEdStjhEUFQVBHaIuSocIomtWJvYFRhb51eqaH7vu7vu8zzvTQbENvDkwDAzMj+E//zGqymrCY5URBxh6vm/Ar21rM6aapwSF7yORm90PBP9NGQAWskc/ujiAUa9ly4EHNcYY0MVhjMFV8jtyA1dGdKkLEEvUqkbhZHHi1XngSRwApxXErgl+3yKyMfBqMSaN33yI5vZrCVQBARVAMV6q6VvPgcv/AKHxVCyRTaCiSPkX4UKO4uRravyNoCGIRdUBjnTLhQQq25Y1wKgvrowtgdoFwsI86ZZT+PWtgKGU72du5CWNbWeJJVKYeAYiL/4PEHrEk41kWk8vraoogtgxwj8vmP7+gVTzEfKDl0jXCf7mixAoVQBVjSpIaRCN5tCogLpZJJxh/vcwaxu7qN24h+Evj0nEF/A1gLDaBwGq4pBwCrFTiM0hNoctjjE7kSO9IUM030PDrtPMTIRIFCwfdhFgVQ0R6v6gbhoN86ibZnZ0jPrsCaj00/fwEalMmULeY378E7gqgFqZcaXpubCYEFdK44IGivkk4u0kXVdCgh+gQlR8y/aOc4y960Ws2GUNtBJcH759vB2lC0MaYwjq6hJbO896UnqDSpm93VnEjuOvGyKz7SBTE/e/Lh5whWfqv9NxZkPrsZtNO5NExT5ULe+ffWVvdysmth6Sh3l379KkinSuCOi7sX9098lHm2LeT9TNUOVkwCOWzJL7PMBQ79Wn8ZU+zAXW77/bXVZRVKQqdbkigqo2/QXSf1oX6zFeUgAAAABJRU5ErkJggg==',
        'Eagle, white-bellied sea',
        'Furever Friends Rescue',
        '123 North French Avenue, Sanford, FL, USA',
        '7654 Front Street, Colton, Washington, USA',
        '2023-08-07',
        'afternoon',
        'Etiam pretium iaculis justo.',
        'yes',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '1a0aff12-89a8-422a-9f8c-725f5726d6ef',
        '2023-05-13 17:27:34',
        '(927) 9734650',
        'EigxMjMgTiBGcmVuY2ggQXZlLCBTYW5mb3JkLCBGTCAzMjc3MSwgVVNBIjASLgoUChIJHUPbkZ8T54gRTuYq1qowfiwQeyoUChIJacYY26ET54gR3BtRHTYx5FQ',
        'lskeete8@narod.ru',
        'EiQ3NjU0IEZyb250IFN0LCBDb2x0b24sIFdBIDk5MTEzLCBVU0EiMRIvChQKEgkhkFpcCyygVBEBw9gMXWD__RDmOyoUChIJIZBaXAssoFQRLndO4A-NiU0',
        '{\"lat\":28.81187929999999,\"lng\":-81.2731786}',
        '{\"lat\":46.6182931,\"lng\":-117.1230802}',
        NULL,
        NULL
    ), (
        '1d22beb3-bb4f-46a0-8242-2561e102d652',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAITSURBVBgZpcHLThNhGIDh9/vn7/RApwc5VCmFWBPi1mvwAlx7BW69Afeu3bozcSE7E02ILjCRhRrds8AEbKVS2gIdSjvTmf+TYqLu+zyiqszDMCf75PnnnVwhuNcLpwsXk8Q4BYeSOsWpkqrinJI6JXVK6lSRdDq9PO+19vb37XK13Hj0YLMUTVVyWY//Cf8IVwQEGEeJN47S1YdPo4npDpNmnDh5udOh1YsZRcph39EaONpnjs65oxsqvZEyTaHdj3n2psPpKDLBcuOOGUWpZDOG+q0S7751ObuYUisJGQ98T/Ct4Fuo5IX+MGZr95jKjRKLlSxXxFxOEmaaN4us1Upsf+1yGk5ZKhp8C74H5ZwwCGO2drssLZZo1ouIcs2MJikz1oPmapHlaoFXH1oMwphyTghyQj+MefG+RblcoLlaJG/5y4zGCTMikEwTctaxXq/w9kuXdm9Cuzfh9acujXqFwE8xmuBb/hCwl1GKAnGccDwIadQCfD9DZ5Dj494QA2w2qtQW84wmMZ1eyFI1QBVQwV5GiaZOpdsPaSwH5HMZULi9UmB9pYAAouBQbMHHrgQcnQwZV/KgTu1o8PMgipONu2t5KeaNiEkxgAiICDMCCFeEK5aNauAOfoXx8KR9ZOOLk8P7j7er2WBhwWY9sdbDeIJnwBjBWBBAhGsCmiZxPD4/7Z98b/0QVWUehjkZ5vQb/Un5e/DIsVsAAAAASUVORK5CYII=',
        'Boa, malagasy ground',
        'Furever Friends Rescue',
        '123 North French Avenue, Sanford, FL, USA',
        '456 West North Street, Humboldt, South Dakota, USA',
        '2023-05-23',
        'flexible',
        'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius.',
        'yes',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '2023-05-13 17:27:34',
        '(112) 7597359',
        'EigxMjMgTiBGcmVuY2ggQXZlLCBTYW5mb3JkLCBGTCAzMjc3MSwgVVNBIjASLgoUChIJHUPbkZ8T54gRTuYq1qowfiwQeyoUChIJacYY26ET54gR3BtRHTYx5FQ',
        'mgeorgescu0@chron.com',
        'Eic0NTYgVyBOb3J0aCBTdCwgSHVtYm9sZHQsIFNEIDU3MDM1LCBVU0EiMRIvChQKEgmbPvAUHSqJhxEtTKhxma4o3BDIAyoUChIJrwioDR0qiYcRDRJ58qVvu6Y',
        '{\"lat\":28.81187929999999,\"lng\":-81.2731786}',
        '{\"lat\":43.6470435,\"lng\":-97.0772458}',
        NULL,
        NULL
    ), (
        '2b2a7bba-ea4d-4917-95bf-4ddcb4e97d91',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADZSURBVBgZBcFBbo1hGAbQ83+5kRCJhA2IEQMrYAPMxRZMbcLG2ICRGTeUtE1jpr1p3/95nLMV8PnL3eOT07Pr79f+/f34GuAAcPfqgXseunlx6ysADsfC0+3k1n03ODP41oiX2+IReO7KH7sfLr1HPBEsCOKNc0cXPghGDFZUUPHWb+/UIKpYUUXU+LRFBbsYLCqICkbsiArWroKIQVQQFayIYFRQFYwKVtQgqhgxiNixooJdDKIgCtaIHVFB1KAqWFFBVDCiiAoOuzMwfgnqpyCOYCsAAADgP4mZnXDW2crZAAAAAElFTkSuQmCC',
        'Western bearded dragon',
        'Furever Friends Rescue',
        '123 North French Avenue, Sanford, FL, USA',
        '23 West 34th Street, New York, NY, USA',
        '2023-08-03',
        'evening',
        'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
        'no',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '2023-05-13 17:27:34',
        '(790) 2211045',
        'EigxMjMgTiBGcmVuY2ggQXZlLCBTYW5mb3JkLCBGTCAzMjc3MSwgVVNBIjASLgoUChIJHUPbkZ8T54gRTuYq1qowfiwQeyoUChIJacYY26ET54gR3BtRHTYx5FQ',
        'gtotterdill7@biglobe.ne.jp',
        'ChIJF_LSCqlZwokRcpaald0xAR0',
        '{\"lat\":28.81187929999999,\"lng\":-81.2731786}',
        '{\"lat\":40.749385,\"lng\":-73.98609979999999}',
        NULL,
        NULL
    ), (
        '30a1e4ec-a05f-4d38-abd7-f2395607bb60',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMPSURBVDjLpZPba5tlAMZ/75cvadOmzdI2jTNp03TDJM457fAwmYeLyUBU2EBRmBfzwgvFK/0DBBF2oxc68MKK4EAKiqBUGV60qY4yWbVh2cza0nXFmqQ5NS1pvuP7fl50ThG88vkDngM/HuF5Hv9H+un3vtuXGArN9fcEEngCPIX0PKTjYFkOjuNgmxaWZeEaFtI0sA2TVm2rtF68eUJPDvcVjh0aSaRiAwCo242k8lDK2zOTCqk8pJRI5eFIya/53wZy1k5Rjw/2JqI9PpbXK7hS8kvhFo8ezXBlcZkH7hvFdRSL126RzY5x6VKBkbFhpFTckwgTvWt/RBdiL9XvEzTbio4r6Eg/zY7DzOUVpFQoT8MmiCUCNOo7JBMRXKUQQiDeuTDvaa6BpjyE5uPYRJotO4BU6vYMcKXCVYqknCVRmcYXOsxufY4vF+PoP19ffyUT9c4Nhnt90Wgi5gsERWmlSKnSwHYlriuRUpHuX+RQWhI8fIZw6kFaa2lO1ie3xV8Y3/hg+otH7k+9nBlPEg71kB7W7qDqlL/HaF6hLzxBc3WJ8OABAn3DFGc/N3WAF979ZjQbD5+KRQexJYS6/uZs1n/Eal4mMn4SqzxFoEewnr+BY9oN02g/pj311pQwmq2vMqlYN0IHodHfLfaSN3MYlYuEDzyDWfoE4d/CH+rD61T48Ifg1ENvfr2s5d5/yctkU0cj+yKUWw5SKYJ+QaX4LTu/XyR88HnMPz5G8zvYO2OU5vLMhl5nxUgdB9ABTFtp5XqL1fIupjVEfmaSE2Mlsk8+h12ZxBfwMLeTlOYW+Mw8i7QFmrajA2gAruPgSIXtumwuXODpZA1JnHLhIxQmu804a7mrnN86w8ZuD7om0AOBg/9oYGMYNiNDXeyv57j3+KcsTb3N8k/zdI0eYbdRphB9jaG7h4koRadt4No2dwzW8tdudKq1jL+7l0ytin19mtSRx9muNVhdWGIm8CrV1Rp4myilMNttqhsb5wHEv+/84hMDxsR4TH84m8LzW/NGtXb22XNXb/7Xnf8EvI+SIusIR2cAAAAASUVORK5CYII=',
        'Pigeon, wood',
        'Rescue Rescue Rideshare',
        '4005 Conaway Street, Daphne, AL, USA',
        '4567 North Kanawha Street, Beckley, WV, USA',
        '2023-07-21',
        'afternoon',
        'Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum.',
        'no',
        '32c64173-c0cd-42f4-bb79-7ebe637f1b87',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '2023-05-13 17:27:34',
        '(465) 3937347',
        'EiFDb25hd2F5IFN0LCBEYXBobmUsIEFMIDM2NTI2LCBVU0EiLiosChQKEgllYtlbh0GaiBESf2VCWTqL-xIUChIJj8sPAk9CmogRJOPOh3ZIaGM',
        'esouthoused@bbb.org',
        'EiROIEthbmF3aGEgU3QsIEJlY2tsZXksIFdWIDI1ODAxLCBVU0EiLiosChQKEgktx2EQ5_JOiBGJAjF5DscgCBIUChIJ6eCObMLyTogRqwYkmUyKI8Y',
        '{\"lat\":30.60201,\"lng\":-87.8883638}',
        '{\"lat\":37.7831472,\"lng\":-81.1874052}',
        NULL,
        NULL
    ), (
        '3b5243dc-f667-425b-9298-60937dc2fac1',
        'N/A',
        'Large Penguin',
        'Hopeful Hearts Animal Rescue',
        '456 E Street West, Vale, Oregon, USA',
        '567 West Main Street, Dothan, Alabama, USA',
        '2023-06-03',
        'afternoon',
        'must have A/C.',
        '',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '2023-06-07 21:36:42',
        '(493) 9110320',
        'Eh80NTYgRSBTdCBXLCBWYWxlLCBPUiA5NzkxOCwgVVNBIjESLwoUChIJAwtkcWLxr1QR95TaWI5Ulg8QyAMqFAoSCU-QTHFi8a9UEWZSfoX6ivqU',
        'mgussin2@dell.com',
        'ChIJZa0NE_-SkogRYWOGHE3msGo',
        '{\"lat\":43.9790181,\"lng\":-117.2436773}',
        '{\"lat\":31.2248912,\"lng\":-85.3997245}',
        NULL,
        NULL
    ), (
        '42648f9f-5fa4-4f3f-a3b1-4ab462f6e570',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAINSURBVDjLpZPNS1VhEIefc7wXTNQopKTM4IKRaB+GliQtKgpau3NjRcsIzEW1EQIR2kRUUP9AtHFhi4rAqKBCUDOEkDIQPzIIWpjX7jnvO+9Mi3uvUBAIDgzMDDMP/JiZyMzYjMVs0jYNyDDc9h8NCl5BPIiCdyChWAuAM0ghA0BTzz+z+rcHhRCKsQ+lWODN4xIAYHUZVLFQahDBgoAXTHwx9x4TAfFkd+yHgpUBBmbQfoMoW4N9fIiFQHzoEkiB8LyP+Nwdomwl8uoWtjgF3pcAIkVtppCtxcZuEnUOEIUUnXgAQYmPXqb/WQ/5NM/dg/3E85PrgBjviwA1iDNQvRdUsJUl4uPXidsuorMvSILQUNfM+fFBnAqIQGpkKCRFfapEQNTai319St/UfUwdzgJOhF3bmmiuP8Zqskb30hgjfjdbUiNDWqKpgnp08h5xx1Vk8jZnWnoJpgQNKMbyyiIHGrrIuwInF0YY1SoyFAxSDyg6egVECE8ukIgjmDL/cxavgqjHB8+vdJXDe06Q97/pOPK2BPCeKFQSlVcYAokkSBB21jYiGgimfF9ZYHt1PR8W3zEzN87w9FYiu1ZveFu/LIKBg+6uahLncOpIxJGra6Ezd5aJhfdMfxrl0UwN+5IKoo1+Y+tgvNbeeKrq9ZeX35xyennIPgMbB+QGorWgFVUFDbkfQzZXrv8BKB9RM6Fzq8AAAAAASUVORK5CYII=',
        'Seal, common',
        'Rescue Rescue Rideshare',
        '4005 Conaway Street, Daphne, AL, USA',
        '4567 South Colorado Boulevard, Cherry Hills Village, CO, USA',
        '2023-07-01',
        'evening',
        'quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices',
        'yes',
        '32c64173-c0cd-42f4-bb79-7ebe637f1b87',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '2023-05-13 17:27:34',
        '(415) 3153687',
        'EiFDb25hd2F5IFN0LCBEYXBobmUsIEFMIDM2NTI2LCBVU0EiLiosChQKEgllYtlbh0GaiBESf2VCWTqL-xIUChIJj8sPAk9CmogRJOPOh3ZIaGM',
        'kphlippi5@msu.edu',
        'Ejk0NTY3IFMgQ29sb3JhZG8gQmx2ZCwgQ2hlcnJ5IEhpbGxzIFZpbGxhZ2UsIENPIDgwMTEzLCBVU0EiMRIvChQKEgkDt6ply4BshxGQJqAXS7C7vhDXIyoUChIJEajjYwp-bIcREe8nA1rQcLI',
        '{\"lat\":30.60201,\"lng\":-87.8883638}',
        '{\"lat\":39.6385796,\"lng\":-104.9408913}',
        NULL,
        NULL
    ), (
        '4c16ce9d-0c04-4f9f-8e06-db10f8faf5f6',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJvSURBVDjLjdM/TFNRFMfx733vtdBa0QiUqFEHI3FRw4TooDGGuOpCHPy3sOji4OCgicTRERMHSWcGB/wDhmhwMEZDIkj8g0YFqmCtYJFi7Xv3z3GoUjAO3O0m59587j2/o0SE0dHRI8UH1wfM3DTm6wTtmfFWVrfyamRkZLe19onT5TU+lm83Ojnc82pVp4MgaA16e3vH29raztW+7s+k6gEBrfWKQuccIrJin0gkAPhHYMh3d3Lw5gsGn31kcrpIfkETBD6httQEfvVW5XBzr7uWBPGx/szatIADpRSTX4ocb99OMpn6L38x1NzsU5eDjo6Ondbabtd4Al8Zfjx8hFKKwqIjmUwxPrPA46kLrKubpRRpsvl69m26yt6dm1H4LAmCF/cydQ2CiKCUItIWAxjnSKXyJGIbcIS4+BRfCyWcOCJjWCY4ia8MhQcVQTzmIwLFUkShXMbKTxZ1yPdSmQIhSKWmKnh+N7O2UUBk6cdFoFh2TM3swNW8ZFGXmC9so7mpptrKquAUPobC4BAAobY4B/O/LHuaLtIydZ5X77LMH7iG0QYBIu2qAm/4TqYuLThLRSCCQhj7fBatNcNRRLQxRvSyA601x/cPI7JCcBoPw9zAEEop1qdiiI24cqyPPw9iWZbQWlMb85YJnt7OpNIObKWgecs6bg194MtsiSAeEEWWeNwHqQbJzL7tqiYxKq/xMExeOsPRwfc457DWYowhDENyuRwNDQ2k0+lqGJWqzIIxZlfLm/sfkxsSiMDExATGGIwxS3PgeR65XI5sNovneURRVLnkb8vONNcf2JqKH5r+qT/1vJsbW+04/wbW84QVgHdG+gAAAABJRU5ErkJggg==',
        'Galapagos hawk',
        'Rescue Rescue Rideshare',
        '4005 Conaway Street, Daphne, AL, USA',
        '3215 Tennyson Street Northwest, Washington, DC, USA',
        '2023-08-09',
        'evening',
        'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',
        'no',
        '32c64173-c0cd-42f4-bb79-7ebe637f1b87',
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        '2023-05-13 17:27:34',
        '(592) 5633379',
        'EiFDb25hd2F5IFN0LCBEYXBobmUsIEFMIDM2NTI2LCBVU0EiLiosChQKEgllYtlbh0GaiBESf2VCWTqL-xIUChIJj8sPAk9CmogRJOPOh3ZIaGM',
        'egarvanj@gmpg.org',
        'ChIJLYxspQfJt4kR0ElAyLDjUHM',
        '{\"lat\":30.60201,\"lng\":-87.8883638}',
        '{\"lat\":38.9730731,\"lng\":-77.06567679999999}',
        NULL,
        NULL
    ), (
        '4d065162-7c43-4ccb-8b7e-f2c097dfdaf1',
        'n/a',
        'Large Penguin',
        'Hopeful Hearts Animal Rescue',
        '876 Southeast M Street, Grants Pass, Oregon, USA',
        '568 Reed Road, Cordova, Alabama, USA',
        '2023-06-03',
        'afternoon',
        'must have A/C.',
        '',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '2023-06-07 21:35:06',
        '(493) 9110320',
        'Eic4NzYgU0UgTSBTdCwgR3JhbnRzIFBhc3MsIE9SIDk3NTI2LCBVU0EiMRIvChQKEgljYH4eM3rFVBGFAN3hxbUtiBDsBioUChIJ90yFjDJ6xVQRa6-v8UI__Mo',
        'mgussin2@dell.com',
        'EiM1NjggUmVlZCBSZCwgQ29yZG92YSwgQUwgMzU1NTAsIFVTQSIxEi8KFAoSCXV4f7oz9IiIEXpl3TSpWibtELgEKhQKEglR0y8SMPSIiBHAXMXY9q1w5w',
        '{\"lat\":42.4308053,\"lng\":-123.3190915}',
        '{\"lat\":33.7148643,\"lng\":-87.1558304}',
        NULL,
        NULL
    ), (
        '584b9d97-50b7-41de-b74f-60b47ae51ada',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEzSURBVDjLxdOxasJAHAZwwbfKkjlbJVMpJaYmxtSoNVoSsCLlekQSjcZNRUFFIUNxD5nqY7Rr+wiuX89M3a62lA4f3PL97n/HXQ5A7jfJ/Rng+/1LSsn72UAQ+HlWJp5Hj4Q8gguE4VAIw0GWwSAQWPl1sZhjv39Gr/fAB4bDAJNJhCgaYTweYbNZIY5jrNcruM49HwiCPg6HF6RpiiRJsFwuQQhhYAS7WecD7KzY7bbwPA+UUnS7Xdi2zdZPqNVMPnC6qPl8Cl3XoSgKZFmGJEkwTYOlzAc6HRez2RSu66DRqKNQuIAoigy7hmGU+EC73USr1WDlajayZZkZoqoKm0rlA807S6jeVoRKRRPK5RtB14tvJ8hxbGhaEWc/JLZrXisVKcvxR8AX6Irl4/8+03fzCbreyRfHFw9qAAAAAElFTkSuQmCC',
        'Chipmunk, least',
        'Thumbin a Ride Rescue',
        '31 Hills Point Rd, Charlotte, VT 05445, USA',
        '8965 South West Street, Haysville, Kansas, USA',
        '2023-06-23',
        'flexible',
        'Male',
        'yes',
        '37e13b96-6c5a-4d7f-8fcb-c49a383ce211',
        NULL,
        '2023-05-13 17:27:34',
        '(983) 8619098',
        'ChIJq6zuYBMQsocRRWnRubhsxiI',
        'acarmenc@mit.edu',
        'Eig4OTY1IFMgV2VzdCBTdCwgSGF5c3ZpbGxlLCBLUyA2NzA2MCwgVVNBIjESLwoUChIJXZUswQPpuocRJf_Wd88vac8QhUYqFAoSCafHFTXX5rqHEXnKkmzaKeLa',
        '{\"lat\":35.4858036,\"lng\":-97.5911909}',
        '{\"lat\":37.5319235,\"lng\":-97.3891436}',
        NULL,
        NULL
    ), (
        '62c7ce6b-317b-44a9-a5bc-75a0ad62b1ec',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHISURBVDjLpVPNK0RRFP+9D98syMwUspHkm9I0YkFZWBFKkZ0s7a3Ewh+ilChK7FgoZCJFKYlYKB8zk2+Z5t0P577He29kQU7dd+6575zf+d1zztWklPiPmOozt/U4SThjXIoyIQS4AJjSXO0lGGlvcXAm6Vzsz4xUhm0AIeX4QLig+C+ZpxbOG1wGhGYHr1zMUmZGWRgs0ha3PE1nX/8mWmdgWTzLB+DUYbhm9FfZ35IEyrhXA3VXJfPbsV8B9LQUIeUHYJ8ASobag1jcucNgW8g9W4reYSDi2YnnZDoDiwCokDANct6NwTB0LEdj0HRA/wxa2SN25JNBEdWluUhZ366gqmAaGvrCAXKOozccTGPgt8+vn8GYSGcgyTYp3dpBnBg42nbQPRBTo5bTvqYkmxL6AQhNTWQGBXY3B7BxlEBXozcW64dxRKoKUZBju+P06gl5WaaviMJBM3TNDlbypemIZgHYOnlwASsCmW7nHADGnBoQ3c76YmweJ9BR5zFYjsbRHwm4tmJg6PhWA7pCXXk+bu7fURHKweXtq/sWaksz7SC/CCGFrwtyZ3r+rCnFRZ7qr1qc6mLZj4f9OEyPL8lVpbX/PucPv5QPKHB1TdEAAAAASUVORK5CYII=',
        'Sockeye salmon',
        'Thumbin a Ride Rescue',
        '4024 Northwest 16th Street, Oklahoma City OK 73107 ',
        '6543 Turnstone Way, Rocklin, CA, USA',
        '2023-08-05',
        'morning',
        'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',
        'yes',
        '37e13b96-6c5a-4d7f-8fcb-c49a383ce211',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '2023-05-13 17:27:34',
        '(487) 9493020',
        'ChIJq6zuYBMQsocRRWnRubhsxiI',
        'ccuttlesi@google.de',
        'ChIJH9sVYiEim4ARlUx-JPyPWYM',
        '{\"lat\":35.4858036,\"lng\":-97.5911909}',
        '{\"lat\":38.8020223,\"lng\":-121.289397}',
        NULL,
        NULL
    ), (
        '73c5eeec-694e-41e7-9ecc-517a5e9c490d',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAChSURBVCjPY/zPgB8wMVCqgAVEFP7/w/CH4TcY/gLh59ul9oLtdmZk+I8D7vn/4f+e//8hJqT/h+kGwqu/GA7oQIz/D7NiJiM22/8j3BD9/xdMPwQ+vyL1n+EfEEIVLGXEph9Jge9/JN1XfzPcAbrhH8NfhILNWEz4h2yCPZIJYP88fyf1D9mRB7G6AUmBAdQXYN1X/zB8AYfDebACRopjEwDsBmruXDxiUwAAAABJRU5ErkJggg==',
        'Canadian river otter',
        'Happy Tails Rescue',
        '5396 N Reese AveFresno, CA 93722',
        '3215 Tennyson Square, St. Louis, MO, USA',
        '2023-07-21',
        'evening',
        'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',
        'yes',
        'aed478e2-6fb6-4e27-9e4b-97d082658aae',
        NULL,
        '2023-05-13 17:27:34',
        '(338) 6332311',
        'ChIJi9swy6BolIARhb4xqrCiZq0',
        'ycrippellh@census.gov',
        'ChIJZzGYnGHK2IcRtlbOzZgVJR0',
        '{\"lat\":36.81529829999999,\"lng\":-119.8641251}',
        '{\"lat\":38.60829409999999,\"lng\":-90.31435809999999}',
        NULL,
        NULL
    ), (
        '909b2ed1-39d5-4fdb-bd2c-5a541c8286e8',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADPSURBVCjPdZFNCsIwEEZHPYdSz1DaHsMzuPM6RRcewSO4caPQ3sBDKCK02p+08DmZtGkKlQ+GhHm8MBmiFQUU2ng0B7khClTdQqdBiX1Ma1qMgbDlxh0XnJHiit2JNq5HgAo3KEx7BFAM/PMI0CDB2KNvh1gjHZBi8OR448GnAkeNDEDvKZDh2Xl4cBcwtcKXkZdYLJBYwCCFPDRpMEjNyKcDPC4RbXuPiWKkNABPOuNhItegz0pGFkD+y3p0s48DDB43dU7+eLWes3gdn5Y/LD9Y6skuWXcAAAAASUVORK5CYII=',
        'Galapagos albatross',
        'Happy Tails Rescue',
        '5396 N Reese Ave, Fresno, CA 93722',
        '444 West Iowa Avenue, Nampa, ID, USA',
        '2023-06-10',
        'evening',
        'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
        'yes',
        'aed478e2-6fb6-4e27-9e4b-97d082658aae',
        NULL,
        '2023-05-13 17:27:34',
        '(992) 6611789',
        'ChIJi9swy6BolIARhb4xqrCiZq0',
        'chorsewood4@bbc.co.uk',
        'ChIJNws_oeRLrlQRMXRvY8g2jks',
        '{\"lat\":36.81529829999999,\"lng\":-119.8641251}',
        '{\"lat\":43.55469890000001,\"lng\":-116.5796953}',
        NULL,
        NULL
    ), (
        'afbd16a1-e654-4dc1-b393-d77e67436d66',
        'n/a',
        'Arnold/Tabby Cat',
        'Hopeful Hearts Animal Rescue',
        '890 West St, Oceanside, CA 92054, USA',
        '936 Broadway, New York, NY 10010, USA',
        '2023-08-08',
        'afternoon',
        'Large cat needs a ride to NYC',
        '',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        NULL,
        '2023-06-03 21:55:45',
        '(493) 9110320',
        'EiU4OTAgV2VzdCBTdCwgT2NlYW5zaWRlLCBDQSA5MjA1NCwgVVNBIjESLwoUChIJ2XBkQiJu3IARAzmKoZ1pMUYQ-gYqFAoSCQ26jGYibtyAEeJPjn7Ln81U',
        'mgussin2@dell.com',
        'ChIJvfop4qNZwokRIzeQa0pB6dQ',
        '{\"lat\":33.1884586,\"lng\":-117.3693539}',
        '{\"lat\":40.7402015,\"lng\":-73.9891967}',
        NULL,
        NULL
    ), (
        'c06f421f-9b22-428f-8f1a-c8e4febb85eb',
        'n/a',
        'Harry/ Golden Doodle',
        'Hopeful Hearts Animal Rescue',
        '897 West Van Buren Street, Phoenix, AZ, USA',
        '345 Park Avenue, New York, NY, USA',
        '2023-06-09',
        'afternoon',
        'golden',
        '',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        NULL,
        '2023-06-11 19:29:32',
        '(493) 9110320',
        'Eio4OTcgVyBWYW4gQnVyZW4gU3QsIFBob2VuaXgsIEFaIDg1MDA3LCBVU0EiMRIvChQKEgn574jBLxIrhxEbPkyfH74KgRCBByoUChIJIyqUD60_K4cRmnbM2Z-ISsc',
        'mgussin2@dell.com',
        'ChIJB79C-AFZwokRUCzTyckejZU',
        '{\"lat\":33.4514006,\"lng\":-112.0852238}',
        '{\"lat\":40.75803330000001,\"lng\":-73.97323639999999}',
        NULL,
        NULL
    ), (
        'c0b9288f-ccb0-4208-a42b-e9efd085a27a',
        '',
        'Squirrel',
        'Hopeful Hearts Animal Rescue',
        '3215 Tennyson Square, St. Louis, MO 63143, USA',
        'Washington Square, New York, NY 10012, USA',
        '2023-06-25',
        'afternoon',
        'rabbid squirrel wants to see NYC',
        'YES',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        NULL,
        '2023-06-03 22:05:30',
        '(493) 9110320',
        'ChIJZzGYnGHK2IcRtlbOzZgVJR0',
        'mgussin2@dell.com',
        'ChIJjX494pBZwokRGH620d9eYfo',
        '{\"lat\":38.60829409999999,\"lng\":-90.31435809999999}',
        '{\"lat\":40.7308838,\"lng\":-73.997332}',
        NULL,
        NULL
    ), (
        'db290b10-5b10-472c-bdbb-24370b242683',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHtSURBVDjLpVPJqiJBEHwf1f/UH+DydBTtLxBRUAS9eFH04MGTINIHUQQRt3I5eHBfW20XFBVzKgq75TGPNwxTEFSTXREZmVn1QUQf/4M/Av1+X+r1ekq321U7nY7GGNNarZbabDaVer0u/SjAyTIns/V6TefzmR6Ph8DpdKLFYkG1Wo1Vq1X5W4EXWb9er4SF/XA4kK7rdLlcRAyilUpFL5fL8heBl21mkHe7HW23W1ouV7Tf72mz2RBcGSKqqrJCoSCZArxexThgkEejMbndbrLb7S+xpQDWYDCgbDarmAK8WSqUYVXTNJrNZoJos9nJ6fzFd5uIow/oBwTT6bRqCrTbbQ3Ngl0c/Px0CDKIgMPhJKvVKsqAi9vtRolEQjMF+JiEAOzj0Gq1Mi0jKxxNp1MBw0U8Hn8LNBoNFR1HGSAhKzICFotFwOVy0WQyEZMZDocUi8XeJfD5Kvj5fD5FBq/XS4qikMfjMXfERqMR3e93KpVKFIlE3k3kc5WKxSJDD7AMuxAdj8eCiKxIgG9OZhzSl4uUz+flXC6nY+Y4eDwehZv5fC4uEzJDhBP1YDAof3uVM5mMnEqlGC9JNA49Qc2YO788xInM7/fLPz6mZDIpRaNRJRwOq6FQSAsEAhonqT6fT+Hf0l9f47/iN5+1McdPrPQwAAAAAElFTkSuQmCC',
        'Dog, raccoon',
        'Happy Tails Rescue',
        '5396 N Reese Ave, Fresno, CA 93722',
        '6789 High Street, Las Vegas, Nevada, USA',
        '2023-07-25',
        'flexible',
        'Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
        'no',
        'aed478e2-6fb6-4e27-9e4b-97d082658aae',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '2023-05-13 17:27:34',
        '(427) 8688311',
        'ChIJi9swy6BolIARhb4xqrCiZq0',
        'dmaccoughene@webs.com',
        'EiY2Nzg5IEhpZ2ggU3QsIExhcyBWZWdhcywgTlYgODkxMTMsIFVTQSIxEi8KFAoSCYNPTxePx8iAEX1pcEFZMOYeEIU1KhQKEglP3A0Uj8fIgBHK0ETPjgQsiw',
        '{\"lat\":36.81529829999999,\"lng\":-119.8641251}',
        '{\"lat\":36.0673223,\"lng\":-115.2763584}',
        NULL,
        NULL
    ), (
        'df1186ba-7f3a-4b37-9f32-f966ca5c5b49',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAK4SURBVDjLlZJdTJJxFMZp6C2bd+bWhTXXReuirbtuWuZFMyt1iX04bWlfNmlqoqCCfDZSS1ABwUQ0NSQVVD5ETcCVqLS6yK8EslpttdlFoS6Vp//7urVaLuvdzs357/c8zznvYQBg7FR3vbKwfEzE2u5tR1jhkYR1/kZIR4WodJax/kvgjlscbvLXw/62H5opFcrtXBRbb7H+SYBEDmunKdgK02IbbG/6oHxajSJLAfK7r7D+KiB7UhXWTKtgX7Lg0es2GOd04A4UYSDUi2qvHNdNebjUnsXaVkA6Kgirp5SwEVjhlULqFsIwq0XLrAYP51tgDZlR5arARUPmyh8C4pHKlcbJOhLXgsDXeaxtrKLzRTskY5VbcNAMoYuP8y0Z67+NoPLVJoiGK743+O7Tsyo8UhpWexoQWg5A7hHBEuyGYIhPOSOr9RzY+vQoWkDlq6kQkUj1E/douGvBSGILaGcKFjuEW7CTRzlj4uM4yh2lSNOektACVCTVRC0GyYI6F1rpWR/MqCEmseVuEfoC3ahwlkElS4Q7ex+GE6MxxI6FuPAATiiTYhiSEYGBFPTP1egPPUZxPwfNrxrRNtdMYBPt1lSdjJclR7A6WIPIjAPhrkJM5h/cbE2PUTAko4LdVArqSNRTdXRc46x+Cya9PHMOHJlxWCEwlCkANwaQxeOz4iicx5lBeok8222dwa9HkZUD5bMa9C6awLeV4KwuFXwiMnwsChF/D379vghiqX6EFii2cvZXuco3XEE7bpqvgggiVXMqQjbtSNee5jmTmO++NV8GCLRWwsAyqaVrTJD+e1qgoOdGNLmu3ryOnE1OTz7OqE+uZ+jTDpNN76Xevew4oS83Yf0DNx6fyqIRyN2FkZSoDUcSk/fziHI7cg5lGy9Mk1+VvN15j7P3lBLHEBWbSkTBVP8HrJC/O3IOxUMAAAAASUVORK5CYII=',
        'Woolly-necked stork',
        'Pawsitively Rescued',
        '1046 Dudley AveLouisville, KY 40204\n',
        '4093 Miller Avenue, Brooklyn, NY 11207, USA\n',
        '2023-07-23',
        'morning',
        'ulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.',
        'yes',
        '8bf02048-08e5-4e39-9182-9f4e37f70356',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '2023-05-13 17:27:34',
        '(765) 2030536',
        'ChIJ0xBeWSxzaYgRRdrHQmn-nDA',
        'lhaseleyg@wordpress.org',
        'EiNNaWxsZXIgQXZlLCBCcm9va2x5biwgTlkgMTEyMDcsIFVTQSIuKiwKFAoSCftIM-hSXMKJEVSJSsageoyuEhQKEgnhRriPUVzCiRGvIbXgLdZ2zg',
        '{\"lat\":38.241661,\"lng\":-85.71884299999999}',
        '{\"lat\":40.6707374,\"lng\":-73.8907346}',
        NULL,
        NULL
    ), (
        'e1396a5b-fbee-4b01-863b-c8ccba1445ff',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALvSURBVBgZBcFNaNUFAADw3//jbe/t6d6cc2/kUpeXsEgUsSSiKIzAQxDdvCgdulgagmBXLx4K7BgRWamnOgSDIj3EusRangwlbVvOyba25tvH23v/z36/oCxLcOr7uaO48sxA9Vg7LbTTQloUtrKihXUsI8cqVvAtfo4Biix78eDItmPnX90FADaTotFOisZqJx9NUta7udnlDT/+vXkc52KAIsua/T0BmHuSqwSBOCCK6a2E9vSGojBUiTg0WvNUoz74xeTjT0OAPE376zFZwXoSaKU86dLq0OqwssXSRg4uXn/o2Fjd80OVXTFAnqaD23tCm102O7kwDMSIIsKISCAKKBDka36bXnX7YetxDJAnSbNRi7S2Mu1uKQxLUUiYB6KQSCmKUEYW17o+u/lgDadigCxJ9jb7K1qdUgYlUR4IS+RsPfhFliaeGzkhr+SyJBv74aOX/wsB8qS7d6TRazMpBSFREAjWH0lmflV21lR7e/T19fl3acmbAw+9MzT7CQRlWXrr0k+1OArb3104bvKfVKEE6fSEffv2mZ+f12w2hWFodnbW6Oio8fFxRVHUY8i6ya56vSoMKKAkCAi279bpdCwvL5uYmFCr1Rw4cEC73Vav1786c+ZMO4Q86fbFCnFIFAYEoY17tzSiTcPDw+7fv+/1kxe9e/q8R/PzRkZG7N+///Tly5fL+JVz14dw6eizeyyslWYXc/UqnVZLFEWazabh4WG1Kv19lGVgfX3d3Nyc6elpcZ4kb+DEH3dnrG7FNrqlNC8V2UEjG/MGBxeMjY2ZHP/aVFDa8/RuKysr7ty58yUuxHmaHn77tRdqH598CQDkJde+mcKAhYUFRw4f1Ol0zMzMaDQa8F6tVns/ztN0ZmG55drNuwa21Qz0Vw3UezXqvQYGh1y9etUHH5419fukxcVFy2XTrVufl1mW3bxx40YeHDp5ZQjnsBc7sRM7sAONak+lUq1WHKrds7S05M/yyF84efva2Sn4HxcNUm7wsX3qAAAAAElFTkSuQmCC',
        'Elk, Wapiti',
        'Four Paws Rescue',
        '1011 Devon Drive, Hayward CA 94542',
        '7845 South Street, Lincoln, Nebraska, USA',
        '2023-06-12',
        'afternoon',
        'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',
        ' Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '2023-05-13 17:27:34',
        '(516) 5258360',
        'ChIJeeyrsPaTj4AR_CHaq6Eu7g4',
        'gwalcar9@foxnews.com',
        'EiU3ODQ1IFNvdXRoIFN0LCBMaW5jb2xuLCBORSA2ODUwNiwgVVNBIjESLwoUChIJxaIV1Ay9locRC1yaZRMwJPcQpT0qFAoSCcVCtgO9vZaHEYRhk5QjMu_H',
        '{\"lat\":37.6544658,\"lng\":-122.0677428}',
        '{\"lat\":40.7896285,\"lng\":-96.612856}',
        NULL,
        NULL
    ), (
        'e427ee90-f33d-4fcb-a21f-0ebd28f26ccb',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAK9SURBVDjLpZNbSNNRHMf3JPYUBUFIT/USRCsiCKIeWhc06WUmicvNXdVITLDUKWmMZTJKZQ7mZDbbhV2au9aczjkvbU4tp3MqaWi28KWZ9zmWfvtPIgrEoh5+D9/fOd/P75zf+R0SANL/xJ6LIyMjSUNDQ/v+CVD44h29TNG30ubyrQnMobV7yresvwYQ5owS3TDuawcgso6hyj6JhL4tsmf8EUCYyYUKHwSdIeQ+1sNoaw8Uyft2NF1kRnqxlLwnoKvXqxWqPGA3vEJlg2Y4kXvYZB5IaIm0GlPqLExbhAjIr2FUcoJOCgaDUqJZE0SzJrxe70xPT892JBJBk9K46ff7odPpQOSgfV4UW3CXYmnMDqx+xtexl+gVpccSnW4Mh8MgAPB4PFSfzwe73e5zuVzQarW3rFYrvAbqsy/jVYh9smLBI8JGsA3f5voRaOFtk4gqxwYHB9Hd3Z3idDqTbTbbGaPReFij0ZAVCsX+4bbrdxbHK7e2Nvqx8eEuIoOFmFSyMdyUi0cPCjw793a73csEAEQ1akdHB9RqdY7ZbEaXKqtmMViOragP6zMMROdpWJngY0ZKWdK31KOgoKBsB+BwONotFkuKXq9PVqlUZLlcfqit9kLZwlDpDzMd0Y/ZWB6vwLSEstYpuJqan58f43A4qTsAk8lEJQBQKpVUg8EAnehGXai9BFsbvYjOsrE5n4Ml4iTvJVdidUI+8vLyctls9iyDwTj48/laW1vjzc3NybLisxWh13yMOuoR9mdifZaGSKAMU2JKxFSdfo7H451msVg0Op3e/9scyGQyiMVi6GsvAytzmJLdhJufgjfSNDirz6OyiAkulwsmkwkCABqNZtt1kATcE/GYrxExfwP8wkvQc46sOsvJp37dk52dnZSIXQGZFw9EaxjH411P0uKup5QeW+nJo3v9xu8f/sicYEnItwAAAABJRU5ErkJggg==',
        'Stork, white',
        'Four Paws Rescue',
        '1046 Dudley AveLouisville, KY 40204\n',
        '2345 North Minnesota Street, Wichita, KS, USA',
        '2023-07-13',
        'morning',
        'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.',
        'yes',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '2023-05-13 17:27:34',
        '(188) 5395002',
        'ChIJeeyrsPaTj4AR_CHaq6Eu7g4',
        'mmckinless3@themeforest.net',
        'EisyMzQ1IE4gTWlubmVzb3RhIFN0LCBXaWNoaXRhLCBLUyA2NzIxOSwgVVNBIjESLwoUChIJf6IArV7iuocRAvOLcqIWWBcQqRIqFAoSCZmq-KRU4rqHEeygKYzIRiSR',
        '{\"lat\":37.6544658,\"lng\":-122.0677428}',
        '{\"lat\":37.7253552,\"lng\":-97.31358499999999}',
        NULL,
        NULL
    ), (
        'e66f02d0-16fa-453a-92f0-a72d14746b46',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJYSURBVDjLY/j//z8DJRhMmJQd+x89/W4IRQbY1x5L8590dzmy5PuIqC4gfvA+PPIyEMfhNqD06H+L9gfG9p33/jr23OMEiX30DTj8yT/oFxCf+hAYfBeIfwPxIyBWwjSg5Mh/tYZHzDr1D34aND7Y9tXOsf2Lg/O/z85uNjCFn908lT56eH985xXwzXvygwYUA4yLD/9Xcm+QlS572JWesP7XVyOL79/MLKci22Rc/6DXvPH+X8um+79t2u7/tOu4/w9ugFHxof8wha+1LP89NHT9iaxZIf/BCpWie7/Vi+/N/25kqvrN2Oz/suiO6QgDig6ADfgtJrX0p6TMb1u/Xd+5Eh9M4k16yCyQdH+HYOK9H6JJd+tgBv7U0j3wXVvvA9wAg8J9/6sNAvT/8gr++8Mn1MYQ8aCFIfzBf6bwB3+Zwx/8Ywu7H44e+j8VVX4hDMjf+/8/I6v/fya2OyghHHCn3GuRw3TvJTZnPJdYnXVbbA436Le49Aa4Afp5u///ZGAJ+c3AIg5T4DXT0stjpuULj1nmD9xmW6x1nWu2z2W+6RenBcbxIHmga6XgBujl7vw/R1TDAabZscNommOn0UeHLsNFDj2GPDBxh37DDrtJ+u8x0oFu9vb/liU6khal2jPNS3UfAem3FmU6Gej+tqjX5rBo0rln1qI9GdWArG3/jTI0/Q0z1N3UAyxdgTQ4NQpreMjCFAqpOoHZRvnqUhpROhmmxRo8cAO0M7f8187Y/F8rYxMQb/yvlbYBiNf/1wTh1HX/NUA4ZS0Ur/mvkbwajOEGUIIBf5BxjDvwFIUAAAAASUVORK5CYII=',
        'Lily trotter',
        'Four Paws Rescue',
        '1011 Devon Drive, Hayward CA 94542',
        '4567 East Wyoming Place, Denver, CO, USA',
        '2023-05-27',
        'afternoon',
        'Musce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis.',
        'yes',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        '2023-05-13 17:27:34',
        '(935) 7700935',
        'ChIJeeyrsPaTj4AR_CHaq6Eu7g4',
        'ufollows2@icq.com',
        'Eig0NTY3IEUgV3lvbWluZyBQbCwgRGVudmVyLCBDTyA4MDIyMiwgVVNBIjESLwoUChIJx2ABfNl9bIcRCeWnhLePWeYQ1yMqFAoSCUMjYsnGfWyHEZ9kXAqju00W',
        '{\"lat\":37.6544658,\"lng\":-122.0677428}',
        '{\"lat\":39.6921732,\"lng\":-104.9340943}',
        NULL,
        NULL
    ), (
        'f1933eb5-ea76-4016-b014-700a5223d0ea',
        '',
        'Birds',
        'Hopeful Hearts Animal Rescue',
        '250 Vesey St, New York, NY 10281, USA',
        '897 Oklahoma City Blvd, Oklahoma City, OK 73129, USA',
        '2023-07-18',
        'afternoon',
        '15 birds.  ',
        '',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        NULL,
        '2023-06-05 01:19:09',
        '(493) 9110320',
        'ChIJCyvoeBtawokRKxkFu3rTrPA',
        'mgussin2@dell.com',
        'EjQ4OTcgT2tsYWhvbWEgQ2l0eSBCbHZkLCBPa2xhaG9tYSBDaXR5LCBPSyA3MzEyOSwgVVNBIjESLwoUChIJH7YLG-EWsocRUwR1Eww7TxgQgQcqFAoSCb1yThTZELKHEdELYYLnvajo',
        '{\"lat\":40.71429029999999,\"lng\":-74.0158596}',
        '{\"lat\":35.4604099,\"lng\":-97.49986870000001}',
        NULL,
        NULL
    ), (
        'fa02503f-f6b8-492f-aa75-248d37b40602',
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKxSURBVDjLdZNfSFNRHMc3FVNEBTWFFH0wTAVf9NEeiiLNh+ohKZIykKSHegssJXqZVFbiKsOUNAkhMu7wz8zgqjk3LndbOnVuorPdbboZsc0/zKs4+XbOdU4jPfC9v3PO73w/53cu58gAyKhIk+fl5Z1XKpX6nJycUjKOonMhRRUWFp5ua2vj6Bo6F/bRj40EjsigVsPtdoPv65PGtpBof3xwUMr9HBgI50Iby+R0MHXsGCxaLVwuF2ZINEVGwhsRIWlCLodFp5NydM1ECBCqbhcwFxcHprMTgiCA6ejAeEoKHElJcCQkwBgbC6a9fTdHovUwwJ/ERAzl5qIlIwNsVhYWMjNhT0/Hr9RUWAlIHR+P1zEx6I+OhptU9B9gPTkZv4uLsVxUBE9BAVwE5sjOhp2AFgjIlpYGW0kmZruuY76nHqYPFzDxJr9SAvA8j2AweKS2t7exInTDM1yDlal+YH0J/qmv4F6WLh8KCAQCMBgM8Pl80Ov1MI02wWt+gi1XLzw/XmBjmkFQ0GK6o1o8FEDNKpVK2nndPQSf+TF2NrTYWLgHr/4+rJ+qMNl+B9rGy6f+AVDDHoRhGKwusfBNP8KOyCFgq4TorMCapRZC5xXwQ6r9n3gQsKeej3XwGGpC5lsQHTewaq6D7X0Z5g3fwXHc0YAlcw9mBh+QsjUQ7VXYdN7ECqmEmjf9i9J9oMcMX2UKIMYdarZoujAzUIvJb01Y5MsRsFfAa3qIudZL2PS54HQ6qRFGo3EfwLIs/H7/KoV8eX4OWBMw23oVw7UnoGu5CN2rElj1rLQzbaIoSkcIA5qbmzEyMoKxsTEoqguwxb3FFq8EX38W3XdPYlT9WcppyTvQkTeh0WhAPWGAQqHQkmcMqmtnjuPp7Xywz8rQ21iOd40K7OUOqqGhgZYj+wu8wrLULIN/YAAAAABJRU5ErkJggg==',
        'Dromedary camel',
        'Hopeful Hearts Animal Rescue',
        '31 Hills Point Rd, Charlotte, VT 05445, USA',
        '3456 Main Street, Elkhorn, Nebraska, USA',
        '2023-07-23',
        'flexible',
        'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',
        'no',
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        '1a0aff12-89a8-422a-9f8c-725f5726d6ef',
        '2023-05-13 17:27:34',
        '(309) 9450179',
        'ChIJMXFrExCHykwRrC2TH5YKbHQ',
        'tscneider1@guardian.co.uk',
        'EiQzNDU2IE1haW4gU3QsIEVsa2hvcm4sIE5FIDY4MDIyLCBVU0EiMRIvChQKEgmtq_eT9e-ThxEi5HGi2LMCUxCAGyoUChIJedGdJPbvk4cRrLv131b3Jq0',
        '{\"lat\":44.33580569999999,\"lng\":-73.2801242}',
        '{\"lat\":41.2897897,\"lng\":-96.2369348}',
        NULL,
        NULL
    );

/*!40000 ALTER TABLE `requests` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `users`

--

DROP TABLE IF EXISTS `users`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `users` (
        `id` char(36) NOT NULL,
        `organization` varchar(255) DEFAULT NULL,
        `user_name` varchar(255) NOT NULL,
        `first_name` varchar(255) NOT NULL,
        `last_name` varchar(255) NOT NULL,
        `address` varchar(255) DEFAULT NULL,
        `phone` varchar(255) DEFAULT NULL,
        `email` varchar(255) NOT NULL,
        `password` varchar(255) NOT NULL,
        `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        `place_id` varchar(500) DEFAULT NULL,
        `coordinates` varchar(500) DEFAULT NULL,
        PRIMARY KEY (`id`),
        UNIQUE KEY `users_user_name_unique` (`user_name`),
        UNIQUE KEY `users_email_unique` (`email`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `users`

--

LOCK TABLES `users` WRITE;

/*!40000 ALTER TABLE `users` DISABLE KEYS */

;

INSERT INTO `users`
VALUES (
        '1a0aff12-89a8-422a-9f8c-725f5726d6ef',
        'Rescue Paws',
        'dwherrett3',
        'Daryl',
        'Wherrett',
        '555 Morris Street, Victoria, TX 77901, USA',
        '(117) 3674044',
        'dwherrett3@nbcnews.com',
        '$2a$10$a0dMMTWLx5PYE/uBNFrbkuO2HO4K5QKdVmXnsuAZf422wVrMqiw/W',
        '2023-05-13 17:27:34',
        'EiJNb3JyaXMgU3QsIFZpY3RvcmlhLCBUWCA3NzkwMSwgVVNBIi4qLAoUChIJF7WqB1tmQoYRF6QwzttQhiYSFAoSCcE4RcpCYUKGEbmwLEigcqYo',
        NULL
    ), (
        '1c0be7ba-b80b-46a2-940b-fc968ecf27ec',
        'Furever Friends Rescue',
        'iflarity5',
        'Ilyssa',
        'Flarity',
        '123 North French Avenue, Sanford, FL, USA',
        '(764) 6643131',
        'iflarity5@uol.com.br',
        '$2a$10$E9BLWHnkNzG7ixGRFTAnxOWFeTsJk5qTl8bh8taXf3EjXO0EsMkpC',
        '2023-05-13 17:27:34',
        'EigxMjMgTiBGcmVuY2ggQXZlLCBTYW5mb3JkLCBGTCAzMjc3MSwgVVNBIjASLgoUChIJHUPbkZ8T54gRTuYq1qowfiwQeyoUChIJacYY26ET54gR3BtRHTYx5FQ',
        NULL
    ), (
        '32c64173-c0cd-42f4-bb79-7ebe637f1b87',
        'Rescue Rideshare',
        'vwhetton6',
        'Valentijn',
        'Whetton',
        '4005 Conaway Street, Daphne, AL, USA',
        '(766) 8893748',
        'vwhetton6@imgur.com',
        '$2a$10$ZUF4TA1jeCN/i3j2yL2K8uqVC1xQxOVo1pzI4QqwyuBmWAOWv5QBq',
        '2023-05-13 17:27:34',
        'EiFDb25hd2F5IFN0LCBEYXBobmUsIEFMIDM2NTI2LCBVU0EiLiosChQKEgllYtlbh0GaiBESf2VCWTqL-xIUChIJj8sPAk9CmogRJOPOh3ZIaGM',
        NULL
    ), (
        '37e13b96-6c5a-4d7f-8fcb-c49a383ce211',
        'Canine Carpooler',
        'jmacknish4',
        'Jodie',
        'Macknish',
        '4024 Northwest 16th Street, Oklahoma City, OK 73107 ',
        '(617) 2918018',
        'jmacknish4@paypal.com',
        '$2a$10$CtMZDYjYcKuh8gT5yv.agOf55Bb6k.gTsWUlVwAhOY8LjkTwqoD6O',
        '2023-05-13 17:27:34',
        'ChIJq6zuYBMQsocRRWnRubhsxiI',
        NULL
    ), (
        '4832021d-1bc0-4d5b-89ff-9af65a72d9d8',
        'Hopeful Hearts Animal Rescue',
        'mgussin2',
        'Minnie',
        'Gussin',
        '31 Hills Point Rd, Charlotte, VT 05445, USA',
        '(493) 9110320',
        'mgussin2@dell.com',
        '$2a$10$xvTkumcM1YstfB75lumUXeRUi0W5lWSFdu.NlK95xnJgGGIOLSNsW',
        '2023-05-13 17:27:34',
        'ChIJMXFrExCHykwRrC2TH5YKbHQ',
        NULL
    ), (
        '48defbcf-dd97-4998-8fb3-4dba6b3be13c',
        NULL,
        'freckels',
        'Brittany',
        'Jones',
        '3215 Tennyson Square, St. Louis, MO, USA',
        '7273130062',
        'bj@gmail.com',
        '$2a$10$UIRkPFBcgMkgWlN8eBofCex0ztRt1f3XCfYizC9/JJqnh5dBsZTHq',
        '2023-05-16 21:20:38',
        NULL,
        NULL
    ), (
        '4e389fd2-7432-47fc-b760ed01d2899e43',
        'Four Paws Rescue',
        'cstonhard1',
        'Chickie',
        'Stonhard',
        '1011 Devon Drive, Hayward, CA 94542 ',
        '(415) 2371927',
        'cstonhard1@dyndns.org',
        '$2a$10$QXsoVW2awks0P3QiK/1bUOdK4Y4cJL2cTdjsie71ryNaY5oUqq1Bu',
        '2023-05-13 17:27:34',
        'DID ChIJeeyrsPaTj4AR_CHaq6Eu7g4',
        NULL
    ), (
        '8bf02048-08e5-4e39-9182-9f4e37f70356',
        'Pawsitively Rescued',
        'gmatuszkiewicz7',
        'Gherardo',
        'Matuszkiewicz',
        '31 Hills Point RdCharlotte, VT 05445',
        '(596) 8052653',
        'gmatuszkiewicz7@nba.com',
        '$2a$10$YMnbDmKxetBnbQKWRfNdCOrjWaYP27hHYFeVXKTVLtMiDIIl98sxu',
        '2023-05-13 17:27:34',
        'ChIJ0xBeWSxzaYgRRdrHQmn-nDA',
        NULL
    ), (
        'aed478e2-6fb6-4e27-9e4b-97d082658aae',
        'Happy Tails Rescue',
        'gsawbridge0',
        'Giorgio',
        'Sawbridge',
        '5396 N Reese Ave, Fresno, CA 93722',
        '(963) 7133933',
        'gsawbridge0@smugmug.com',
        '$2a$10$4/VFlNi2cqOX/kDTaJqwdObNJ4nOxMKeJJoZv9T3OKwG2O8A9dTHi',
        '2023-05-13 17:27:34',
        'ChIJi9swy6BolIARhb4xqrCiZq0',
        NULL
    ), (
        'b824df0f-21c3-48a9-9d2f-152791bde746',
        NULL,
        'bfranklin',
        'Bert ',
        'Franklin',
        '589 5th Ave, New York, NY 10017, USA',
        '7273130062',
        'Bfranklin@me.com',
        '$2a$10$CDqCP3FvZPc3OK3k0h5FeOdRb5OIlIWGwHnHtpzzWW2BZrCF7fvAi',
        '2023-05-17 16:13:13',
        NULL,
        NULL
    ), (
        'f0fabd87-3f8e-4760-894c-0b92edec7457',
        NULL,
        'Godzilla',
        'Godzilla',
        'Leykam',
        '650',
        '727-313-0062',
        'Godzilla@me.com',
        '$2a$10$knzuHeCbymk1Phq9LA/wweV2fNmf5cTdXlMwYRRONXIOquNqQze3C',
        '2023-05-17 15:41:25',
        NULL,
        NULL
    );

/*!40000 ALTER TABLE `users` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Dumping routines for database 'rescue_transport'

--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */

;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */

;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */

;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */

;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */

;

-- Dump completed on 2023-06-16 18:21:09