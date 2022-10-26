-- --------------------------------------------------------
-- Host:                         ec2-34-192-72-159.compute-1.amazonaws.com
-- Server version:               PostgreSQL 12.12 (Ubuntu 12.12-1.pgdg20.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table public.artists
CREATE TABLE IF NOT EXISTS "artists" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''artists_id_seq''::regclass)',
	"username" VARCHAR NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.artists: 0 rows
/*!40000 ALTER TABLE "artists" DISABLE KEYS */;
INSERT INTO "artists" ("id", "username") VALUES
	(1, 'someone');
/*!40000 ALTER TABLE "artists" ENABLE KEYS */;

-- Dumping structure for table public.carts
CREATE TABLE IF NOT EXISTS "carts" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''carts_id_seq''::regclass)',
	"user_id" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.carts: 4 rows
/*!40000 ALTER TABLE "carts" DISABLE KEYS */;
INSERT INTO "carts" ("id", "user_id") VALUES
	(12, '44'),
	(16, '45'),
	(22, 'hus94lq3j'),
	(23, 'h7zv4tyu1'),
	(35, 'o0uxt28o6'),
	(36, 'j9rhpf39i'),
	(38, '8ddn16td9'),
	(39, 'kf1w3zi5p'),
	(40, '39'),
	(41, 'qseqf4j2t'),
	(42, 'smuqfh6ws'),
	(43, 'jszx1i4vk'),
	(44, '3sgvtiei8');
/*!40000 ALTER TABLE "carts" ENABLE KEYS */;

-- Dumping structure for table public.cart_items
CREATE TABLE IF NOT EXISTS "cart_items" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''cart_items_id_seq''::regclass)',
	"cart_id" INTEGER NULL DEFAULT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	"colour" VARCHAR NULL DEFAULT NULL,
	"size" VARCHAR NULL DEFAULT NULL,
	"quantity" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_cart_items_carts" FOREIGN KEY ("cart_id") REFERENCES "public"."carts" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_cart_items_products" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.cart_items: 9 rows
/*!40000 ALTER TABLE "cart_items" DISABLE KEYS */;
INSERT INTO "cart_items" ("id", "cart_id", "product_id", "colour", "size", "quantity") VALUES
	(91, 22, 98, 'O', 'XS', 1),
	(92, 22, 24, 'Pink', 'O', 2),
	(94, 23, 26, 'Black', 'O', 1),
	(95, 12, 22, 'Plum', 'M', 1),
	(96, 12, 22, 'Plum', 'XS', 1),
	(29, 16, 98, 'O', 'XS', 1),
	(90, 22, 22, 'Plum', 'XS', 3),
	(93, 22, 33, 'White', 'O', 2),
	(25, 12, 29, 'Yellow Sunshine', 'O', 1),
	(118, 35, 96, 'Yellow', 'XS', 2),
	(119, 35, 96, 'Yellow', 'M', 1),
	(120, 36, 107, 'Green / Blue', 'XS', 1),
	(123, 38, 30, 'Green', 'O', 1),
	(124, 39, 98, 'O', 'XS', 4),
	(126, 40, 24, 'Red', 'O', 0),
	(125, 40, 96, 'Yellow', 'XS', 4),
	(127, 41, 29, 'Deep Sky Blue', 'O', 1),
	(128, 42, 22, 'Black', 'M', 6),
	(129, 16, 24, 'Red', 'O', 0),
	(130, 43, 107, 'Green / Blue', 'XS', 1),
	(132, 43, 30, 'Blue', 'O', 1),
	(131, 44, 96, 'Yellow', 'XS', 1);
/*!40000 ALTER TABLE "cart_items" ENABLE KEYS */;

-- Dumping structure for table public.events
CREATE TABLE IF NOT EXISTS "events" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''events_id_seq''::regclass)',
	"title" VARCHAR NULL DEFAULT NULL,
	"host" INTEGER NOT NULL,
	"description" VARCHAR NULL DEFAULT NULL,
	"status" VARCHAR NOT NULL DEFAULT 'Active',
	"capacity" INTEGER NULL DEFAULT NULL,
	"start_time" TIMESTAMP NULL DEFAULT NULL,
	"end_time" TIMESTAMP NULL DEFAULT NULL,
	"location" VARCHAR NULL DEFAULT NULL,
	"thumbnail" VARCHAR NULL DEFAULT NULL,
	"type" VARCHAR NOT NULL DEFAULT 'Artist Showcase',
	"images" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_events_users" FOREIGN KEY ("host") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.events: 12 rows
/*!40000 ALTER TABLE "events" DISABLE KEYS */;
INSERT INTO "events" ("id", "title", "host", "description", "status", "capacity", "start_time", "end_time", "location", "thumbnail", "type", "images") VALUES
	(101, 'Music Jamboree!', 45, 'Hey everyone let''s get together and jam a few tunes virtually. Join the zoom call at the specified date and grab a refreshment and your instrument of choice to join the fun.', 'Active', 20, '2021-03-01 14:00:00', '2021-03-01 18:00:00', 'ZOOM online', '57906303-7763-4616-8551-8060a0a499a0', 'Meetup', NULL),
	(97, 'Buy Tacos for Nic Day', 44, 'Now is your chance to buy Tacos for Nic, like you have always wanted to. During this exclusive event, you''ll have the chance to purchase and gift unlimited amounts of Frijoles tacos and you will have a whopping 4 hours to do this. You can thank us later.', 'Active', 100, '2021-03-02 18:30:00', '2021-02-23 22:30:00', 'Native Tongues Taqueria', 'c5708fcc-780f-4b0d-a62b-c21b27dca2df', 'Meetup', NULL),
	(102, 'Meet Versa: Danielle', 44, 'Meet the team behind Versa and come see the work we''ve done over the past two months.', 'Active', 100, '2021-02-25 10:15:00', '2021-02-25 10:30:00', 'EvolveU Zoom', '045e807c-1955-494b-a1e4-d498ec1b6e9e', 'Artist showcase', NULL),
	(103, 'Sculpture Exhibition', 39, 'Come see some beautiful sculptures created by Calgary Artists', 'Active', 150, '2021-03-01 15:00:00', '2021-03-01 17:00:00', 'Calgary Public Library - Central Branch', '287d0190-e1a9-4ac4-b835-14725c8e7fe4', 'Exhibition', NULL),
	(73, 'Learn To Paint', 39, 'Beginner class, learn the basics of water-color painting, starter supplies included', 'Active', 18, '2021-02-17 21:00:00', '2021-02-18 02:00:00', '1234 Main St S', '2c4cc663-acef-485d-b0ca-e41b30055cd2', 'Meetup', NULL),
	(95, 'Meet Versa: Muniba', 44, 'Come and watch as the team behind Versa showcases the result of their labour from the past two months.', 'Active', 50, '2021-02-26 07:15:00', '2021-02-26 07:30:00', 'EvolveU Zoom', '63cafc48-5675-4fa7-9412-5404f71dc137', 'Artist showcase', NULL),
	(98, 'Meet Versa: Messele', 44, 'Meet the team behind Versa and take a peek at our labour of love for the last two months. Meeting ID: 939 4397 4743

Passcode: 704333', 'Active', 100, '2021-02-25 17:15:00', '2021-02-25 17:30:00', 'EvolveU Zoom', '2e554c4c-860f-4174-9cdc-f42abf54b7d3', 'Artist showcase', NULL),
	(105, 'Winter Ice Carving Festival', 43, 'Come down to Prince''s Island Park to see some amazing ice sculptures and the artists who made them. There will be live demo''s through out the evening so come down, grab a hot chocolate and get lost in our Winter Wonderland!', 'Active', 500, '2021-04-03 17:00:00', '2021-03-14 01:00:00', 'Prince''s Island Park', '8366b402-c45d-49da-90f0-02837d14a276', 'Exhibition', NULL),
	(99, 'Meet Versa: Nic', 44, 'Meet the team behind Versa and see what we''ve been working hard on these past few months.', 'Active', 100, '2021-02-25 17:15:00', '2021-02-25 17:30:00', 'EvolveU Zoom', '767ff062-978b-436f-b815-fa2e70b9c2c6', 'Artist showcase', NULL),
	(100, 'Craft Night!', 45, 'Let''s all join together over Zoom and work on our projects together. Whether it''s crocheting, knitting, scrapbooking, sewing, creating a costume, painting, drawing... whatever. We''d love to see what you''re working on, or feel free to come join us if you''re interested in learning how to do any of these.', 'Active', 10, '2021-02-27 14:00:00', '2021-02-27 18:00:00', 'Pineridge community association', '7ca975a4-0707-4c18-9135-b89eb6cd78a6', 'Meetup', NULL),
	(106, 'Learn to Draw - Adults', 43, 'Have a fun night learn the fundamentals of drawing while drinking some drinks and enjoying good music!', 'Active', 20, '2021-03-01 17:30:00', '2021-03-01 22:00:00', 'cSPACE King Edward', '36644974-07dc-4daf-b01b-ca78e5c04c32', 'Meetup', NULL),
	(107, 'Teen Art Attack', 43, 'Come show some support to our young Artists! ', 'Active', 30, '2021-04-03 13:30:00', '2021-04-04 18:30:00', 'Workshop Studios', '9cc8685c-7da2-4120-929e-883ef313354f', 'Artist showcase', NULL);
/*!40000 ALTER TABLE "events" ENABLE KEYS */;

-- Dumping structure for table public.events_attendees
CREATE TABLE IF NOT EXISTS "events_attendees" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''events_attendees_id_seq''::regclass)',
	"attendee" INTEGER NULL DEFAULT NULL,
	"event_id" INTEGER NULL DEFAULT NULL,
	"status" VARCHAR NULL DEFAULT NULL,
	"reminder" BOOLEAN NULL DEFAULT NULL,
	"type" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_events_attendees_events" FOREIGN KEY ("event_id") REFERENCES "public"."events" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_events_attendees_users" FOREIGN KEY ("attendee") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.events_attendees: 8 rows
/*!40000 ALTER TABLE "events_attendees" DISABLE KEYS */;
INSERT INTO "events_attendees" ("id", "attendee", "event_id", "status", "reminder", "type") VALUES
	(567, 44, 73, 'attending', 'true', NULL),
	(568, 44, 95, 'attending', 'true', NULL),
	(572, 39, 95, 'attending', 'true', NULL),
	(574, 44, 97, 'attending', 'true', NULL),
	(575, 44, 98, 'attending', 'true', NULL),
	(576, 44, 99, 'attending', 'true', NULL),
	(577, 45, 100, 'attending', 'true', NULL),
	(578, 45, 101, 'attending', 'true', NULL),
	(579, 44, 102, 'attending', 'true', NULL),
	(580, 39, 103, 'attending', 'true', NULL),
	(582, 43, 105, 'attending', 'true', NULL),
	(583, 43, 106, 'attending', 'true', NULL),
	(584, 43, 107, 'attending', 'true', NULL),
	(585, 39, 73, 'attending', 'true', NULL),
	(586, 39, 100, 'attending', 'true', NULL),
	(587, 39, 101, 'attending', 'true', NULL),
	(588, 39, 99, 'attending', 'true', NULL),
	(591, 39, 102, 'attending', 'true', NULL),
	(592, 39, 97, 'attending', 'true', NULL),
	(192, 45, 73, 'attending', 'true', NULL);
/*!40000 ALTER TABLE "events_attendees" ENABLE KEYS */;

-- Dumping structure for table public.event_images
CREATE TABLE IF NOT EXISTS "event_images" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''event_images_id_seq''::regclass)',
	"filename" VARCHAR NULL DEFAULT NULL,
	"label" VARCHAR NULL DEFAULT NULL,
	"img_size" VARCHAR NULL DEFAULT NULL,
	"event_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "event_images_fk" FOREIGN KEY ("event_id") REFERENCES "public"."events" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.event_images: 19 rows
/*!40000 ALTER TABLE "event_images" DISABLE KEYS */;
INSERT INTO "event_images" ("id", "filename", "label", "img_size", "event_id") VALUES
	(9, '2c4cc663-acef-485d-b0ca-e41b30055cd2', 'test', 'thumb', 73),
	(12, 'c5708fcc-780f-4b0d-a62b-c21b27dca2df', 'test', 'thumb', 97),
	(13, '63cafc48-5675-4fa7-9412-5404f71dc137', 'test', 'thumb', 95),
	(15, '767ff062-978b-436f-b815-fa2e70b9c2c6', 'test', 'thumb', 99),
	(16, 'b7856ef5-d7a8-401c-86df-02b05a63a6e5', 'test', 'full', 99),
	(17, '7ca975a4-0707-4c18-9135-b89eb6cd78a6', 'test', 'thumb', 100),
	(18, '01d60a92-01e7-4058-8543-8e2119e87895', 'test', 'thumb', 101),
	(19, '57906303-7763-4616-8551-8060a0a499a0', 'test', 'thumb', 101),
	(20, '1b19e989-33d7-4e05-86f0-414ed6945d69', 'test', 'full', 102),
	(21, '93b1259a-92f0-41a5-9931-f656251713bd', 'test', 'thumb', 102),
	(22, '045e807c-1955-494b-a1e4-d498ec1b6e9e', 'test', 'thumb', 102),
	(23, '287d0190-e1a9-4ac4-b835-14725c8e7fe4', 'test', 'thumb', 103),
	(26, '2977cfbd-cb94-4a84-b3be-92c5817a834c', 'test', 'full', 106),
	(27, '36644974-07dc-4daf-b01b-ca78e5c04c32', 'test', 'thumb', 106),
	(28, 'fae961a2-1690-4c50-b066-44e2bb91e9bb', 'test', 'full', 106),
	(29, '3c59bd5e-035b-4f72-bdee-e4bb217d7577', 'test', 'thumb', 107),
	(30, 'a5a1afed-a4e3-4714-80d9-52c782bf97a3', 'test', 'full', 107),
	(31, '6c85a386-9f07-4e71-b5ab-3c4cf5728a79', 'test', 'full', 107),
	(32, '9cc8685c-7da2-4120-929e-883ef313354f', 'test', 'thumb', 107);
/*!40000 ALTER TABLE "event_images" ENABLE KEYS */;

-- Dumping structure for table public.goals
CREATE TABLE IF NOT EXISTS "goals" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''goals_id_seq''::regclass)',
	"total_sales_daily" NUMERIC NULL DEFAULT NULL,
	"total_sales_weekly" NUMERIC NULL DEFAULT NULL,
	"total_units_daily" NUMERIC NULL DEFAULT NULL,
	"total_units_weekly" NUMERIC NULL DEFAULT NULL,
	"profit_daily" NUMERIC NULL DEFAULT NULL,
	"profit_weekly" NUMERIC NULL DEFAULT NULL,
	"sales_per_order_weekly" NUMERIC NULL DEFAULT NULL,
	"sales_per_order_daily" NUMERIC NULL DEFAULT NULL,
	"artist_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_goals_users" FOREIGN KEY ("artist_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.goals: 0 rows
/*!40000 ALTER TABLE "goals" DISABLE KEYS */;
/*!40000 ALTER TABLE "goals" ENABLE KEYS */;

-- Dumping structure for table public.images
CREATE TABLE IF NOT EXISTS "images" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''images_id_seq''::regclass)',
	"filename" VARCHAR NULL DEFAULT NULL,
	"label" VARCHAR NULL DEFAULT NULL,
	"img_size" VARCHAR NOT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "images_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.images: 80 rows
/*!40000 ALTER TABLE "images" DISABLE KEYS */;
INSERT INTO "images" ("id", "filename", "label", "img_size", "product_id") VALUES
	(51, 'a6b66e97-a6f6-47ab-801e-48615f2a96a3', 'test', 'thumb', 27),
	(52, '814c1612-69ec-4011-9ba8-4fad5f69b6ee', 'test', 'full', 27),
	(49, '3e3e2779-013e-498c-8797-7b5ed83a3684', 'test', 'full', 26),
	(50, 'b6c90b0d-f0e4-4dfd-b1f3-4824cc5f6a7b', 'test', 'full', 26),
	(31, 'a3ed778c-61d2-4b08-a716-69d898bedddf', 'test', 'full', 22),
	(80, 'caf9a13f-4cda-4d90-b02c-3dde7e30e390', 'test', 'full', 34),
	(43, '0e75f194-b8ea-42c2-ba06-14bebd77cd88', 'test', 'full', 24),
	(41, 'f06f0019-3957-4180-8415-6c5de4e00d67', 'test', 'full', 24),
	(44, '4a607e0f-f00f-45ce-ae18-803b2508f20c', 'test', 'full', 24),
	(42, '70d96725-6146-459c-8326-3a2cdbb8d5db', 'test', 'full', 24),
	(39, '16da8d8e-5ce5-4ee8-96ac-aec464d75f36', 'test', 'full', 24),
	(90, '2a4e9251-585f-4866-ae0e-1dd84acd0c40', 'test', 'thumb', 24),
	(64, '6ac3edf5-20e1-4ce2-b44c-094feb1a55fd', 'test', 'full', 30),
	(173, '5b99802c-3b93-4858-a196-fed241afefac', 'test', 'thumb', 102),
	(81, '011bb5b5-7783-4e35-af03-82cd0a45ee81', 'test', 'full', 34),
	(168, '15dae52a-abae-4eb5-854a-2e139034a12f', 'test', 'thumb', 98),
	(34, 'd15ce9b2-2b87-4ac5-b601-73a570f66971', 'test', 'full', 22),
	(35, '105e7b3d-88bb-467f-ab3d-53884f8c11d4', 'test', 'full', 22),
	(94, '4ccdd541-cab8-44ae-abcf-da7e2169d7fa', 'test', 'full', 22),
	(33, 'aa9e4e8f-fbdb-4b50-a7ca-38fec3b0f182', 'test', 'full', 22),
	(169, '5239eb9e-2ca6-439b-acf2-8b331dd608eb', 'test', 'full', 98),
	(170, '842b4e1b-6a19-451c-86ba-1f9097b52791', 'test', 'full', 98),
	(171, '7ea881d9-b3b9-4b7f-8599-ac379492efce', 'test', 'full', 98),
	(84, 'cb98752d-54bb-4a8a-9957-987629aeca52', 'test', 'thumb', 35),
	(85, 'eea00f71-8b0c-4f42-a007-84f266e8fee5', 'test', 'full', 35),
	(86, 'f091b8dc-20cc-4d41-95c6-83c02cf8459a', 'test', 'full', 35),
	(87, '69521444-71c3-4e41-9751-1349800bacee', 'test', 'full', 35),
	(88, '6efd8dee-4c19-4d54-b5c4-19e36a88156e', 'test', 'full', 35),
	(83, '2855a100-e682-428b-8cda-d454ae492a4b', 'test', 'full', 34),
	(82, '7ba5a88f-80c7-48a4-85d1-c88f34f30b10', 'test', 'thumb', 34),
	(102, '6c7f7076-df64-44b1-bcc1-eb02be164834', 'test', 'full', 43),
	(89, '5e462928-67a9-4fa1-83be-c146d4a3f559', 'test', 'full', 35),
	(174, '2c7e7683-84ae-45af-b206-1af42e4d1f75', 'test', 'thumb', 23),
	(45, '2d7c0c81-a80d-4e73-85bd-f994e13497a1', 'test', 'full', 23),
	(59, '1f0e2860-bd44-4536-be16-f66ab27d4498', 'test', 'thumb', 29),
	(60, '108d16eb-9a4c-49e5-87b9-4f9948f459c7', 'test', 'full', 29),
	(104, '929abdfb-bd04-4919-8290-b1f8c49b6588', 'test', 'thumb', 43),
	(103, '3c053336-defe-4f05-b168-d51be730b51c', 'test', 'full', 43),
	(180, '70b6ed94-6b39-4e54-aede-793bec0ffc75', 'test', 'full', 23),
	(79, '316757ba-22ba-4994-8be5-e45bbbd8df8d', 'test', 'full', 33),
	(69, '4be662cd-8247-4224-b33e-ce5b6adaa478', 'test', 'thumb', 31),
	(67, '6cd47e29-5996-4d9a-91a8-b8a6c1cb3918', 'test', 'full', 31),
	(183, '831945d1-c525-4824-b960-f07f3d151d50', 'test', 'thumb', 105),
	(184, 'f660fa28-5835-4901-8b45-c6b522036351', 'test', 'thumb', 106),
	(185, 'f297ff9a-b7d6-430d-9fe2-7433c663c37d', 'test', 'full', 106),
	(186, 'ca7638e9-72c6-4787-915c-dba3ef6482ef', 'test', 'full', 106),
	(187, '327852ce-d68b-4903-a942-ef1ae8d086c4', 'test', 'full', 106),
	(188, 'c59de21c-d60c-4f6c-8724-805cb6f5c268', 'test', 'full', 106),
	(54, '95efd09b-deec-4fd4-8044-38f06f46c0d6', 'test', 'full', 28),
	(96, 'ca05ad2c-1133-4996-a605-2313b39efbdf', 'test', 'full', 22),
	(95, 'ac87108a-ffa6-4406-ba90-8076773f902d', 'test', 'full', 22),
	(189, '08d06def-2253-4669-9a90-3babd54705d1', 'test', 'thumb', 107),
	(190, 'cb77e4db-4d99-4be1-82ad-233200d6eea4', 'test', 'full', 107),
	(191, '4fb41849-aa3a-4bc8-9cf5-2ed0ae6d0a7d', 'test', 'full', 107),
	(192, '10f5853c-5401-4669-a10a-b5f12b81b689', 'test', 'full', 107),
	(193, '85bddd11-50ea-477c-8d92-ef19bf13b9d0', 'test', 'full', 107),
	(36, '042ae634-98eb-499c-8f64-e7825ad0be03', 'test', 'full', 22),
	(70, '362c0a6e-556c-4a5e-abbd-5e7a987c624c', 'test', 'full', 31),
	(118, '6b4f8342-42f1-499b-a908-4fb6df90e42c', 'test', 'thumb', 48),
	(116, '7f08ccdf-c548-4533-b757-e5045bf054f7', 'test', 'full', 48),
	(75, '02a6cfc2-8a97-4c27-8b13-f40c47f555e5', 'test', 'thumb', 33),
	(77, '463e0f80-a8ac-4eb0-b8a1-515ca3df69e9', 'test', 'full', 33),
	(57, 'd19dea3a-6b87-4207-961a-c1f12a194c61', 'test', 'thumb', 28),
	(78, '86c9e3c0-b8e5-461d-b573-d2e635f46704', 'test', 'full', 33),
	(76, '74f36dee-626c-4e1f-a75a-f2476602d27d', 'test', 'full', 33),
	(65, 'a2c5e7e8-d0bb-4ff6-9527-fe9faf02a301', 'test', 'thumb', 30),
	(74, '17e68baf-4444-4df8-9306-9547102f8c90', 'test', 'thumb', 32),
	(73, '09fd68ff-a59d-4665-ad4b-cbe9eacc3700', 'test', 'full', 32),
	(72, 'a8ec83b4-aec4-4dd9-b065-2a11387c22d0', 'test', 'full', 32),
	(71, '42166113-a5d3-4de8-bf09-25ba36f21fc0', 'test', 'full', 32),
	(55, 'b72cb21f-3ad7-4ce8-9ddb-291ff4d1521e', 'test', 'full', 28),
	(56, '8a8eaebd-b95c-457b-9c05-bf72d899ce4f', 'test', 'full', 28),
	(58, 'e04ea8e0-645e-4ae2-a025-43e3ced2ab42', 'test', 'full', 28),
	(53, '46d81e03-6910-49e0-95e3-531e7c930ae7', 'test', 'full', 28),
	(62, 'ce160418-1f04-4993-981d-14804c6856c7', 'test', 'full', 30),
	(61, '8bb6fdbd-96a0-4c92-b55e-37831b35ba1a', 'test', 'full', 30),
	(63, '52fed4b9-3e20-4bf6-8c7b-bafe793ea737', 'test', 'full', 30),
	(32, '554fd7f2-8df8-400f-b06a-de97e0a299da', 'test', 'thumb', 22),
	(159, '6b0dba96-2c18-44ba-b663-2cb02cc80847', 'test', 'thumb', 96),
	(160, 'ca0bfab3-e508-433c-9758-a1884efec3c2', 'test', 'full', 96),
	(161, '7eb263c0-ce44-4d1f-b946-8b21e800d57e', 'test', 'full', 96),
	(162, 'e855e832-277d-49fe-bd05-b0eec8f7781a', 'test', 'full', 96),
	(68, 'c0435454-c1fe-464a-b272-d9913e54f2dd', 'test', 'full', 31),
	(47, '9cc4a59e-f329-492c-be47-90f3a33dd21e', 'test', 'thumb', 25),
	(48, '2b6b55cd-a54d-448e-8390-7430682a8128', 'test', 'full', 25);
/*!40000 ALTER TABLE "images" ENABLE KEYS */;

-- Dumping structure for table public.messages
CREATE TABLE IF NOT EXISTS "messages" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''messages_id_seq''::regclass)',
	"topic" VARCHAR NOT NULL,
	"from_user" INTEGER NOT NULL,
	"to_user" INTEGER NOT NULL,
	"type" VARCHAR NOT NULL,
	"message" VARCHAR NOT NULL,
	"time" TIMESTAMPTZ NOT NULL,
	"read" BOOLEAN NOT NULL DEFAULT 'false',
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_messages_users" FOREIGN KEY ("from_user") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_messages_users_2" FOREIGN KEY ("to_user") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.messages: 49 rows
/*!40000 ALTER TABLE "messages" DISABLE KEYS */;
INSERT INTO "messages" ("id", "topic", "from_user", "to_user", "type", "message", "time", "read") VALUES
	(77, 'Product: Reality Key Keychain', 39, 44, 'B2A', 'Cool!', '2021-02-22 18:54:19.078+00', 'true'),
	(72, 'Product: Contour Key Ring', 39, 43, 'B2A', 'Why did you make this?', '2021-02-22 18:50:11.768+00', 'true'),
	(73, 'Product: Spinning Tops', 39, 45, 'B2A', 'Can you make me a purple one?  Instead of the black?  I don''t mind waiting.', '2021-02-22 18:50:53.923+00', 'true'),
	(115, 'Product: Match Striker', 44, 39, 'B2A', 'hhelloo', '2021-02-24 18:14:21.794+00', 'true'),
	(80, 'Product: Contour Key Ring', 43, 39, 'B2A', 'Because it''s fudging awesome!', '2021-02-23 04:03:33+00', 'true'),
	(83, 'Product: Temple Crewneck Tee', 39, 44, 'B2A', 'Hi brainslush, why is that your name?', '2021-02-23 07:06:38.842+00', 'true'),
	(123, 'Event: Meet the Team: Fellowship of the Stack', 39, 44, 'B2A', 'Hello!', '2021-02-24 19:04:51.305+00', 'true'),
	(75, 'Product: Mirror Mask', 39, 39, 'B2A', 'Freaky, I love it', '2021-02-22 18:51:49.303+00', 'true'),
	(82, 'Product: Contour Key Ring', 39, 43, 'B2A', '', '2021-02-23 07:01:28+00', 'true'),
	(99, 'Product: Contour Key Ring', 43, 39, 'B2A', 'yeah thats what i thought!', '2021-02-23 20:34:22+00', 'true'),
	(101, 'Product: Contour Key Ring', 39, 43, 'B2A', 'hey', '2021-02-23 21:38:37+00', 'true'),
	(74, 'Product: Fans and bands', 39, 43, 'B2A', 'This product just confuses me', '2021-02-22 18:51:19.27+00', 'true'),
	(79, 'Product: Fans and bands', 43, 39, 'B2A', 'thats too bad', '2021-02-23 04:02:53+00', 'true'),
	(140, 'Event: Music Jamboree!', 39, 45, 'B2A', 'Hey I''m looking forward to your event', '2021-02-26 05:17:08.709+00', 'false'),
	(78, 'Product: Duck Eggs', 39, 45, 'B2A', 'When will you have more in stock, please?', '2021-02-22 18:54:50.591+00', 'true'),
	(76, 'Product: Guitar', 39, 45, 'B2A', 'Is this handmade?  Can you carve my grandfather''s name into it?', '2021-02-22 18:52:34.33+00', 'true'),
	(71, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', 'What was the turtle''s name?', '2021-02-22 18:47:34.256+00', 'true'),
	(86, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', 'test', '2021-02-23 09:05:56+00', 'true'),
	(87, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:05:59+00', 'true'),
	(88, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:05:59+00', 'true'),
	(89, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:00+00', 'true'),
	(90, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:05:59+00', 'true'),
	(91, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:00+00', 'true'),
	(92, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:00+00', 'true'),
	(93, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:00+00', 'true'),
	(125, 'Product: Pearl Earrings', 39, 43, 'B2A', 'Beautiful earrings, are they gold plated? 24K Solid gold?', '2021-02-24 19:42:38.064+00', 'true'),
	(127, 'Product: Pearl Earrings', 43, 39, 'B2A', 'Yes, they are harvested and handcrafted right here in Calgary!', '2021-02-24 22:24:28+00', 'true'),
	(129, 'Product: Pearl Earrings', 44, 43, 'B2A', 'I am more interested in the Peas and Bees and Jam event. Can you focus on events instead?', '2021-02-24 22:34:49.333+00', 'true'),
	(136, 'Event: Music Jamboree!', 39, 45, 'B2A', 'Hello!', '2021-02-25 17:21:09.323+00', 'false'),
	(133, 'Product: Mirror Mask', 43, 39, 'B2A', 'What is this mirror made of?
', '2021-02-25 15:46:12.038+00', 'true'),
	(138, 'Product: Mirror Mask', 39, 43, 'B2A', 'lol', '2021-02-26 03:11:31+00', 'false'),
	(105, 'Event: Learn To Paint', 39, 39, 'B2A', 'Send a message', '2021-02-24 17:19:36.231+00', 'true'),
	(121, 'Event: Learn To Paint', 39, 39, 'B2A', 'hello', '2021-02-24 18:42:59.276+00', 'true'),
	(131, 'Event: Learn To Paint', 39, 39, 'B2A', 'Hello', '2021-02-25 01:28:15+00', 'true'),
	(119, 'Order #29', 39, 39, 'A2B', 'hello', '2021-02-24 18:17:44+00', 'true'),
	(94, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:00+00', 'true'),
	(95, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:00+00', 'true'),
	(96, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:01+00', 'true'),
	(97, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:01+00', 'true'),
	(98, 'Product: Reality Box Turtle Box', 39, 39, 'B2A', '', '2021-02-23 09:06:01+00', 'true'),
	(137, 'Product: Mirror Mask', 39, 43, 'B2A', 'Glass', '2021-02-25 17:23:42+00', 'false'),
	(117, 'Product: Match Striker', 39, 44, 'B2A', 'hheeelllooo', '2021-02-24 18:16:20+00', 'true'),
	(126, 'Event: Meet the Team: Fellowship of the Stack', 39, 44, 'B2A', 'Looking forward to seeing what you have done!', '2021-02-24 19:46:14.944+00', 'true'),
	(122, 'Event: Meet the Team: Fellowship of the Stack', 39, 44, 'B2A', 'Hello!', '2021-02-24 19:01:06.179+00', 'true'),
	(110, 'Event: Learn To Paint', 39, 39, 'B2A', 'hi', '2021-02-24 17:53:20+00', 'true'),
	(124, 'Event: Learn To Paint', 39, 39, 'B2A', 'Hello@', '2021-02-24 19:10:15+00', 'true'),
	(130, 'Event: Learn To Paint', 39, 39, 'B2A', 'i Oi', '2021-02-25 01:25:35+00', 'true'),
	(116, 'Order #29', 39, 39, 'A2B', 'message', '2021-02-24 18:15:43+00', 'true'),
	(118, 'Order #29', 39, 39, 'A2B', 'hhheeello', '2021-02-24 18:16:34+00', 'true'),
	(100, 'Product: Reality Key Keychain', 39, 44, 'B2A', 'dddjdjdjdjdjdjddjdjdjdjdjdjdjdjdjdjdj', '2021-02-23 21:11:58+00', 'true'),
	(102, 'Product: Reality Key Keychain', 44, 39, 'B2A', 'I know that you really want to do the victory charts for the overview pages', '2021-02-23 23:07:14+00', 'true'),
	(103, 'Product: Reality Key Keychain', 44, 39, 'B2A', 'you don''t have to ask, its all good', '2021-02-23 23:07:21+00', 'true'),
	(134, 'Order #84', 39, 39, 'A2B', 'Hello!', '2021-02-25 15:48:13+00', 'true'),
	(128, 'Product: Contour Key Ring', 43, 39, 'B2A', 'Hi, That is a great key ring! Love the creativity!', '2021-02-24 22:25:27+00', 'true'),
	(139, 'Product: Contour Key Ring', 39, 43, 'B2A', 'thanks', '2021-02-26 05:14:22+00', 'false'),
	(120, 'Product: Guitar', 43, 45, 'B2A', 'Hey, that is an awesome guitar. Can I have it?', '2021-02-24 18:21:51.329+00', 'true');
/*!40000 ALTER TABLE "messages" ENABLE KEYS */;

-- Dumping structure for table public.newsletter
CREATE TABLE IF NOT EXISTS "newsletter" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''newsletter_id_seq''::regclass)',
	"email" VARCHAR NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.newsletter: 0 rows
/*!40000 ALTER TABLE "newsletter" DISABLE KEYS */;
INSERT INTO "newsletter" ("id", "email") VALUES
	(7, 'caseybarker86@gmail.com');
/*!40000 ALTER TABLE "newsletter" ENABLE KEYS */;

-- Dumping structure for table public.orders
CREATE TABLE IF NOT EXISTS "orders" (
	"buyer_id" INTEGER NULL DEFAULT NULL,
	"date" TIMESTAMP NULL DEFAULT NULL,
	"status" VARCHAR NULL DEFAULT NULL,
	"order_total" NUMERIC NULL DEFAULT NULL,
	"id" INTEGER NOT NULL DEFAULT 'nextval(''orders_id_seq''::regclass)',
	"ship_date" TIMESTAMP NULL DEFAULT NULL,
	"pickup" BOOLEAN NULL DEFAULT NULL,
	"billing_address" VARCHAR NULL DEFAULT NULL,
	"shipping_address" VARCHAR NULL DEFAULT NULL,
	"name" VARCHAR NULL DEFAULT NULL,
	"email" VARCHAR NULL DEFAULT NULL,
	"phone" VARCHAR NULL DEFAULT NULL,
	"delivery_notes" VARCHAR NULL DEFAULT NULL,
	"deliverer_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_orders_users" FOREIGN KEY ("buyer_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_orders_users_2" FOREIGN KEY ("deliverer_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.orders: 43 rows
/*!40000 ALTER TABLE "orders" DISABLE KEYS */;
INSERT INTO "orders" ("buyer_id", "date", "status", "order_total", "id", "ship_date", "pickup", "billing_address", "shipping_address", "name", "email", "phone", "delivery_notes", "deliverer_id") VALUES
	(39, '2021-02-07 09:02:40', 'Delivered', 94.50, 9, '2021-02-24 04:53:53.103', 'false', '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, 39),
	(39, '2021-02-24 17:34:09', 'Unfulfilled', 57.25, 87, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(44, '2021-02-12 06:33:43', 'Ready for Pickup', 210, 54, '2021-02-12 14:26:33.005', 'true', '1111 1 ST SW, Apartment 101 T1S1S1 Calgary, Canada', 'For pickup', 'Kendo M', 'saunic8@gmail.com', NULL, '', NULL),
	(9999, '2021-02-12 08:18:17', 'Delivered', 209.99, 57, '2021-02-24 17:52:23.903', 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', 39),
	(39, '2021-02-24 18:46:12', 'Unfulfilled', 105, 90, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-24 19:43:45', 'Unfulfilled', 6300, 93, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-25 17:22:05', 'Unfulfilled', 126, 96, NULL, 'false', '123 1ST SW T1S1S1 Calgary, Canada', '123 1ST SW T1S1S1 Calgary, Canada', 'Nic S', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-22 18:56:21', 'Driver Assigned', 2801.36, 84, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, 'Please leave order in shed, thanks', 39),
	(39, '2021-02-11 22:04:40', 'Unfulfilled', 112.35, 51, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '800 3 St SE, Calgary, AB T2G 2E7', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-08 09:02:40', 'Unfulfilled', 94.50, 10, NULL, 'false', '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:44:53', 'Unfulfilled', 172.19, 40, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-20 17:49:53', 'Picked Up', 756, 82, '2021-02-23 03:55:25.242', 'false', '10 downing st wr49qg London, United Kingdom', '10 downing st wr49qg London, United Kingdom', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', 39),
	(39, '2021-02-12 08:23:49', 'Driver Assigned', 39.4, 58, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-23 18:22:41', 'Unfulfilled', 141.75, 85, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-15 23:28:11', 'Unfulfilled', 283.5, 76, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(45, '2021-02-16 19:57:36', 'Unfulfilled', 114.99, 78, NULL, 'false', '148 Rundlefield Crescent Northeast T1Y 2V5 Calgary, Canada', '148 Rundlefield Crescent Northeast T1Y 2V5 Calgary, Canada', 'messele ghebreslassie', 'messeleghebreslassie@gmail.com', NULL, 'Please be gentle!', NULL),
	(9999, '2021-02-11 23:47:32', 'Delivery in Progress', 693, 52, '2021-02-20 16:58:29.394', 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '800 3 St SE, Calgary, AB T2G 2E7', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', 44),
	(39, '2021-02-09 18:20:48', 'Unfulfilled', 147, 29, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Danielle Barker', NULL, '(403)260-2600', NULL, 44),
	(43, '2021-02-24 11:23:59', 'Unfulfilled', 194.25, 88, NULL, 'false', '161 Springbluff Blvd SW T3H 5R6 Calgary, Canada', '161 Springbluff Blvd SW T3H 5R6 Calgary, Canada', 'Muniba Waqar', 'muniba_waqar@outlook.com', NULL, '', NULL),
	(39, '2021-02-24 12:02:40', 'Unfulfilled', 73, 91, NULL, 'false', '102-2113 2 ST SW T2S1S7 Calgary, Canada', '102-2113 2 ST SW T2S1S7 Calgary, Canada', 'Nic S', '8.saunia@gmail.com', NULL, '', NULL),
	(39, '2021-02-25 01:26:33', 'Unfulfilled', 31, 94, NULL, 'false', '102-2113 2 ST SW T2S1S7 Calgary, Canada', '102-2113 2 ST SW T2S1S7 Calgary, Canada', 'Nic S', '8.saunia@gmail.com', NULL, '', NULL),
	(39, '2021-02-25 22:11:33', 'Unfulfilled', 47.8, 97, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-22 11:00:51', 'Unfulfilled', 850.5, 83, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(9999, '2021-02-07 23:12:03', 'Picked Up', 63.00, 18, '2021-02-09 16:22:34.48', 'true', '800 3 St SE, Calgary, AB T2G 2E7', 'For pickup', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 16:51:24', 'Unfulfilled', 73.5, 24, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 17:23:36', 'Unfulfilled', 73.5, 26, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 18:12:48', 'Unfulfilled', 147, 27, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 18:16:33', 'Unfulfilled', 147, 28, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 18:22:29', 'Unfulfilled', 147, 30, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-15 23:18:44', 'Processing', 73, 74, NULL, 'false', '1509 118 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 118 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-09 19:04:53', 'Unfulfilled', 172.19, 31, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:13:32', 'Unfulfilled', 172.19, 32, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 17:21:35', 'Picked Up', 73.5, 25, '2021-02-10 00:28:16.039', NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-18 15:37:19', 'Unfulfilled', 341.22, 80, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(44, '2021-02-12 07:47:07', 'Unfulfilled', 210, 55, '2021-02-12 17:04:02.604', 'false', ' 25 Wellington Square T0X0X7 Calgary, Canada', ' 25 Wellington Square T0X0X7 Calgary, Canada', 'James Bond', 'saunic8@gmail.com', NULL, '', 44),
	(44, '2021-02-12 01:51:36', 'Delivered', 136.49, 53, '2021-02-25 17:24:44.893', 'false', '1 1 ST SW, Apartment 102 T1S1S1 Calgary, Canada', '1 1 ST SW, Apartment 102 T1S1S1 Calgary, Canada', 'Nicholai S', 'saunic8@gmail.com', NULL, 'Please gift wrap skateboard to look like a bike.', 39),
	(39, '2021-02-25 15:46:34', 'Driver Assigned', 195.3, 95, NULL, 'false', '123 1ST SW T1S1S1 Calgary, Canada', '123 1ST SW T1S1S1 Calgary, Canada', 'Nic S', 'caseybarker86@gmail.com', NULL, '', 39),
	(45, '2021-02-16 20:01:25', 'Driver Assigned', 105, 79, NULL, 'false', '148 Rundlefield Crescent Northeast T1Y 2V5 Calgary, Canada', '148 Rundlefield Crescent Northeast T1Y 2V5 Calgary, Canada', 'messele ghebreslassie', 'messeleghebreslassie@gmail.com', NULL, '', 44),
	(44, '2021-02-12 08:12:24', 'Driver Assigned', 112.35, 56, '2021-02-23 12:41:12.476', 'false', '123 Carenden Road 1X1X1 Calgary, Canada', '123 Carenden Road 1X1X1 Calgary, Canada', 'The IT Crowd', 'saunic8@gmail.com', NULL, '', 44),
	(39, '2021-02-15 23:25:01', 'Delivered', 1039.5, 75, '2021-02-22 16:22:11.171', 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', 39),
	(39, '2021-02-24 04:09:01', 'Driver Assigned', 126, 86, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', 44),
	(39, '2021-02-18 15:41:13', 'Unfulfilled', 176.4, 81, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-09 19:15:33', 'Unfulfilled', 172.19, 33, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-15 23:12:30', 'Unfulfilled', 73, 73, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(9999, '2021-02-16 16:33:10', 'Unfulfilled', 7.35, 77, NULL, 'true', '40 Scarpe Drive SW T2T6K8 Calgary, Canada', 'For pickup', 'Tony Enerson', 'tony@ducklabs.ca', NULL, '', NULL),
	(39, '2021-02-09 10:11:26', 'Unfulfilled', 73.5, 22, NULL, 'true', '800 3 St SE, Calgary, AB T2G 2E7', 'For pickup', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 10:13:27', 'Picked Up', 73.5, 23, '2021-02-09 22:44:13.395', 'true', '800 3 St SE, Calgary, AB T2G 2E7', 'For pickup', 'Satoshi Nakamoto', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:22:06', 'Unfulfilled', 172.19, 34, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:24:07', 'Unfulfilled', 172.19, 35, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:25:15', 'Unfulfilled', 172.19, 36, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:27:21', 'Unfulfilled', 172.19, 37, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:29:22', 'Unfulfilled', 172.19, 38, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-09 19:42:52', 'Unfulfilled', 172.19, 39, NULL, NULL, '800 3 St SE, Calgary, AB T2G 2E7', '800 3 St SE, Calgary, AB T2G 2E7', 'Vitalik Buterin', NULL, '(403)260-2600', NULL, NULL),
	(39, '2021-02-11 09:20:08', 'Unfulfilled', 129.15, 50, NULL, 'true', '148 Rundlefield Crescent Northeast T1Y 2V5 Calgary, Canada', 'For pickup', 'messele ghebreslassie', 'messeleghebreslassie@gmail.com', NULL, '', NULL),
	(39, '2021-02-24 18:44:17', 'Unfulfilled', 136.5, 89, NULL, 'false', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', '1509 18 Ave NW, basement T2M 0W9 Calgary, Canada', 'Danielle Barker', 'caseybarker86@gmail.com', NULL, '', NULL),
	(39, '2021-02-24 19:07:14', 'Unfulfilled', 73, 92, NULL, 'false', '102-2113 2 ST SW T2S1S7 Calgary, Canada', '102-2113 2 ST SW T2S1S7 Calgary, Canada', 'Nic S', '8.saunia@gmail.com', NULL, '', NULL);
/*!40000 ALTER TABLE "orders" ENABLE KEYS */;

-- Dumping structure for table public.order_items
CREATE TABLE IF NOT EXISTS "order_items" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''order_items_id_seq''::regclass)',
	"order_id" INTEGER NULL DEFAULT NULL,
	"product_id" INTEGER NULL DEFAULT NULL,
	"quantity" INTEGER NULL DEFAULT NULL,
	"color" VARCHAR NULL DEFAULT NULL,
	"size" VARCHAR NULL DEFAULT NULL,
	"artist_status" VARCHAR NULL DEFAULT NULL,
	"driver_status" VARCHAR NULL DEFAULT NULL,
	"artist_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_order_items_orders" FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_order_items_products" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.order_items: 133 rows
/*!40000 ALTER TABLE "order_items" DISABLE KEYS */;
INSERT INTO "order_items" ("id", "order_id", "product_id", "quantity", "color", "size", "artist_status", "driver_status", "artist_id") VALUES
	(185, 85, 22, 5, 'Plum', 'XS', NULL, NULL, NULL),
	(13, 9, 26, 1, 'Black', 'O', NULL, 'Picked', NULL),
	(88, 56, 98, 1, 'O', 'XL', NULL, 'Picked', NULL),
	(122, 75, 26, 33, 'Black', 'O', NULL, 'Picked', NULL),
	(90, 57, 98, 1, 'O', 'XS', NULL, 'Picked', NULL),
	(133, 83, 98, 1, 'O', 'M', NULL, NULL, NULL),
	(134, 83, 98, 1, 'O', 'L', NULL, NULL, NULL),
	(135, 83, 98, 1, 'O', 'XL', NULL, NULL, NULL),
	(136, 83, 98, 1, 'O', 'XS', NULL, NULL, NULL),
	(137, 83, 96, 1, 'Yellow', 'M', NULL, NULL, NULL),
	(138, 83, 96, 1, 'Yellow', 'XS', NULL, NULL, NULL),
	(139, 83, 106, 1, 'O', 'XS', NULL, NULL, NULL),
	(140, 83, 106, 1, 'O', 'S', NULL, NULL, NULL),
	(141, 83, 107, 2, 'Green / Blue', 'XS', NULL, NULL, NULL),
	(142, 83, 107, 1, 'Green / Blue', 'S', NULL, NULL, NULL),
	(143, 83, 107, 1, 'Green / Blue', 'L', NULL, NULL, NULL),
	(144, 83, 107, 1, 'Green / Blue', 'XL', NULL, NULL, NULL),
	(14, 10, 26, 1, 'Black', 'O', NULL, NULL, NULL),
	(15, 10, 23, 1, 'Red', 'O', NULL, NULL, NULL),
	(28, 18, 23, 2, 'Red', 'O', NULL, NULL, NULL),
	(34, 22, 27, 1, 'Black', 'O', NULL, NULL, NULL),
	(35, 23, 27, 1, 'Black', 'O', NULL, NULL, NULL),
	(36, 24, 27, 1, 'White', 'O', NULL, NULL, NULL),
	(37, 25, 29, 1, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(38, 26, 29, 1, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(39, 27, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(40, 28, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(41, 29, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(42, 30, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(43, 31, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(44, 31, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(45, 32, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(46, 32, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(47, 33, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(48, 33, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(49, 34, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(50, 34, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(51, 35, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(52, 35, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(53, 36, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(54, 36, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(55, 37, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(56, 37, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(57, 38, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(58, 38, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(59, 39, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(60, 39, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(61, 40, 29, 2, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(62, 40, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(72, 50, 22, 1, 'Plum', 'XS', NULL, NULL, NULL),
	(73, 51, 22, 1, 'Plum', 'XS', NULL, NULL, NULL),
	(74, 51, 22, 2, 'Plum', 'XL', NULL, NULL, NULL),
	(75, 51, 22, 2, 'Plum', 'L', NULL, NULL, NULL),
	(83, 54, 98, 1, 'O', 'XS', NULL, NULL, NULL),
	(84, 54, 98, 1, 'O', 'M', NULL, NULL, NULL),
	(85, 55, 98, 1, 'O', 'L', NULL, NULL, NULL),
	(86, 55, 98, 1, 'O', 'XL', NULL, NULL, NULL),
	(91, 58, 27, 1, 'Black', 'O', NULL, NULL, NULL),
	(92, 58, 27, 1, 'Mint', 'O', NULL, NULL, NULL),
	(93, 58, 27, 1, 'Pink', 'O', NULL, NULL, NULL),
	(94, 58, 27, 1, 'White', 'O', NULL, NULL, NULL),
	(120, 73, 26, 2, 'Black', 'O', NULL, NULL, NULL),
	(121, 74, 26, 2, 'Black', 'O', NULL, NULL, NULL),
	(123, 76, 26, 9, 'Black', 'O', NULL, NULL, NULL),
	(124, 77, 29, 1, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(126, 79, 98, 1, 'O', 'XS', NULL, NULL, NULL),
	(127, 80, 43, 1, 'Purple', 'XS', NULL, NULL, NULL),
	(128, 80, 43, 1, 'Purple', 'S', NULL, NULL, NULL),
	(129, 80, 29, 34, 'Yellow Sunshine', 'O', NULL, NULL, NULL),
	(130, 80, 43, 1, 'Purple', 'L', NULL, NULL, NULL),
	(131, 81, 35, 6, 'Natural', 'O', NULL, NULL, NULL),
	(77, 52, 96, 1, 'Yellow', 'L', NULL, 'Picked', NULL),
	(76, 52, 96, 7, 'Yellow', 'XL', NULL, 'Picked', NULL),
	(78, 52, 96, 1, 'Yellow', 'M', NULL, 'Picked', NULL),
	(80, 52, 96, 1, 'Yellow', 'XS', NULL, 'Picked', NULL),
	(79, 52, 96, 1, 'Yellow', 'S', NULL, 'Picked', NULL),
	(12, 9, 23, 1, 'Red', 'O', NULL, 'Picked', NULL),
	(132, 82, 23, 12, 'Red', 'O', NULL, 'Picked', NULL),
	(87, 56, 29, 1, 'Yellow Sunshine', 'O', NULL, 'Picked', NULL),
	(186, 85, 96, 1, 'Yellow', 'XS', NULL, NULL, NULL),
	(148, 84, 32, 1, 'Blue', 'O', NULL, 'Picked', NULL),
	(149, 84, 32, 1, 'Green', 'O', NULL, 'Picked', NULL),
	(155, 84, 23, 1, 'Green', 'O', NULL, 'Picked', NULL),
	(147, 84, 32, 1, 'Orange', 'O', NULL, 'Picked', NULL),
	(146, 84, 33, 1, 'Gold', 'O', NULL, 'Picked', NULL),
	(145, 84, 30, 1, 'Blue', 'O', NULL, 'Picked', NULL),
	(163, 84, 33, 1, 'White', 'O', NULL, 'Picked', NULL),
	(162, 84, 30, 1, 'Green', 'O', NULL, 'Picked', NULL),
	(189, 88, 22, 1, 'Plum', 'XS', NULL, NULL, NULL),
	(187, 86, 26, 4, 'Black', 'O', NULL, 'Picked', NULL),
	(188, 87, 22, 3, 'Burnt Toffee', 'XS', NULL, NULL, NULL),
	(190, 88, 96, 1, 'Yellow', 'XS', NULL, NULL, NULL),
	(184, 84, 24, 7, 'Pink', 'O', NULL, 'Picked', NULL),
	(191, 88, 105, 1, 'black', 'S', NULL, NULL, NULL),
	(192, 89, 98, 1, 'O', 'XS', NULL, NULL, NULL),
	(193, 89, 26, 1, 'Black', 'O', NULL, NULL, NULL),
	(194, 90, 98, 1, 'O', 'XS', NULL, NULL, NULL),
	(150, 84, 32, 1, 'Yellow', 'O', NULL, 'Picked', NULL),
	(156, 84, 27, 1, 'Mint', 'O', NULL, 'Picked', NULL),
	(157, 84, 27, 1, 'Pink', 'O', NULL, 'Picked', NULL),
	(158, 84, 27, 1, 'White', 'O', NULL, 'Picked', NULL),
	(167, 84, 35, 1, 'Black', 'O', NULL, 'Picked', NULL),
	(170, 84, 43, 1, 'Red', 'XS', NULL, 'Picked', NULL),
	(169, 84, 35, 1, 'Yellow', 'O', NULL, 'Picked', NULL),
	(168, 84, 35, 1, 'Blue', 'O', NULL, 'Picked', NULL),
	(174, 84, 43, 1, 'Black', 'S', NULL, 'Picked', NULL),
	(175, 84, 43, 1, 'Red', 'L', NULL, 'Picked', NULL),
	(177, 84, 105, 1, 'black', 'S', NULL, 'Picked', NULL),
	(179, 84, 105, 1, 'red', 'M', NULL, 'Picked', NULL),
	(178, 84, 105, 1, 'black', 'M', NULL, 'Picked', NULL),
	(81, 53, 26, 1, 'Black', 'O', NULL, 'Picked', NULL),
	(164, 84, 34, 2, 'Black', 'O', NULL, 'Picked', NULL),
	(166, 84, 34, 1, 'Peach', 'O', NULL, 'Picked', NULL),
	(160, 84, 25, 1, 'O', 'L', NULL, 'Picked', NULL),
	(161, 84, 25, 1, 'O', 'S', NULL, 'Picked', NULL),
	(172, 84, 31, 1, 'O', 'L', NULL, 'Picked', NULL),
	(180, 84, 23, 1, 'Red', 'O', NULL, 'Picked', NULL),
	(181, 84, 28, 1, 'Red', 'O', NULL, 'Picked', NULL),
	(182, 84, 28, 1, 'Pink', 'O', NULL, 'Picked', NULL),
	(183, 84, 28, 1, 'Yellow', 'O', NULL, 'Picked', NULL),
	(159, 84, 102, 3, 'O', 'O', NULL, 'Picked', NULL),
	(154, 84, 23, 1, 'Blue', 'O', NULL, NULL, NULL),
	(151, 84, 32, 1, 'Black', 'O', NULL, 'Picked', NULL),
	(195, 91, 96, 1, 'Yellow', 'M', NULL, NULL, NULL),
	(196, 92, 96, 1, 'Yellow', 'L', NULL, NULL, NULL),
	(152, 84, 23, 1, 'Yellow', 'O', NULL, 'Picked', NULL),
	(197, 93, 102, 20, 'O', 'O', NULL, NULL, NULL),
	(198, 94, 106, 1, 'O', 'XS', NULL, NULL, NULL),
	(171, 84, 27, 1, 'Black', 'O', NULL, 'Picked', NULL),
	(176, 84, 43, 1, 'Purple', 'XS', NULL, 'Picked', NULL),
	(165, 84, 34, 1, 'Blue', 'O', NULL, 'Picked', NULL),
	(173, 84, 31, 1, 'O', 'S', NULL, 'Picked', NULL),
	(153, 84, 23, 1, 'Yellow', 'XS', NULL, 'Picked', NULL),
	(204, 95, 96, 1, 'Yellow', 'M', NULL, NULL, NULL),
	(205, 96, 96, 1, 'Yellow', 'XS', NULL, NULL, NULL),
	(206, 96, 96, 1, 'Yellow', 'L', NULL, NULL, NULL),
	(207, 97, 22, 1, 'Plum', 'L', NULL, NULL, NULL),
	(208, 97, 22, 1, 'Burnt Toffee', 'M', NULL, NULL, NULL),
	(202, 95, 33, 1, 'White', 'O', NULL, 'Picked', NULL),
	(201, 95, 29, 1, 'Yellow Sunshine', 'O', NULL, 'Picked', NULL),
	(200, 95, 29, 1, 'Crimson', 'O', NULL, 'Picked', NULL),
	(199, 95, 29, 1, 'Deep Sky Blue', 'O', NULL, 'Picked', NULL),
	(203, 95, 26, 2, 'Black', 'O', NULL, 'Picked', NULL);
/*!40000 ALTER TABLE "order_items" ENABLE KEYS */;

-- Dumping structure for table public.practice
CREATE TABLE IF NOT EXISTS "practice" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''practice_id_seq''::regclass)',
	"nothing" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.practice: 0 rows
/*!40000 ALTER TABLE "practice" DISABLE KEYS */;
/*!40000 ALTER TABLE "practice" ENABLE KEYS */;

-- Dumping structure for table public.preferences
CREATE TABLE IF NOT EXISTS "preferences" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''preferences_id_seq''::regclass)',
	PRIMARY KEY ("id")
);

-- Dumping data for table public.preferences: 0 rows
/*!40000 ALTER TABLE "preferences" DISABLE KEYS */;
/*!40000 ALTER TABLE "preferences" ENABLE KEYS */;

-- Dumping structure for table public.products
CREATE TABLE IF NOT EXISTS "products" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''products_id_seq''::regclass)',
	"title" VARCHAR NOT NULL,
	"artist_id" INTEGER NULL DEFAULT NULL,
	"price" NUMERIC NOT NULL,
	"description" VARCHAR NOT NULL,
	"image" VARCHAR NULL DEFAULT NULL,
	"thumbnail" VARCHAR NULL DEFAULT NULL,
	"num_sales" INTEGER NULL DEFAULT NULL,
	"num_stars" NUMERIC NULL DEFAULT NULL,
	"num_reviews" INTEGER NULL DEFAULT NULL,
	"size_and_fit" VARCHAR NULL DEFAULT NULL,
	"materials" VARCHAR NULL DEFAULT NULL,
	"status" VARCHAR NULL DEFAULT 'Active',
	"sizes" JSON NULL DEFAULT NULL,
	"colours" JSON NULL DEFAULT NULL,
	"variations" JSON NULL DEFAULT NULL,
	"cost" NUMERIC NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_products_users" FOREIGN KEY ("artist_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.products: 22 rows
/*!40000 ALTER TABLE "products" DISABLE KEYS */;
INSERT INTO "products" ("id", "title", "artist_id", "price", "description", "image", "thumbnail", "num_sales", "num_stars", "num_reviews", "size_and_fit", "materials", "status", "sizes", "colours", "variations", "cost") VALUES
	(23, 'Reference Bookend', 43, 60, 'A metal bookend for keeping the heaviest books in place. The Reference Bookend is designed to be sturdy when in use and uses a rubber grip to keep your collection upright. Available in four colors. Includes one bookend. 

the perfect bookend for oversized books and vinyl records 
mix and match colors
long bottom flange prevents tipping; top flange acts as a handle for easy placement 
powder-coated metal with a rubber grip that stays in place and protects your surfaces
sold individually
', NULL, '2c7e7683-84ae-45af-b206-1af42e4d1f75', NULL, 5, NULL, NULL, 'Powder coated iron, rubber', 'Backorder', '[{"label":"O","price":"0"},{"label":"XS","price":"5"}]', '[{"label":"Red","value":"#ff0000"},{"label":"Yellow","value":"#ffee00"},{"label":"Blue","value":"#0400ff"},{"label":"Green","value":"#2bff00"}]', NULL, 15.08),
	(102, 'Pearl Earrings', 43, 300, 'Handmade pearl earrings', NULL, '5b99802c-3b93-4858-a196-fed241afefac', NULL, 5, NULL, NULL, 'fans with bands', 'Active', '[{"label":"O","price":0}]', '[{"label":"O","value":"#44444455"}]', NULL, NULL),
	(105, 'Guitar', 45, 100, 'A classic guitar', NULL, '831945d1-c525-4824-b960-f07f3d151d50', NULL, 5, NULL, NULL, 'Made of wood', 'Active', '[{"label":"S","price":"10.0","cost":"25.0"},{"label":"M","price":"20","cost":"35.0"}]', '[{"label":"black","value":"#000000"},{"label":"red","value":"#ff0000"}]', NULL, NULL),
	(34, 'Mirror Mask', 39, 80, 'Mirrors making the Yes, No, Maybe face', NULL, '7ba5a88f-80c7-48a4-85d1-c88f34f30b10', NULL, 5, NULL, NULL, 'Glass crystal', NULL, '[{"label":"XS","price":"","cost":"12"},{"label":"L","price":"10","cost":"15"}]', '[{"label":"Black","value":"#000000"},{"label":"Blue","value":"#6b84ff"},{"label":"Peach","value":"#eeba72"}]', NULL, 19.45),
	(35, 'Spinning Tops', 45, 28, 'Designer Pat Kim creates lathe-turned wooden tops from leftover material and uses them for unconventional swatches - a unique and playful way to envision finishes for future products. This set of five tops is a fun reflection of Kim''s broader studio practice, which focuses on material experimentation and traditional craft. Keep them spinning and admire them resting nearby.', NULL, 'cb98752d-54bb-4a8a-9957-987629aeca52', NULL, 5, NULL, NULL, 'Beech wood', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Natural","value":"#eea872"},{"label":"Black","value":"#000000"},{"label":"Blue","value":"#002ac2"},{"label":"Yellow","value":"#ff9500"},{"label":"White","value":"#ffffff"}]', NULL, 7.26),
	(106, 'Temple Crewneck Tee', 44, 20, 'Crewneck t-shirt with mystic front and back graphics. Gorgeous and nice. ', NULL, 'f660fa28-5835-4901-8b45-c6b522036351', NULL, NULL, NULL, NULL, '100% cotton.', 'Active', '[{"label":"XS","price":"","cost":"12"},{"label":"S","price":"","cost":"12"},{"label":"M","price":"","cost":"12"},{"label":"L","price":"","cost":"12"},{"label":"XL","price":"","cost":"12"}]', '[{"label":"O","value":"#44444455"}]', NULL, NULL),
	(32, 'Horseshoe Magnet', 39, 14, 'The horseshoe is a symbol of good fortune and fertility. As a magnet, it is especially powerful, having twice the lifting strength of a bar magnet. Horseshoe Magnet is strong enough to hold your dish towel, office papers, shopping list or family photo.', NULL, '17e68baf-4444-4df8-9306-9547102f8c90', NULL, 5, NULL, NULL, 'Beech, magnet', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Orange","value":"#ff9500"},{"label":"Blue","value":"#3c49fb"},{"label":"Green","value":"#57ff78"},{"label":"Yellow","value":"#ffd500"},{"label":"Black","value":"#000000"}]', NULL, 4.04),
	(31, 'Contour Key Ring', 43, 16, 'The Contour Key Ring is a shaped brass keyring that closes and opens neatly with a screw clasp. Our extra-large version can function as an oversized key chain and is large enough to hold other miscellaneous items. Hang it on a wall, wear it around your wrist, or clip it to your belt.', NULL, '4be662cd-8247-4224-b33e-ce5b6adaa478', NULL, 5, NULL, NULL, 'Brass metal', NULL, '[{"label":"S","price":"0"},{"label":"L","price":"10"}]', '[{"label":"O","value":"#444"}]', NULL, 4.3),
	(107, 'Stock Camo Sweatpants', 44, 50, 'Elastic waist sweatpants. Custom Stock Camo print. Contrast binding seams and exposed custom drawstring around waist. Ideal for legs. Embroidery on front and back of hip.', NULL, '08d06def-2253-4669-9a90-3babd54705d1', NULL, NULL, NULL, NULL, '100% polyester', 'Active', '[{"label":"XS","price":"","cost":"30"},{"label":"S","price":"","cost":"30"},{"label":"M","price":"","cost":"30"},{"label":"L","price":"","cost":"30"},{"label":"XL","price":"","cost":"30"}]', '[{"label":"Green / Blue","value":"#11ff00"}]', NULL, NULL),
	(27, 'Drink Rocks', 45, 7, 'Drink Rocks keep your spirits as they should be: undiluted. These platonically shaped stones are designed to be chilled in your freezer before being admired in your evening cocktail. Our Drink Rocks are made with natural materials and are finished by hand. The finishing process affords each piece with unique characteristics which may vary from product to product.

three dimensional
platonically frozen forms
cocktail companion

Cleaning Tips: To preserve the natural stone texture, do not use abrasive cleaners. Soak the Drink Rocks in warm water for a few hours. Be sure the stones are covered by at least a couple of inches, so that there''s plenty of volume to absorb unwanted flavors. When you place them back in the freezer, be sure they are dry (any surface moisture will more readily absorb flavors) and keep them in a sealed bag or container.', NULL, 'a6b66e97-a6f6-47ab-801e-48615f2a96a3', NULL, 5, NULL, NULL, 'Soapstone, marble', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Black","value":"#000000"},{"label":"Mint","value":"#b8fff1"},{"label":"Pink","value":"#dcb7b7"},{"label":"White","value":"#ffffff"}]', NULL, 1.98),
	(24, 'Reality Key Keychain', 44, 15, 'Our Reality series by Harry Allen is inspired by the beauty of everyday objects. By casting natural forms, Allen thoughtfully reimagines objects and gives them new uses. Each object is chosen with care and often a comic sensibility. Here, an 18th-century Italian church-key is cast to become an oversized silicone keychain. Includes stainless steel ring to hold your keys.', NULL, '2a4e9251-585f-4866-ae0e-1dd84acd0c40', NULL, 5, NULL, NULL, 'Silicone, stainless steel', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Red","value":"#ff3333"},{"label":"Pink","value":"#ff7ace"},{"label":"Orange","value":"#ff9747"},{"label":"Cobalt","value":"#4f4dff"},{"label":"Teal","value":"#01c695"},{"label":"Yellow","value":"#f2ff00"}]', NULL, 3.88),
	(25, 'Plant Pedestals', 43, 60, 'Our Plant Pedestals are made from three pieces of beech wood that fit together with seamless lap joinery. Their simplicity is a perfect way to show off arrangements both high and low. Use them to display plants, candles, seashells, flowers, hors d’oeuvres, and all your fine or humble wares.', NULL, '9cc4a59e-f329-492c-be47-90f3a33dd21e', NULL, 5, NULL, NULL, 'Beech wood', NULL, '[{"label":"S","price":"0"},{"label":"L","price":"20"}]', '[{"label":"O","value":"#444"}]', NULL, 14.67),
	(96, 'Stacks Sweatshirt', 44, 60, 'Crewneck sweatshirt. Large chenille patch on chest and embroidery on back. Contrast flap pocket on wrist to hold things. Dropped shoulder', NULL, '6b0dba96-2c18-44ba-b663-2cb02cc80847', NULL, 5, NULL, NULL, '100% cotton', 'Active', '[{"label":"XS","price":""},{"label":"S","price":""},{"label":"M","price":""},{"label":"L","price":""},{"label":"XL","price":""}]', '[{"label":"Yellow","value":"#ffdd00"}]', NULL, NULL),
	(48, 'Duck Eggs', 45, 2, 'All duck, all the time', NULL, '6b4f8342-42f1-499b-a908-4fb6df90e42c', NULL, 5, NULL, NULL, 'Duck, duck and Duck!', 'Discontinue', '[{"label":"1","price":"0"},{"label":"6","price":"10"},{"label":"12","price":"14"},{"label":"36","price":"60"}]', '[{"label":"Red","value":"#db3333"}]', NULL, 0.41),
	(30, 'Goober Candle', 39, 24, 'The Goober Candle is cast in unscented paraffin wax from playful forms originally created by Talbot & Yoon in their Brooklyn studio. Each Goober has a distinctive shape and character. Approximate burn time is 40 hours. Do not leave burning candle unattended.

curious and kind
laze about, hazy glowing
laid back little blob', NULL, 'a2c5e7e8-d0bb-4ff6-9527-fe9faf02a301', NULL, 5, NULL, NULL, '100% Paraffin wax', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Blue","value":"#add1ff"},{"label":"Purple","value":"#d2c2ff"},{"label":"Green","value":"#a3ffc8"},{"label":"Pink","value":"#ffc2d1"}]', NULL, 6.31),
	(28, '500 Piece Gradient Puzzle', 43, 25, 'Our Gradient Puzzle is a vibrant way to meditate on color. The act of putting it together is slow and deliberate, where the color of each piece is used to locate its proper position. We’ve used a thick stock and high-quality art paper, so the puzzle can be assembled again and again without losing its edge.', NULL, 'd19dea3a-6b87-4207-961a-c1f12a194c61', NULL, 5, NULL, NULL, 'glossy art paper over 2mm chipboard', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Red","value":"#e33131"},{"label":"Pink","value":"#fd5ddb"},{"label":"Blue","value":"#3633ff"},{"label":"Yellow","value":"#ffc800"}]', NULL, 6.24),
	(22, 'Totem Candle', 44, 12, 'The Totem Candle is cast in unscented paraffin wax from forms originally created by turning beeswax on a lathe. Each candle is like a small sculpture, elevating it from an everyday pillar candle into a special object. Approximate burn time is 15/25/35 hours depending on the size of the candle. Do not leave burning candle unattended. Small: 4" x 2" x 2”
Medium: 6" x 2" x 2”
Large: 9" x 2" x 2”', NULL, '554fd7f2-8df8-400f-b06a-de97e0a299da', NULL, 5, NULL, NULL, '100% Paraffin wax', 'Active', '[{"label":"XS","price":"3"},{"label":"S","price":"0"},{"label":"M","price":"4"},{"label":"L","price":"8"},{"label":"XL","price":"14"}]', '[{"label":"Plum","value":"#941465"},{"label":"Black","value":"#000000"},{"label":"Cream","value":"#fffaf0"},{"label":"Burnt Toffee","value":"#a27d3f"},{"label":"Dark Grey","value":"#2a2727"},{"label":"Forest","value":"#0a7530"}]', NULL, 3.59),
	(43, 'Be Kind Shirt', 45, 23.99, 'Casual shirt with "Be Kind" logo', NULL, '929abdfb-bd04-4919-8290-b1f8c49b6588', NULL, 5, NULL, NULL, 'Cotton, Polyester', 'Active', '[{"label":"XS","price":"0"},{"label":"S","price":"5"},{"label":"L","price":"10"}]', '[{"label":"Purple","value":"#3d0c45"},{"label":"Red","value":"#e21212"},{"label":"Black","value":"#000000"}]', NULL, 4.99),
	(29, 'Doodle Crayon', 39, 7, 'Doodle Crayons ask you to consider how you make art, rather than what you make. Move them this way and that, pull them along on their sides, or push them around flat. Doodle and scribble mindfully or mindlessly to create your own messy musings.', NULL, '1f0e2860-bd44-4536-be16-f66ab27d4498', NULL, 5, NULL, NULL, 'Paraffin wax, color pigment', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Yellow Sunshine","value":"#f2f604"},{"label":"Deep Sky Blue","value":"#2489f5"},{"label":"Crimson","value":"#ff1f1f"}]', NULL, 1.65),
	(26, 'Match Striker', 39, 30, 'A simple vessel for holding a handful of STRIKE-ANYWHERE wooden matches, which will ignite when struck against the surface. Place used matches in the dish to cool. Match markings can be removed with a touch of olive oil.', NULL, 'b6c90b0d-f0e4-4dfd-b1f3-4824cc5f6a7b', NULL, 5, NULL, NULL, 'Cast iron metal', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"Black","value":"#000000"}]', NULL, 6.45),
	(98, 'Family Reunion Knit Sweater', 44, 100, 'Birdseye jacquard knit crewneck sweater. Graphic artwork everywhere. There’s so much. ', NULL, '15dae52a-abae-4eb5-854a-2e139034a12f', NULL, 5, NULL, NULL, '100% cotton yarn made in Italy. ', 'Active', '[{"label":"XS","price":""},{"label":"S","price":""},{"label":"M","price":""},{"label":"L","price":""},{"label":"XL","price":""}]', '[{"label":"O","value":"#44444455"}]', NULL, NULL),
	(33, 'Reality Box Turtle Box', 39, 45, 'Our Reality series by Harry Allen is inspired by the beauty of everyday objects. By casting natural forms, Allen thoughtfully reimagines objects and gives them new uses. Each object is chosen with care and often a comic sensibility. The Box Turtle Box was cast from a turtle that died of natural causes. Its shell opens to reveal a secret compartment for storing small objects. ', NULL, '02a6cfc2-8a97-4c27-8b13-f40c47f555e5', NULL, 5, NULL, NULL, 'Marble, resin', 'Active', '[{"label":"O","price":"0"}]', '[{"label":"White","value":"#ffffff"},{"label":"Gold","value":"#e0b000"}]', NULL, 10.81);
/*!40000 ALTER TABLE "products" ENABLE KEYS */;

-- Dumping structure for table public.product_by_category
CREATE TABLE IF NOT EXISTS "product_by_category" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''product_by_category_id_seq''::regclass)',
	"product_id" INTEGER NULL DEFAULT NULL,
	"category_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_product_by_category_product_categories" FOREIGN KEY ("category_id") REFERENCES "public"."product_categories" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_product_by_category_products" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.product_by_category: 0 rows
/*!40000 ALTER TABLE "product_by_category" DISABLE KEYS */;
/*!40000 ALTER TABLE "product_by_category" ENABLE KEYS */;

-- Dumping structure for table public.product_categories
CREATE TABLE IF NOT EXISTS "product_categories" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''product_categories_id_seq''::regclass)',
	"category" VARCHAR NULL DEFAULT NULL,
	"parent_category" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_product_categories_product_categories" FOREIGN KEY ("parent_category") REFERENCES "public"."product_categories" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.product_categories: 0 rows
/*!40000 ALTER TABLE "product_categories" DISABLE KEYS */;
INSERT INTO "product_categories" ("id", "category", "parent_category") VALUES
	(1, 'Clothing', NULL),
	(13, 'Jewelry', NULL),
	(3, 'Tops', 1),
	(26, 'Homeware', NULL),
	(31, 'Furniture', NULL),
	(52, 'Shoes', NULL),
	(61, 'Beauty', NULL),
	(71, 'Pets', NULL),
	(94, 'Art', NULL),
	(150, 'Food', NULL),
	(107, 'Entertainment', NULL),
	(44, 'Toys', 107),
	(37, 'Sports', 107),
	(82, 'Craft Supplies', NULL);
/*!40000 ALTER TABLE "product_categories" ENABLE KEYS */;

-- Dumping structure for table public.sales_by_product
CREATE TABLE IF NOT EXISTS "sales_by_product" (
	"product_id" INTEGER NULL DEFAULT NULL,
	"order_id" INTEGER NULL DEFAULT NULL,
	"quantity" INTEGER NULL DEFAULT NULL,
	"sale_price" NUMERIC NULL DEFAULT NULL,
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sales_by_product_id__seq''::regclass)',
	"artist_id" INTEGER NULL DEFAULT NULL,
	"color" VARCHAR NULL DEFAULT NULL,
	"size" VARCHAR NULL DEFAULT NULL,
	"date" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_sales_by_product_orders" FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_sales_by_product_products" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "FK_sales_by_product_users" FOREIGN KEY ("artist_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.sales_by_product: 119 rows
/*!40000 ALTER TABLE "sales_by_product" DISABLE KEYS */;
INSERT INTO "sales_by_product" ("product_id", "order_id", "quantity", "sale_price", "id", "artist_id", "color", "size", "date") VALUES
	(22, 85, 5, 15, 254, 44, 'Plum', 'XS', '2021-02-23 18:22:41'),
	(96, 85, 1, 60, 255, 44, 'Yellow', 'XS', '2021-02-23 18:22:41'),
	(22, 88, 1, 15, 258, 44, 'Plum', 'XS', '2021-02-24 11:23:59'),
	(96, 88, 1, 60, 259, 44, 'Yellow', 'XS', '2021-02-24 11:24:00'),
	(105, 88, 1, 110, 260, 45, 'black', 'S', '2021-02-24 11:24:00'),
	(96, 91, 1, 60, 264, 44, 'Yellow', 'M', '2021-02-24 12:02:41'),
	(106, 94, 1, 20, 267, 44, 'O', 'XS', '2021-02-25 01:26:33'),
	(22, 97, 1, 20, 276, 44, 'Plum', 'L', '2021-02-25 22:11:33'),
	(22, 97, 1, 16, 277, 44, 'Burnt Toffee', 'M', '2021-02-25 22:11:34'),
	(43, 84, 1, 33.99, 244, 45, 'Red', 'L', '2021-02-22 18:56:21'),
	(24, 84, 7, 15, 253, 44, 'Pink', 'O', '2021-02-22 18:56:21'),
	(28, 84, 1, 25, 252, 43, 'Yellow', 'O', '2021-02-22 18:56:21'),
	(28, 84, 1, 25, 251, 43, 'Pink', 'O', '2021-02-22 18:56:21'),
	(28, 84, 1, 25, 250, 43, 'Red', 'O', '2021-02-22 18:56:21'),
	(23, 84, 1, 60, 249, 43, 'Red', 'O', '2021-02-22 18:56:21'),
	(105, 84, 1, 120, 248, 45, 'red', 'M', '2021-02-22 18:56:21'),
	(105, 84, 1, 120, 247, 45, 'black', 'M', '2021-02-22 18:56:21'),
	(105, 84, 1, 110, 246, 45, 'black', 'S', '2021-02-22 18:56:21'),
	(43, 84, 1, 23.99, 245, 45, 'Purple', 'XS', '2021-02-22 18:56:21'),
	(43, 84, 1, 28.99, 243, 45, 'Black', 'S', '2021-02-22 18:56:21'),
	(31, 84, 1, 16, 242, 43, 'O', 'S', '2021-02-22 18:56:21'),
	(31, 84, 1, 26, 241, 43, 'O', 'L', '2021-02-22 18:56:21'),
	(27, 84, 1, 7, 240, 45, 'Black', 'O', '2021-02-22 18:56:21'),
	(43, 84, 1, 23.99, 239, 45, 'Red', 'XS', '2021-02-22 18:56:21'),
	(35, 84, 1, 28, 238, 45, 'Yellow', 'O', '2021-02-22 18:56:21'),
	(35, 84, 1, 28, 237, 45, 'Blue', 'O', '2021-02-22 18:56:21'),
	(35, 84, 1, 28, 236, 45, 'Black', 'O', '2021-02-22 18:56:21'),
	(34, 84, 1, 80, 235, 39, 'Peach', 'O', '2021-02-22 18:56:21'),
	(34, 84, 1, 80, 234, 39, 'Blue', 'O', '2021-02-22 18:56:21'),
	(34, 84, 2, 80, 233, 39, 'Black', 'O', '2021-02-22 18:56:21'),
	(33, 84, 1, 45, 232, 39, 'White', 'O', '2021-02-22 18:56:21'),
	(30, 84, 1, 24, 231, 39, 'Green', 'O', '2021-02-22 18:56:21'),
	(25, 84, 1, 60, 230, 43, 'O', 'S', '2021-02-22 18:56:21'),
	(25, 84, 1, 80, 229, 43, 'O', 'L', '2021-02-22 18:56:21'),
	(102, 84, 3, 300, 228, 43, 'O', 'O', '2021-02-22 18:56:21'),
	(27, 84, 1, 7, 227, 45, 'White', 'O', '2021-02-22 18:56:21'),
	(27, 84, 1, 7, 226, 45, 'Pink', 'O', '2021-02-22 18:56:21'),
	(27, 84, 1, 7, 225, 45, 'Mint', 'O', '2021-02-22 18:56:21'),
	(23, 84, 1, 60, 224, 43, 'Green', 'O', '2021-02-22 18:56:21'),
	(26, 86, 4, 30, 256, 39, 'Black', 'O', '2021-02-24 04:09:01'),
	(98, 89, 1, 100, 261, 44, 'O', 'XS', '2021-02-24 18:44:17'),
	(26, 89, 1, 30, 262, 39, 'Black', 'O', '2021-02-24 18:44:17'),
	(96, 92, 1, 60, 265, 44, 'Yellow', 'L', '2021-02-24 19:07:14'),
	(29, 95, 1, 7, 268, 39, 'Deep Sky Blue', 'O', '2021-02-25 15:46:34'),
	(29, 95, 1, 7, 269, 39, 'Crimson', 'O', '2021-02-25 15:46:34'),
	(29, 95, 1, 7, 270, 39, 'Yellow Sunshine', 'O', '2021-02-25 15:46:34'),
	(33, 95, 1, 45, 271, 39, 'White', 'O', '2021-02-25 15:46:34'),
	(26, 95, 2, 30, 272, 39, 'Black', 'O', '2021-02-25 15:46:34'),
	(96, 95, 1, 60, 273, 44, 'Yellow', 'M', '2021-02-25 15:46:34'),
	(96, 52, 1, 60, 84, 44, 'Yellow', 'S', '2021-02-11 23:47:32'),
	(96, 52, 1, 60, 83, 44, 'Yellow', 'M', '2021-02-11 23:47:32'),
	(96, 52, 1, 60, 82, 44, 'Yellow', 'L', '2021-02-11 23:47:32'),
	(96, 52, 7, 60, 81, 44, 'Yellow', 'XL', '2021-02-11 23:47:32'),
	(29, 80, 34, 7, 198, 39, 'Yellow Sunshine', 'O', '2021-02-18 15:37:19'),
	(29, 31, 2, 70, 48, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:04:53'),
	(96, 83, 1, 60, 207, 44, 'Yellow', 'XS', '2021-02-22 11:00:51'),
	(96, 83, 1, 60, 206, 44, 'Yellow', 'M', '2021-02-22 11:00:51'),
	(98, 83, 1, 100, 204, 44, 'O', 'XL', '2021-02-22 11:00:51'),
	(98, 83, 1, 100, 203, 44, 'O', 'L', '2021-02-22 11:00:51'),
	(98, 83, 1, 100, 202, 44, 'O', 'M', '2021-02-22 11:00:51'),
	(98, 83, 1, 100, 205, 44, 'O', 'XS', '2021-02-22 11:00:51'),
	(107, 83, 1, 50, 213, 44, 'Green / Blue', 'XL', '2021-02-22 11:00:51'),
	(107, 83, 1, 50, 212, 44, 'Green / Blue', 'L', '2021-02-22 11:00:51'),
	(107, 83, 1, 50, 211, 44, 'Green / Blue', 'S', '2021-02-22 11:00:51'),
	(107, 83, 2, 50, 210, 44, 'Green / Blue', 'XS', '2021-02-22 11:00:51'),
	(106, 83, 1, 20, 209, 44, 'O', 'S', '2021-02-22 11:00:51'),
	(106, 83, 1, 20, 208, 44, 'O', 'XS', '2021-02-22 11:00:51'),
	(22, 51, 1, 15, 78, 44, 'Plum', 'XS', '2021-02-11 22:04:40'),
	(22, 51, 2, 20, 80, 44, 'Plum', 'L', '2021-02-11 22:04:40'),
	(22, 51, 2, 26, 79, 44, 'Plum', 'XL', '2021-02-11 22:04:40'),
	(35, 81, 6, 28, 200, 45, 'Natural', 'O', '2021-02-18 15:41:13'),
	(29, 37, 2, 70, 60, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:27:21'),
	(29, 38, 2, 70, 62, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:29:22'),
	(29, 39, 2, 70, 64, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:42:52'),
	(29, 40, 2, 70, 66, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:44:53'),
	(43, 34, 1, 23.990, 55, 45, 'Purple', 'XS', '2021-02-09 19:22:06'),
	(29, 34, 2, 70, 54, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:22:06'),
	(43, 35, 1, 23.990, 57, 45, 'Purple', 'XS', '2021-02-09 19:24:07'),
	(29, 35, 2, 70, 56, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:24:07'),
	(29, 36, 2, 70, 58, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:25:15'),
	(27, 23, 1, 70, 40, 45, 'Black', 'O', '2021-02-09 10:13:27'),
	(43, 33, 1, 23.990, 53, 45, 'Purple', 'XS', '2021-02-09 19:15:33'),
	(23, 84, 1, 60, 223, 43, 'Blue', 'O', '2021-02-22 18:56:21'),
	(23, 84, 1, 65, 222, 43, 'Yellow', 'XS', '2021-02-22 18:56:21'),
	(23, 84, 1, 60, 221, 43, 'Yellow', 'O', '2021-02-22 18:56:21'),
	(32, 84, 1, 14, 220, 39, 'Black', 'O', '2021-02-22 18:56:21'),
	(32, 84, 1, 14, 219, 39, 'Yellow', 'O', '2021-02-22 18:56:21'),
	(32, 84, 1, 14, 218, 39, 'Green', 'O', '2021-02-22 18:56:21'),
	(32, 84, 1, 14, 217, 39, 'Blue', 'O', '2021-02-22 18:56:21'),
	(32, 84, 1, 14, 216, 39, 'Orange', 'O', '2021-02-22 18:56:21'),
	(33, 84, 1, 45, 215, 39, 'Gold', 'O', '2021-02-22 18:56:21'),
	(30, 84, 1, 24, 214, 39, 'Blue', 'O', '2021-02-22 18:56:21'),
	(98, 54, 1, 100, 89, 44, 'O', 'M', '2021-02-12 06:33:43'),
	(98, 54, 1, 100, 88, 44, 'O', 'XS', '2021-02-12 06:33:43'),
	(98, 55, 1, 100, 91, 44, 'O', 'XL', '2021-02-12 07:47:07'),
	(98, 55, 1, 100, 90, 44, 'O', 'L', '2021-02-12 07:47:07'),
	(29, 56, 1, 7, 92, 39, 'Yellow Sunshine', 'O', '2021-02-12 08:12:24'),
	(98, 56, 1, 100, 93, 44, 'O', 'XL', '2021-02-12 08:12:24'),
	(98, 57, 1, 100, 95, 44, 'O', 'XS', '2021-02-12 08:18:17'),
	(98, 79, 1, 100, 130, 44, 'O', 'XS', '2021-02-16 20:01:25'),
	(29, 26, 1, 70, 43, 39, 'Yellow Sunshine', 'O', '2021-02-09 17:23:36'),
	(29, 77, 1, 7, 128, 39, 'Yellow Sunshine', 'O', '2021-02-16 16:33:10'),
	(96, 52, 1, 60, 85, 44, 'Yellow', 'XS', '2021-02-11 23:47:32'),
	(26, 10, 2, 60, 33, 39, 'Red', 'O', '2021-02-08 09:02:40'),
	(22, 87, 3, 15, 257, 44, 'Burnt Toffee', 'XS', '2021-02-24 17:34:09'),
	(98, 90, 1, 100, 263, 44, 'O', 'XS', '2021-02-24 18:46:12'),
	(102, 93, 20, 300, 266, 43, 'O', 'O', '2021-02-24 19:43:45'),
	(96, 96, 1, 60, 274, 44, 'Yellow', 'XS', '2021-02-25 17:22:05'),
	(96, 96, 1, 60, 275, 44, 'Yellow', 'L', '2021-02-25 17:22:05'),
	(26, 10, 1, 30.00, 20, 39, 'Black', 'O', '2021-02-08 09:02:40'),
	(23, 9, 1, 60.00, 17, 43, 'Red', 'O', '2021-02-07 09:02:40'),
	(26, 9, 1, 30.00, 18, 39, 'Black', 'O', '2021-02-07 09:02:40'),
	(26, 53, 1, 30, 86, 39, 'Black', 'O', '2021-02-12 01:51:36'),
	(26, 73, 2, 30, 125, 39, 'Black', 'O', '2021-02-15 23:12:30'),
	(26, 76, 9, 30, 127, 39, 'Black', 'O', '2021-02-15 23:28:11'),
	(26, 74, 2, 30, 126, 39, 'Black', 'O', '2021-02-15 23:18:44'),
	(26, 75, 33, 30, 131, 39, 'Black', 'O', '2021-02-15 23:25:01'),
	(27, 58, 1, 7, 98, 45, 'Pink', 'O', '2021-02-12 08:23:49'),
	(27, 58, 1, 7, 97, 45, 'Mint', 'O', '2021-02-12 08:23:49'),
	(27, 58, 1, 7, 99, 45, 'White', 'O', '2021-02-12 08:23:49'),
	(27, 58, 1, 7, 96, 45, 'Black', 'O', '2021-02-12 08:23:49'),
	(23, 82, 12, 60, 201, 43, 'Red', 'O', '2021-02-20 17:49:53'),
	(43, 80, 1, 33.989999999999995, 199, 45, 'Purple', 'L', '2021-02-18 15:37:19'),
	(43, 80, 1, 23.99, 196, 45, 'Purple', 'XS', '2021-02-18 15:37:19'),
	(43, 80, 1, 28.99, 197, 45, 'Purple', 'S', '2021-02-18 15:37:19'),
	(43, 31, 1, 23.990, 49, 45, 'Purple', 'XS', '2021-02-09 19:04:53'),
	(43, 37, 1, 23.990, 61, 45, 'Purple', 'XS', '2021-02-09 19:27:21'),
	(43, 38, 1, 23.990, 63, 45, 'Purple', 'XS', '2021-02-09 19:29:22'),
	(43, 39, 1, 23.990, 65, 45, 'Purple', 'XS', '2021-02-09 19:42:52'),
	(43, 40, 1, 23.990, 67, 45, 'Purple', 'XS', '2021-02-09 19:44:53'),
	(43, 36, 1, 23.990, 59, 45, 'Purple', 'XS', '2021-02-09 19:25:15'),
	(29, 33, 2, 70, 52, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:15:33'),
	(29, 25, 1, 70, 42, 39, 'Yellow Sunshine', 'O', '2021-02-09 17:21:35'),
	(29, 27, 2, 70, 44, 39, 'Yellow Sunshine', 'O', '2021-02-09 18:12:48'),
	(29, 28, 2, 70, 45, 39, 'Yellow Sunshine', 'O', '2021-02-09 18:16:33'),
	(29, 29, 2, 70, 46, 39, 'Yellow Sunshine', 'O', '2021-02-09 18:20:48'),
	(29, 30, 2, 70, 47, 39, 'Yellow Sunshine', 'O', '2021-02-09 18:22:29'),
	(43, 32, 1, 23.990, 51, 45, 'Purple', 'XS', '2021-02-09 19:13:32'),
	(29, 32, 2, 70, 50, 39, 'Yellow Sunshine', 'O', '2021-02-09 19:13:32'),
	(27, 22, 1, 70, 39, 45, 'Black', 'O', '2021-02-09 10:11:26'),
	(27, 24, 1, 70, 41, 45, 'White', 'O', '2021-02-09 16:51:24'),
	(23, 18, 1, 60.00, 19, 43, 'Red', 'O', '2021-02-07 23:12:03'),
	(22, 50, 1, 123, 77, 44, 'Plum', 'XS', '2021-02-11 09:20:08');
/*!40000 ALTER TABLE "sales_by_product" ENABLE KEYS */;

-- Dumping structure for table public.sendgrid
CREATE TABLE IF NOT EXISTS "sendgrid" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sendgrid_id_seq''::regclass)',
	"day" VARCHAR NULL DEFAULT NULL,
	"sent" BOOLEAN NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.sendgrid: 157 rows
/*!40000 ALTER TABLE "sendgrid" DISABLE KEYS */;
INSERT INTO "sendgrid" ("id", "day", "sent") VALUES
	(350, '2/8/2022', 'true'),
	(349, '2/7/2022', 'true'),
	(343, '2/3/2022', 'true'),
	(339, '11/24/2021', 'true'),
	(337, '11/20/2021', 'true'),
	(331, '11/15/2021', 'true'),
	(332, '11/16/2021', 'true'),
	(328, '11/9/2021', 'true'),
	(327, '11/8/2021', 'true'),
	(324, '11/7/2021', 'true'),
	(320, '11/4/2021', 'true'),
	(318, '11/3/2021', 'true'),
	(314, '10/26/2021', 'true'),
	(316, '10/27/2021', 'true'),
	(340, '11/25/2021', 'true'),
	(341, '11/26/2021', 'true'),
	(342, '11/27/2021', 'true'),
	(69, '3/1/2021', 'true'),
	(70, '3/2/2021', 'true'),
	(71, '3/3/2021', 'true'),
	(19, '2/5/2021', 'true'),
	(45, '2/6/2021', 'true'),
	(46, '2/7/2021', 'true'),
	(47, '2/8/2021', 'true'),
	(48, '2/9/2021', 'true'),
	(49, '2/10/2021', 'true'),
	(50, '2/11/2021', 'true'),
	(51, '2/12/2021', 'true'),
	(52, '2/12/2021', 'true'),
	(53, '2/13/2021', 'true'),
	(54, '2/14/2021', 'true'),
	(55, '2/15/2021', 'true'),
	(56, '2/16/2021', 'true'),
	(57, '2/17/2021', 'true'),
	(58, '2/18/2021', 'true'),
	(59, '2/19/2021', 'true'),
	(344, '2/3/2022', 'true'),
	(352, '5/13/2022', 'true'),
	(338, '11/20/2021', 'true'),
	(310, '10/6/2021', 'true'),
	(274, '9/23/2021', 'true'),
	(273, '9/22/2021', 'true'),
	(270, '9/16/2021', 'true'),
	(269, '9/15/2021', 'true'),
	(263, '8/29/2021', 'true'),
	(264, '8/30/2021', 'true'),
	(259, '7/27/2021', 'true'),
	(255, '7/16/2021', 'true'),
	(251, '6/7/2021', 'true'),
	(247, '6/4/2021', 'true'),
	(249, '6/5/2021', 'true'),
	(241, '4/30/2021', 'true'),
	(235, '4/22/2021', 'true'),
	(232, '4/14/2021', 'true'),
	(161, '3/21/2021', 'true'),
	(106, '3/6/2021', 'true'),
	(109, '3/8/2021', 'true'),
	(142, '3/9/2021', 'true'),
	(145, '3/10/2021', 'true'),
	(148, '3/11/2021', 'true'),
	(151, '3/13/2021', 'true'),
	(157, '3/15/2021', 'true'),
	(158, '3/16/2021', 'true'),
	(159, '3/19/2021', 'true'),
	(160, '3/20/2021', 'true'),
	(163, '3/22/2021', 'true'),
	(265, '9/8/2021', 'true'),
	(268, '9/9/2021', 'true'),
	(165, '3/23/2021', 'true'),
	(166, '4/8/2021', 'true'),
	(229, '4/10/2021', 'true'),
	(234, '4/16/2021', 'true'),
	(333, '11/19/2021', 'true'),
	(334, '11/19/2021', 'true'),
	(261, '8/14/2021', 'true'),
	(262, '8/15/2021', 'true'),
	(243, '5/19/2021', 'true'),
	(254, '6/8/2021', 'true'),
	(260, '7/28/2021', 'true'),
	(271, '9/17/2021', 'true'),
	(144, '3/9/2021', 'true'),
	(308, '10/5/2021', 'true'),
	(330, '11/9/2021', 'true'),
	(156, '3/15/2021', 'true'),
	(65, '2/25/2021', 'true'),
	(66, '2/26/2021', 'true'),
	(67, '2/27/2021', 'true'),
	(103, '3/4/2021', 'true'),
	(154, '3/14/2021', 'true'),
	(155, '3/15/2021', 'true'),
	(353, '5/14/2022', 'true'),
	(258, '7/17/2021', 'true'),
	(329, '11/9/2021', 'true'),
	(347, '2/4/2022', 'true'),
	(348, '2/4/2022', 'true'),
	(60, '2/20/2021', 'true'),
	(61, '2/21/2021', 'true'),
	(62, '2/22/2021', 'true'),
	(63, '2/23/2021', 'true'),
	(335, '11/19/2021', 'true'),
	(336, '11/20/2021', 'true'),
	(351, '5/13/2022', 'true'),
	(354, '5/14/2022', 'true'),
	(64, '2/24/2021', 'true'),
	(105, '3/5/2021', 'true'),
	(107, '3/7/2021', 'true'),
	(143, '3/9/2021', 'true'),
	(146, '3/10/2021', 'true'),
	(149, '3/12/2021', 'true'),
	(152, '3/14/2021', 'true'),
	(239, '4/23/2021', 'true'),
	(226, '4/9/2021', 'true'),
	(227, '4/9/2021', 'true'),
	(230, '4/10/2021', 'true'),
	(233, '4/15/2021', 'true'),
	(240, '4/23/2021', 'true'),
	(242, '5/1/2021', 'true'),
	(244, '5/19/2021', 'true'),
	(246, '5/20/2021', 'true'),
	(250, '6/5/2021', 'true'),
	(253, '6/8/2021', 'true'),
	(266, '9/8/2021', 'true'),
	(267, '9/9/2021', 'true'),
	(306, '10/4/2021', 'true'),
	(317, '10/27/2021', 'true'),
	(323, '11/5/2021', 'true'),
	(313, '10/7/2021', 'true'),
	(237, '4/22/2021', 'true'),
	(238, '4/23/2021', 'true'),
	(108, '3/7/2021', 'true'),
	(307, '10/4/2021', 'true'),
	(345, '2/3/2022', 'true'),
	(346, '2/4/2022', 'true'),
	(147, '3/10/2021', 'true'),
	(150, '3/12/2021', 'true'),
	(153, '3/14/2021', 'true'),
	(164, '3/22/2021', 'true'),
	(228, '4/9/2021', 'true'),
	(231, '4/10/2021', 'true'),
	(245, '5/20/2021', 'true'),
	(257, '7/17/2021', 'true'),
	(272, '9/18/2021', 'true'),
	(322, '11/5/2021', 'true'),
	(326, '11/8/2021', 'true'),
	(325, '11/7/2021', 'true'),
	(321, '11/4/2021', 'true'),
	(319, '11/3/2021', 'true'),
	(315, '10/26/2021', 'true'),
	(312, '10/7/2021', 'true'),
	(311, '10/6/2021', 'true'),
	(309, '10/5/2021', 'true'),
	(256, '7/16/2021', 'true'),
	(252, '6/7/2021', 'true'),
	(248, '6/4/2021', 'true'),
	(236, '4/22/2021', 'true'),
	(162, '3/21/2021', 'true'),
	(68, '2/28/2021', 'true');
/*!40000 ALTER TABLE "sendgrid" ENABLE KEYS */;

-- Dumping structure for table public.stock
CREATE TABLE IF NOT EXISTS "stock" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''stock_id_seq''::regclass)',
	"product_id" INTEGER NOT NULL,
	"color" VARCHAR NOT NULL,
	"size" VARCHAR NOT NULL,
	"quantity" INTEGER NOT NULL DEFAULT '1',
	"cost" REAL NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_stock_products" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.stock: 120 rows
/*!40000 ALTER TABLE "stock" DISABLE KEYS */;
INSERT INTO "stock" ("id", "product_id", "color", "size", "quantity", "cost") VALUES
	(140, 24, 'Red', 'O', 0, NULL),
	(142, 24, 'Orange', 'O', 0, NULL),
	(143, 24, 'Cobalt', 'O', 0, NULL),
	(144, 24, 'Teal', 'O', 0, NULL),
	(145, 24, 'Yellow', 'O', 0, NULL),
	(1127, 48, 'Red', '1', 0, NULL),
	(1128, 48, 'Red', '6', 0, NULL),
	(1129, 48, 'Red', '12', 0, NULL),
	(1130, 48, 'Red', '36', 0, NULL),
	(162, 30, 'Purple', 'O', 99, NULL),
	(164, 30, 'Pink', 'O', 99, NULL),
	(179, 35, 'White', 'O', 99, NULL),
	(199, 43, 'Red', 'S', 99, NULL),
	(1351, 98, 'O', 'S', 100, NULL),
	(1101, 22, 'Plum', 'XL', 10, NULL),
	(1312, 96, 'Yellow', 'XL', 94, NULL),
	(1309, 96, 'Yellow', 'S', 100, NULL),
	(207, 43, 'Black', 'XS', 99, NULL),
	(1098, 22, 'Plum', 'S', 44, NULL),
	(1099, 22, 'Plum', 'M', 44, NULL),
	(1102, 22, 'Black', 'XS', 44, NULL),
	(1103, 22, 'Black', 'S', 44, NULL),
	(1104, 22, 'Black', 'M', 44, NULL),
	(1105, 22, 'Black', 'L', 44, NULL),
	(1106, 22, 'Black', 'XL', 12, NULL),
	(1107, 22, 'Cream', 'XS', 44, NULL),
	(1108, 22, 'Cream', 'S', 44, NULL),
	(1109, 22, 'Cream', 'M', 44, NULL),
	(1110, 22, 'Cream', 'L', 68, NULL),
	(376, 43, 'Black', 'L', 99, NULL),
	(1111, 22, 'Cream', 'XL', 12, NULL),
	(1113, 22, 'Burnt Toffee', 'S', 44, NULL),
	(1115, 22, 'Burnt Toffee', 'L', 23, NULL),
	(1116, 22, 'Burnt Toffee', 'XL', 12, NULL),
	(1117, 22, 'Dark Grey', 'XS', 44, NULL),
	(1118, 22, 'Dark Grey', 'S', 44, NULL),
	(1119, 22, 'Dark Grey', 'M', 56, NULL),
	(1120, 22, 'Dark Grey', 'L', 44, NULL),
	(1121, 22, 'Dark Grey', 'XL', 12, NULL),
	(1122, 22, 'Forest', 'XS', 37, NULL),
	(1123, 22, 'Forest', 'S', 37, NULL),
	(1124, 22, 'Forest', 'M', 37, NULL),
	(1125, 22, 'Forest', 'L', 37, NULL),
	(1126, 22, 'Forest', 'XL', 37, NULL),
	(197, 43, 'Purple', 'S', 98, NULL),
	(378, 43, 'Purple', 'L', 98, NULL),
	(175, 35, 'Natural', 'O', 93, NULL),
	(1452, 105, 'red', 'S', 10, NULL),
	(1456, 106, 'O', 'M', 100, NULL),
	(1457, 106, 'O', 'L', 100, NULL),
	(1458, 106, 'O', 'XL', 100, NULL),
	(1461, 107, 'Green / Blue', 'M', 100, NULL),
	(1352, 98, 'O', 'M', 98, NULL),
	(1353, 98, 'O', 'L', 98, NULL),
	(1354, 98, 'O', 'XL', 97, NULL),
	(1024, 29, 'Yellow Sunshine', 'O', 0, NULL),
	(170, 33, 'White', 'O', 97, NULL),
	(146, 26, 'Black', 'O', 17, NULL),
	(1310, 96, 'Yellow', 'M', 97, NULL),
	(1455, 106, 'O', 'S', 99, NULL),
	(1459, 107, 'Green / Blue', 'XS', 98, NULL),
	(1460, 107, 'Green / Blue', 'S', 99, NULL),
	(1462, 107, 'Green / Blue', 'L', 99, NULL),
	(1463, 107, 'Green / Blue', 'XL', 99, NULL),
	(1695, 28, 'Blue', 'O', 100, NULL),
	(161, 30, 'Blue', 'O', 92, NULL),
	(171, 33, 'Gold', 'O', 96, NULL),
	(165, 32, 'Orange', 'O', 66, NULL),
	(166, 32, 'Blue', 'O', 98, NULL),
	(167, 32, 'Green', 'O', 98, NULL),
	(168, 32, 'Yellow', 'O', 98, NULL),
	(169, 32, 'Black', 'O', 98, NULL),
	(1308, 96, 'Yellow', 'XS', 96, NULL),
	(1311, 96, 'Yellow', 'L', 98, NULL),
	(1100, 22, 'Plum', 'L', 41, NULL),
	(1112, 22, 'Burnt Toffee', 'XS', 41, NULL),
	(148, 27, 'Mint', 'O', 97, NULL),
	(149, 27, 'Pink', 'O', 97, NULL),
	(150, 27, 'White', 'O', 96, NULL),
	(1114, 22, 'Burnt Toffee', 'M', 43, NULL),
	(1097, 22, 'Plum', 'XS', 36, NULL),
	(163, 30, 'Green', 'O', 98, NULL),
	(176, 35, 'Black', 'O', 98, NULL),
	(177, 35, 'Blue', 'O', 98, NULL),
	(178, 35, 'Yellow', 'O', 98, NULL),
	(198, 43, 'Red', 'XS', 98, NULL),
	(147, 27, 'Black', 'O', 95, NULL),
	(1450, 105, 'black', 'S', 8, NULL),
	(273, 43, 'Black', 'S', 98, NULL),
	(377, 43, 'Red', 'L', 98, NULL),
	(196, 43, 'Purple', 'XS', 87, NULL),
	(1451, 105, 'black', 'M', 5, NULL),
	(1453, 105, 'red', 'M', 5, NULL),
	(1464, 28, 'Red', 'O', 99, NULL),
	(1579, 28, 'Pink', 'O', 99, NULL),
	(1812, 28, 'Yellow', 'O', 22, NULL),
	(141, 24, 'Pink', 'O', 18, NULL),
	(1938, 31, 'O', 'S', 98, NULL),
	(1939, 31, 'O', 'L', 98, NULL),
	(1940, 25, 'O', 'S', 98, NULL),
	(1941, 25, 'O', 'L', 98, NULL),
	(1930, 23, 'Red', 'O', 0, NULL),
	(1931, 23, 'Red', 'XS', 0, NULL),
	(1932, 23, 'Yellow', 'O', 0, NULL),
	(1933, 23, 'Yellow', 'XS', 0, NULL),
	(1934, 23, 'Blue', 'O', 0, NULL),
	(1935, 23, 'Blue', 'XS', 0, NULL),
	(1936, 23, 'Green', 'O', 0, NULL),
	(1937, 23, 'Green', 'XS', 0, NULL),
	(1350, 98, 'O', 'XS', 94, NULL),
	(1356, 102, 'O', 'O', 277, NULL),
	(1454, 106, 'O', 'XS', 98, NULL),
	(1025, 29, 'Deep Sky Blue', 'O', 31, NULL),
	(1026, 29, 'Crimson', 'O', 16, NULL),
	(1945, 34, 'Black', 'XS', 20, NULL),
	(1946, 34, 'Black', 'L', 10, NULL),
	(1947, 34, 'Blue', 'XS', 20, NULL),
	(1948, 34, 'Blue', 'L', 10, NULL),
	(1949, 34, 'Peach', 'XS', 20, NULL),
	(1950, 34, 'Peach', 'L', 10, NULL);
/*!40000 ALTER TABLE "stock" ENABLE KEYS */;

-- Dumping structure for table public.tokens
CREATE TABLE IF NOT EXISTS "tokens" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''tokens_id_seq''::regclass)',
	"user_id" INTEGER NULL DEFAULT NULL,
	"token" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "FK_tokens_users" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.tokens: 0 rows
/*!40000 ALTER TABLE "tokens" DISABLE KEYS */;
INSERT INTO "tokens" ("id", "user_id", "token") VALUES
	(837, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MDE3NjM2fQ.pqtq6VYBujM9g6vJVIwhvbbuUTcbx6XluzfwRWcUHQY'),
	(838, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjE0MDI4NTY2fQ.oZ6MI47vfkh-Q5zGeXH3UqfGFUcPvc18eOZHYRLJosE'),
	(839, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MDUzNjg1fQ.gLoWCrbX5B_E5stpfAMqWc1RPC3VpxjRRuYtWIoCSKg'),
	(840, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MDU0MTI1fQ.eNRgdeaeXOqcdIku7GWHedKX4W24AzmrK8nGFmZHHDM'),
	(842, 44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ0IiwiaWF0IjoxNjE0MDk1NTE1fQ.YCn3wGkt6YTSuWclmLDW0BVn7QH4wRTW3ojAal1Lhu4'),
	(843, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjE0MTEyMTcyfQ.o5s66Oq8QeOXHei7Q9Z1BZCYrKCYhh8iAhRxR3V6Atg'),
	(844, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjE0MTMyOTA1fQ.y4Z0Fam4U0tMN2wnilcZb2U-Mr7SqbF7q5Pvy5o1DVY'),
	(845, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjE0MTUwOTg2fQ.OYQn7pByyCXx1iaqVxKk6MMsPIfw9X_HzyR1qAO3Mus'),
	(846, 44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ0IiwiaWF0IjoxNjE0MTcxNjk2fQ.esmb72DAVyogd-u_kt_bBwohybbliW7N03pUlRGM0pg'),
	(848, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MTkzNDE3fQ.m9NZycil9X016-7r0oNMhlXnPyeVE3aSN7QF4v_OkPk'),
	(849, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MTk1MTIwfQ.AI6VHLj6kqsEPMsYUuVqBiGi9Py4OIAKZcQXrLm3wO8'),
	(850, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MTk4MzYxfQ.ru5KL5sfKw4sgbaPCNGEnZZ8HR25yL1VXsUWSEpLeME'),
	(851, 44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ0IiwiaWF0IjoxNjE0MTk4MzgwfQ.Md8jCpCdIHHGhOWU74khzLcXtqNbtaa34CQ9r-oZV0w'),
	(852, 44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ0IiwiaWF0IjoxNjE0MTk4MzgyfQ.hMoQ8QPKj_oMMeKy1RlOe7PfFhdu8tStnxqWgMGh660'),
	(853, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MjI1NDk5fQ.h84CY_HIF_Komm7yxIJmK3LcvR3PJ-3p3f0TmrqciSI'),
	(854, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MjU5NTgxfQ.C8QX1z3sbwgCjNrQA_Kv2nu7E4DO1Lhyyc2SIworfvo'),
	(855, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0MjYzNTk1fQ.8LFd5unogLzV42I6qjtA5nzfNmN0cEEordGavse4c_A'),
	(856, 54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU0IiwiaWF0IjoxNjE0NDYzNzg1fQ.xU4nzvXqmcq5taxAE90Hudgd1ZB7h6zTSUUdq3pEgoI'),
	(857, 54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU0IiwiaWF0IjoxNjE0NDYzODI1fQ.n9rNcIKfwW6BTPRAEPxgtki2UtQqPCP-3N2qA4pVt04'),
	(858, 55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU1IiwiaWF0IjoxNjE0NDY0NzYwfQ.S3inaD4G5ghKdewwdh1-p310sSHKh233hELpURL_SaM'),
	(859, 56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU2IiwiaWF0IjoxNjE0NDY1NDQxfQ.K8F0D4jaQ-i4S8dvedXHxBN0eGKWOGt_t6D6qLz3Hgo'),
	(860, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE0NzY4OTkxfQ.eY65PbskaqoaYymDG3IJ5SZ6P6F2tm4QofEhNgaUwUI'),
	(861, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE1MTQzNzA4fQ.7gSk3mH28RTSNfAbG1VF3mMmypkkSm6cVX-AAw7o5cE'),
	(862, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE1NDc5NTQ1fQ.iQWf5AMQO8__eTeFS9NjlWFe-Pz7g5zkBPAQr-wh7TQ'),
	(863, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjE2MzQ2MTMwfQ.pzJNkVnHP6TZaXF-hIb9yyj-Lx9hKp3oaAd-6Z7iNS8'),
	(864, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE2NDI4ODk4fQ.i1rBqmtox0T1xJ1B_BY-r5trkuyQfu3zSsRhPV7Xj5c'),
	(865, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE4NDM0OTA2fQ.DFAT3gsBK00q54StRj2q6Eb7O7ejZikuFzgvNYdPC8A'),
	(866, 57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU3IiwiaWF0IjoxNjE4NDM1ODM0fQ.beULwKwDAhAlbOMbsrHF4cWPsC-NC2s8iqUv99fvdxE'),
	(867, 57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU3IiwiaWF0IjoxNjE4NDM1ODQyfQ.SYmIMgz73kwdxr4an8QLZgt5olcRqgBKhoxsCiDtbd8'),
	(868, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE4NDM2Mjc0fQ.Lmyp9DmgPBMESyqfk1jZb93vnTiuccGdxfqMvAoJ-mY'),
	(869, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjE5MTExOTMxfQ.UFqF2YNKYK9WActLOdXhxtpLNSrDcmaiLe1LrTQ0_j8'),
	(870, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjIzMDk3OTE5fQ.PyXgN7YK6GSR47bcugLgGWNd3zIvM5OUR4qV58Mprro'),
	(871, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjI3NDAwOTI5fQ.ccPHaVQo2hRf1lWVZ2NJh1DO5Kh7145WSnREN2s_chs'),
	(872, 45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ1IiwiaWF0IjoxNjM2MzIxMDIxfQ.tvOAFws1Wa3sX2zDl7WzzO5ELgON6ZZFJIqGkJcOXtI'),
	(873, 39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM5IiwiaWF0IjoxNjQ0MjY1ODMyfQ.J_qWu9TrJDbixphB6CNmbM0fC-7B3ys_ZOCRDei2aI8');
/*!40000 ALTER TABLE "tokens" ENABLE KEYS */;

-- Dumping structure for table public.users
CREATE TABLE IF NOT EXISTS "users" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''users_id_seq''::regclass)',
	"username" VARCHAR NULL DEFAULT NULL,
	"password" VARCHAR NOT NULL,
	"email" VARCHAR NOT NULL,
	"address" VARCHAR NULL DEFAULT NULL,
	"name" VARCHAR NOT NULL,
	"is_driver" BOOLEAN NULL DEFAULT 'false',
	"is_artist" BOOLEAN NULL DEFAULT 'false',
	"store_address" VARCHAR NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "u_email" ("email")
);

-- Dumping data for table public.users: 5 rows
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" ("id", "username", "password", "email", "address", "name", "is_driver", "is_artist", "store_address") VALUES
	(39, 'Dani B', '$2a$08$1GZxDRgy64NMI6R/KStlAeJSGenFC35Sxd7RVoP/WzUS7Ap1PgG9S', 'caseybarker86@gmail.com', '143 Friendly Lane SW T4A3M4', 'Dani B', 'true', 'true', '145 Friendly Lane SW T4A3M4'),
	(54, 'Admin Store', '$2a$08$huynphqJSfI70wHf0QSYue7ePii2xMuv8.6FwKmiGghyBpgnomUJy', 'versayyc@gmail.com', 'Admin Account', 'Admin Account', NULL, 'true', NULL),
	(55, NULL, '$2a$08$93IQADbpyiSh5cjJwFru/uEfDB2msCfa.nkmIRzGxu9VASjeBjYKy', 'danielleemmalee@icloud.com', '123 Test Ave NW', 'Test Account', NULL, NULL, NULL),
	(56, 'Store Name', '$2a$08$JIJdhJTzLXT1l2xlwCd7qeFZN419e5Mxoh/1uusVCgUgCbimL2tn6', 'test@email.com', 'Home Address', 'Test Account 2', NULL, 'true', 'Store Address'),
	(44, 'Wonderland', '$2a$08$rEHmC62n9CZusv4d.s/i1.4nWon6NaiPsaUSOzCNKKrslz9q19nCa', 'email@gmail.com', '123 Polar Bear Rd', 'Nic S', 'true', 'true', NULL),
	(57, 'Starland', '$2a$08$WBnzYZSIH1jLCfvuBMlYUOjFqtmE5hunnoUypBKT2SN1Xxhs28AI6', 'nemail@gmail.com', '123 Real St SW T1X 1X1', 'Nic', 'true', 'true', '123 Real St SW'),
	(9999, 'Buyer not signed in', 'none', 'none', 'none', 'Buyer Not Signed In', 'false', 'false', NULL),
	(45, 'messy', '$2a$08$rJ5hfBz1kIA34DGkodwQEex/kM7VjGBipjyIv5yyrPODmcblWQIAq', 'messeleghebreslassie@gmail.com', '148 Rundlefield Crescent Northeast', 'messele ghebreslassie', 'true', 'true', NULL),
	(43, 'Muniba''s Store', '$2a$08$F8PSYOor.IJrsGxFBYm6P.umwLHHllX7fi8TrKn0xdyySAc3TM1se', 'muniba.wq@gmail.com', 'The place where my store is.', 'Muniba ', 'true', 'true', '101 Address Street SW, T2T 4H4');
/*!40000 ALTER TABLE "users" ENABLE KEYS */;

-- Dumping structure for table public.wishlists
CREATE TABLE IF NOT EXISTS "wishlists" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''wishlist_id_seq''::regclass)',
	"user_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "wishlist_user_id" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.wishlists: 0 rows
/*!40000 ALTER TABLE "wishlists" DISABLE KEYS */;
INSERT INTO "wishlists" ("id", "user_id") VALUES
	(1, 43);
/*!40000 ALTER TABLE "wishlists" ENABLE KEYS */;

-- Dumping structure for table public.wishlist_items
CREATE TABLE IF NOT EXISTS "wishlist_items" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''wishlist_items_id_seq''::regclass)',
	"product_id" INTEGER NULL DEFAULT NULL,
	"wishlist_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "wishlist_items_products" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "wishlist_items_wishlist" FOREIGN KEY ("wishlist_id") REFERENCES "public"."wishlists" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.wishlist_items: 0 rows
/*!40000 ALTER TABLE "wishlist_items" DISABLE KEYS */;
INSERT INTO "wishlist_items" ("id", "product_id", "wishlist_id") VALUES
	(1, 22, 1);
/*!40000 ALTER TABLE "wishlist_items" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
