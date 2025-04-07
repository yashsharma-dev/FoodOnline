-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2025 at 05:08 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(8) NOT NULL,
  `product_id` int(8) NOT NULL,
  `token` varchar(200) NOT NULL,
  `plates_size` varchar(200) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `token`, `plates_size`, `price`) VALUES
(28, 1, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Full Plate', 1145),
(29, 2, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Half Plate', 948),
(30, 2, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Full Plate', 139),
(31, 12, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Half Plate', 742),
(32, 12, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Full Plate', 491),
(33, 2, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Full Plate', 139),
(34, 2, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Half Plate', 948),
(35, 2, 'KHPNqvuf2tuK0V3QskDz2O3sMoXV3I2vcsAWh35t9qHiB74q4e', 'Full Plate', 139),
(36, 1, 'null', 'Half Plate', 287),
(37, 1, 'null', 'Half Plate', 287),
(38, 2, 'dcqHArxQqBQ7G0rZH2enxIDwvb6BOQsZf1ESYN9fDA4yKdAvCE', 'Half Plate', 948);

-- --------------------------------------------------------

--
-- Stand-in structure for view `food_all_details`
-- (See below for the actual view)
--
CREATE TABLE `food_all_details` (
`food_name` varchar(240)
,`food_desc` text
,`food_image` varchar(240)
,`food_menu_alias` varchar(240)
,`cat_name` varchar(240)
,`cat_desc` text
,`cat_image` varchar(240)
,`state_name` varchar(240)
,`state_alias` varchar(240)
,`state_desc` text
,`state_image` varchar(240)
,`meals_name` varchar(240)
,`meals_desc` text
,`plate_size` varchar(88)
,`price` int(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `food_details`
-- (See below for the actual view)
--
CREATE TABLE `food_details` (
`id` int(8)
,`food_name` varchar(240)
,`food_desc` text
,`food_image` varchar(240)
,`food_menu_alias` varchar(240)
,`cat_name` varchar(240)
,`cat_desc` text
,`cat_image` varchar(240)
,`state_name` varchar(240)
,`state_alias` varchar(240)
,`state_desc` text
,`state_image` varchar(240)
);

-- --------------------------------------------------------

--
-- Table structure for table `food_meal_cat`
--

CREATE TABLE `food_meal_cat` (
  `id` int(8) NOT NULL,
  `food_menu_id` int(8) NOT NULL,
  `food_meal_type` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_meal_cat`
--

INSERT INTO `food_meal_cat` (`id`, `food_menu_id`, `food_meal_type`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 3),
(4, 3, 3),
(5, 3, 4),
(6, 4, 3),
(7, 5, 4),
(8, 5, 3),
(9, 6, 1),
(10, 6, 3),
(11, 6, 4),
(12, 7, 3),
(13, 7, 4),
(14, 8, 3),
(15, 9, 1),
(16, 9, 2),
(17, 9, 3),
(18, 9, 4),
(19, 9, 5),
(20, 10, 3),
(21, 11, 3),
(22, 12, 3),
(23, 13, 4),
(24, 15, 3),
(25, 16, 4),
(26, 14, 3),
(27, 13, 4),
(28, 14, 1),
(29, 15, 1),
(30, 16, 3),
(31, 16, 1),
(32, 16, 3),
(33, 17, 4),
(34, 18, 3),
(35, 18, 4),
(36, 19, 3),
(37, 19, 4),
(38, 20, 4),
(39, 21, 5),
(40, 22, 5),
(41, 23, 5),
(42, 24, 3),
(43, 24, 4),
(44, 25, 2),
(45, 25, 3),
(46, 26, 3),
(47, 26, 4),
(48, 27, 3),
(49, 27, 4),
(50, 28, 1),
(51, 28, 2),
(52, 29, 3),
(53, 29, 4),
(54, 30, 4),
(55, 31, 3),
(56, 31, 4),
(57, 32, 1),
(58, 33, 4),
(59, 34, 3),
(60, 34, 4),
(61, 35, 3),
(62, 35, 4),
(63, 36, 3),
(64, 36, 4),
(65, 37, 3),
(66, 37, 4),
(67, 38, 3),
(68, 38, 4),
(69, 39, 1),
(70, 39, 2),
(71, 40, 2),
(72, 41, 1),
(73, 41, 2),
(74, 41, 5),
(75, 42, 1),
(76, 43, 2),
(77, 44, 2),
(78, 45, 1),
(79, 45, 2),
(80, 45, 5),
(81, 46, 2),
(82, 47, 3),
(83, 47, 4),
(84, 48, 1),
(85, 48, 2),
(86, 48, 5),
(87, 49, 1),
(88, 49, 2),
(89, 50, 1),
(90, 50, 2),
(91, 51, 1),
(92, 51, 2),
(93, 52, 1),
(94, 52, 3),
(95, 52, 5),
(96, 53, 3),
(97, 53, 4),
(98, 54, 3),
(99, 54, 4),
(100, 55, 3),
(101, 55, 4),
(102, 56, 1),
(103, 56, 3),
(104, 57, 3),
(105, 57, 4),
(106, 58, 3),
(107, 58, 4),
(108, 59, 3),
(109, 59, 4),
(110, 60, 3),
(111, 60, 4),
(112, 61, 3),
(113, 61, 4),
(114, 62, 3),
(115, 62, 4),
(116, 63, 3),
(117, 63, 4),
(118, 64, 4),
(119, 65, 4),
(120, 66, 3),
(121, 66, 4),
(122, 67, 1),
(123, 67, 2),
(124, 68, 1),
(125, 69, 4),
(126, 70, 3),
(127, 71, 3),
(128, 72, 3),
(129, 73, 4),
(130, 74, 3),
(131, 75, 5),
(132, 76, 5),
(133, 77, 5),
(134, 78, 5),
(135, 79, 5),
(136, 80, 5),
(137, 81, 5),
(138, 82, 5),
(139, 83, 5),
(140, 84, 5),
(141, 85, 5),
(142, 86, 5),
(143, 87, 5),
(144, 88, 5),
(145, 89, 5),
(146, 90, 5),
(147, 91, 5),
(148, 92, 5),
(149, 93, 5),
(150, 94, 5),
(151, 95, 5),
(152, 96, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `food_meal_details`
-- (See below for the actual view)
--
CREATE TABLE `food_meal_details` (
`food_name` varchar(240)
,`food_desc` text
,`food_image` varchar(240)
,`food_menu_alias` varchar(240)
,`cat_name` varchar(240)
,`cat_desc` text
,`cat_image` varchar(240)
,`state_name` varchar(240)
,`state_alias` varchar(240)
,`state_desc` text
,`state_image` varchar(240)
,`meals_name` varchar(240)
,`meals_desc` text
);

-- --------------------------------------------------------

--
-- Table structure for table `food_menu`
--

CREATE TABLE `food_menu` (
  `id` int(8) NOT NULL,
  `food_name` varchar(240) NOT NULL,
  `food_main_cat` int(8) NOT NULL,
  `food_state_cat` int(8) NOT NULL,
  `food_desc` text NOT NULL,
  `food_image` varchar(240) NOT NULL,
  `is_delete` int(8) NOT NULL,
  `alias` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_menu`
--

INSERT INTO `food_menu` (`id`, `food_name`, `food_main_cat`, `food_state_cat`, `food_desc`, `food_image`, `is_delete`, `alias`) VALUES
(1, 'Butter Chicken', 2, 2, 'Presenting, the classic butter chicken that is unknown to none. Juicy chicken pieces bathed in a creamy gravy bursting with authentic flavours.', 'images/butter-chicken-.jpg', 0, 'Butter_Chicken'),
(2, 'Chole Bhature', 1, 2, 'Talk about Punjabi food and the popular chole bhature can never be given a skip. The dish has become one of the favourites with people across the country and is also one of the must try Indian delicacies.', 'images/Chole-bhature-in-Delhi-2.webp', 0, 'chole_bhature'),
(3, 'Sarson Ka Saag Aur Makki Ki Roti', 1, 2, 'Palak, bathua and sarso saag come together to create a sensation with hearty makke ki roti. Simple, savoury and full of rustic flavours.', 'images/photo.jpg', 0, 'sarson_ka_saag_aur_makki_ki_roti'),
(4, 'Dal Makhani', 1, 2, 'From the local highway dhabas to some of the most sophisticated five star hotels - Dal makhni finds its dedicated space on menus across eating joints and restaurants and beyond all cultural division. Master the art of cooking the queen of all dal preparations.', 'images/sddefault.jpg', 0, 'dal_makhani'),
(5, 'Paneer Tikka', 1, 2, 'For that unexpected dinner party, you can never go wrong with these quick, paneer bites. Soft and tender chunks of paneer, coated with a mix of masalas, grilled hot on skewers.', 'images/maxresdefault.jpg', 0, 'paneer_tikka'),
(6, 'Amritsari Kulcha ', 1, 2, 'Made from refined flour, potato-filling, coriander seeds, ginger, onions, et al, Amritsari kulchas are the perfect Punjabi dish that you\'d want to prepare at home. This recipe has kulchas made with canola oil. ', 'images/amritsari-kulcha.avif', 0, 'amritsari_kulcha'),
(7, 'Punjabi Lotus Stem Chicken Curry ', 2, 2, 'This chicken curry is an extremely flavorful and aromatic dish that is made with rich Indian spices; tomato base gravy and an aromatic lotus stem stock.', 'images/malvani-chicken-curry_620x330_81514354104.webp', 0, 'punjabi_lotusstem_chicken_curry '),
(8, 'Machchli Amritsari', 2, 2, 'A treat for all fish lovers. Beautiful pieces of fish, coated in a spicy batter and deep fried to a golden perfection. Garnished with a sprinkling of garam masala and a dash of lemon juice for that extra zing.', 'images/machchratsari-620.jpg', 0, 'machchli_amritsari'),
(9, 'Lassi ', 1, 2, 'Lassi Recipe: A chilled glass of lassi made with yogurt to cool down on a hot summer day. Prepare sweet or salty lassi at home with this easy recipe made with a handful of ingredients in just a few minutes.', 'images/Lassi-in-a-glass.webp', 0, 'lassi'),
(10, ' Sookhi urad dal ', 1, 2, ' Urad dhuli or Urad Mogar is pale yellow/whitish color on the interior and has a somewhat glutinous texture, that is obtained by removing the outermost layer of tiny black skin.', 'images/Sookhi-Urad-Dal-3-480x270.jpg', 0, 'Sookhi_urad_dal '),
(11, ' Bharwa karela ', 1, 2, 'The aroma of bharwa karele, best associated with opening a tiffin on a long train journey, can bring a smile to anyone’s face. Made especially during winters, the Punjabi stuffed bitter gourd dish is one the greatest ways to preserve vegetables and make them last longer in the harsh, cold winters of the northern plains.', 'images/bharva-karela-recipe.jpg', 0, ' Bharwa_karela '),
(12, 'Gajar-gobhi-shalgam achaar', 1, 2, 'Best enjoyed with stuffed parathas, this is a favourite amongst the people of the community.', 'images/Winter-pickle-1.jpg', 0, 'Gajar_gobhi_shalgam_achaar'),
(13, ' Mongre ki sabzi', 1, 2, ' Punjabi mongre is akin to Gujarati gathia and is a Punjabi jugaad to make the best of leftovers. Many families often use leftover pakoras too to make this delight.', 'images/maxresdefault (1).jpg', 0, ' Mongre_ki_sabzi'),
(14, 'Masala Lassi', 1, 2, 'Punjabis take pride in their lassi, and it is made in every household and every restaurant in Punjab. ', 'images/Masala-lassi7.jpg', 0, 'Masala_Lassi'),
(15, 'aaloo Paratha', 1, 2, 'Best enjoyed with stuffed parathas, this is a favourite amongst the people of the community.', 'images/aloo-paratha-recipe.jpg', 0, 'aaloo_Paratha'),
(16, 'Amritsari Fish', 2, 2, 'Non-vegetarians shall find themselves yielding to their cravings in the land of Punjab.', 'images/img_2580.jpg', 0, 'Amritsari_Fish'),
(17, 'Phulka', 1, 2, 'Phulka or Phulka Roti is a soft melt-in-the-mouth whole wheat Indian flatbread, that is a daily meal staple in many Indian homes.', 'images/phulka-roti-chappati-recipe.jpg', 0, 'Phulka'),
(18, 'puri bhaji', 1, 2, 'Puri bhaji is a dish, originating from the Indian subcontinent, of puri and aloo bhaji. ', 'images/PURI-BHAJI-RECIPE.webp', 0, 'puri_bhaji'),
(19, 'Chicken karahi', 2, 2, 'Chicken karahi, or kadai chicken, is a chicken dish from punjab', 'images/Kadai-Chicken.jpg', 0, 'Chicken_karahi'),
(20, 'Rajma Chawal', 1, 2, 'How would you describe rajma chawal?\r\nRajma - Wikipedia\r\nIt is a part of the regular diet in Northern India, Nepal and Punjab.', 'images/Rajma-Chawal-scaled (1).jpeg', 0, 'Rajma_chawal'),
(21, 'Atta Pinni', 1, 2, 'Atta Pinni is again one of the oldest traditional sweets in Punjab. People like to relish it during the winter season mostly because of it’s health benefits. It provides the comfort and coziness one needs during winters. It is made up of the whole wheat flour roasted nicely in desi ghee. A lot of nuts are added for that extra crunch and nutritional value. Since it is roasted very finely, it lasts for good 3 months. If you are looking for some authentic Atta Pinni for yourself and your loved ones,', 'images/IMG_20181217_140259_113.jpg', 0, 'atta_pinni'),
(22, 'Panjiri', 1, 2, 'Panjiri is one of the most popular punjabi sweets. It is loaded with such healthy ingredients that it is often associated with the diet given to new mothers in Punjab so that they can recover from their deliveries with greater strength and agility. You can now Shop the authentic Panjeeri prepared by desi ghee and wholesome of nuts from Chocovic.', 'images/70738194.webp', 0, 'panjiri'),
(23, 'Boondi Ladoo', 1, 2, 'Boondi ke Ladoo as they are famously known, are perhaps one of the oldest sweets in Punjab which is loved by one and all. These are basically prepared by combining small spherical pieces of fried and sugar coated batter. It’s very very soft and completely melts into the mouth.', 'images/Boondi-Laddu-1.jpg', 0, 'boondi_ladoo'),
(24, 'kadhi kachori', 1, 1, 'kadhi kachori is very famous in rajsthan in brakfast', 'images/DSCN2820.JPG', 0, 'kadhi_kachori'),
(25, 'daal baati', 1, 1, 'Daal Baati is an Indian dish of daal and baati. It is popular in Rajasthan, ', 'images/dal-bati (1).jpg', 0, 'daal_baati'),
(26, 'sogar with saag', 1, 1, 'sogar with saag is very delicios eat in winter', 'images/sarso-ka-saag-benefits-main.jpg', 0, 'sogar_saag'),
(27, 'besan gatta', 1, 1, 'Gatte ki sabji is a popular gravy based dish from the Rajasthani cuisine. Gatte are gram flour (besan) roundels which are added to a curd based gravy., ', 'images/53719323.jpg', 0, 'besan_gatta'),
(28, 'sev tamatar', 1, 1, 'Sev tameta nu shaak is a popular Gujarati style sweet and sour tomato curry prepared with tomato, sev, onion and other Indian curry spices.', 'images/sev-tameta-nu-shaak-recipe-1.jpg', 0, 'sev_tamatar'),
(29, 'Rajwadi Paneer', 1, 1, 'Rajputs hail from the Rajwadi region, which is renowned for its delicious cuisine flavours and variety. And Ghoomar beautifully accentuates these ideas. When it comes to chowing down on Rajasthani cuisine', 'images/download.jpg', 0, 'Rajwadi_Paneer'),
(30, 'Kair Sangri', 1, 1, 'Rajputs hail from the Rajwadi region, which is renowned for its delicious cuisine flavours and variety. And Ghoomar beautifully accentuates these ideas. When it comes to chowing down on Rajasthani cuisine', 'images/Ker-Sangri-2-3.jpg', 0, 'Kair_Sangri'),
(31, 'Banjara Dal', 1, 1, 'In a casual setting with folk music playing in the background, they serve classic vegetarian cuisine that really uplifts the atmosphere.', 'images/Dal-Banjara-jpg.webp', 0, 'Banjara_Dal'),
(32, 'Mirchi Vada', 1, 1, 'In a casual setting with folk music playing in the background, they serve classic vegetarian cuisine that really uplifts the atmosphere.', 'images/55836049.jpg', 0, 'Mirchi_Vada'),
(33, 'fish fry', 2, 1, 'The first in the list is Laal Maas. You can\'t talk about Rajasthani cuisine and skip this fiery red mutton dish. A crowd puller – this hot mutton dish gets its red colour from the red hot chillies and is rich in garlic.', 'images/Chettinad-fish-fry-1B.jpg', 0, 'fish_fry'),
(34, 'Laal Maas', 2, 1, 'The first in the list is Laal Maas. You can\'t talk about Rajasthani cuisine and skip this fiery red mutton dish. A crowd puller – this hot mutton dish gets its red colour from the red hot chillies and is rich in garlic.', 'images/53537462.webp', 0, 'Laal_Maas'),
(35, 'Banjara Gosht', 2, 1, 'Here are some authentic Rajasthani flavours infused into juicy mutton pieces to dazzle up your dining table. The meat is marinated in garlic, red chillies, turmeric and coriander and cooked till tender. The prominent taste of coriander adds that rustic touch to the dish.', 'images/AchariGosht.webp', 0, 'Banjara_Gosht'),
(36, 'Mohan Maas', 2, 1, 'For all those who are a fan of bland, but flavoured food will vouch for this one. It\'s a treat for all the non-vegetarians who love rich food. A dish that\'s straight from royal kitchen – Mohan Mass is cooked in milk and mild spices that make the meat tender and juicy. The dish further gets the flavour from Khus-Khus, cardamom and lemon.', 'images/download (1).jpg', 0, 'Mohan_Maas'),
(37, 'Safed Mass', 2, 1, 'Safed Maas is a true decadent version of a Korma and is called Lamb Korma in most of Rajasthani homes. For Safed Maas meat is cooked in a perfect concoction of spices like onion, garlic, ginger, pepper and cardamom in white creamy sauce. Don\'t go by its plain white colour, it is extremely rich and flavoured.', 'images/Safed_Maas_5.webp', 0, 'Safed_Mass'),
(38, 'Macchhilli Jaisamandi', 2, 1, 'Once you are done with tasting all the mutton delicacies you can jump over to have this fish based dish called Macchhilli Jaisamandi. For this dish, fish is cut and marinated in a green chutney and then further cooked in a spicy gravy comprising ginger, garlic, coriander and mint leaves. Mint leaves and ginger juliennes lend a freshness to the dish. Best served with hot steaming rice.', 'images/fish-curry-main_625x350_71421935397.webp', 0, 'Macchhilli_Jaisamandi'),
(39, 'Khandvi', 1, 3, 'Khandvi, also known as Patuli, Dahivadi or Suralichi Vadi, is a savory snack in the Maharashtrian cuisine as well as in the Gujarati cuisine of India. It consists of yellowish, tightly rolled bite-sized pieces and is primarily made of gram flour and yogurt', 'images/ff75422b53f60e10642b1df6e54f943d_Khandvi_with_sprouts_filling_Plating.jpg', 0, 'Khandvi'),
(40, 'Dabeli', 1, 3, 'Dabeli, kutchi dabeli or double roti, is a popular snack food of India, originating in the Gujarat region.', 'images/Dabeli-Recipe-Piping-Pot-Curry-500x500.webp', 0, 'Dabeli'),
(41, 'Dhokla', 1, 3, 'Dhokla is a savoury sponge dish that is native to the Indian state of Gujarat and parts of adjacent states, and is popular throughout the country. It is made with a fermented batter that is steamed to a cake-like consistency', 'images/Rasawala_Dhokla_.jpg', 0, 'Dhokla'),
(42, 'Handvo', 1, 3, 'Handvo is a savory vegetable cake originating from Gujarat, India. It is a part of the Gujarati cuisine. It is often made with a bottle gourd filling, though many other vegetables can be added. Sometimes crushed peanuts are also added', 'images/gujarati-handvo-recipe.jpg', 0, 'Handvo'),
(43, 'Khandvi', 1, 3, 'Khandvi, also known as Patuli, Dahivadi or Suralichi Vadi, is a savory snack in the Maharashtrian cuisine as well as in the Gujarati cuisine of India. It consists of yellowish, tightly rolled bite-sized pieces and is primarily made of gram flour and yogurt', 'images/instant-pot-gujarati-appetizer.webp', 0, 'Khandvi'),
(44, 'debra', 1, 3, 'debra, kutchi dabeli or double roti, is a popular snack food of India, originating in the Gujarat region.', 'images/bajri-methi-dhebra.jpg', 0, 'debra'),
(45, 'Masala Dhokla', 1, 3, 'Masala Dhokla is a savoury sponge dish that is native to the Indian state of Gujarat and parts of adjacent states, and is popular throughout the country. It is made with a fermented batter that is steamed to a cake-like consistency', 'images/88271804.webp', 0, 'Masala_Dhokla'),
(46, 'Handvo', 1, 3, 'Handvo is a savory vegetable cake originating from Gujarat, India. It is a part of the Gujarati cuisine. It is often made with a bottle gourd filling, though many other vegetables can be added. Sometimes crushed peanuts are also added', 'images/wp-15904113862194409347971837181251.webp', 0, 'Handvo'),
(47, 'Undhiyu', 1, 3, 'ndhiyu is a Gujarati mixed vegetable dish that is a regional specialty of Surat, Gujarat, India. The name of this dish comes from the Gujarati word  which translates to upside down, since the dish is traditionally cooked upside down underground in earthen pots, termed', 'images/undhiyu-pressure-cooker-indian.jpg', 0, 'Undhiyu'),
(48, 'Gujarati kadhi', 1, 3, 'Gujarati kadhi is a Gujarati version of kadhi. It is a very popular Gujarati dish made from buttermilk or dahi and gram flour. Kadhi is an essential part of Gujarati cuisine.', 'images/Gujarati-Kadhi-Piping-Pot-Curry-2-copy.webp', 0, 'Gujarati_kadhi'),
(49, 'Khakhra', 1, 3, 'Khakhra is a thin cracker common in the Gujarati cuisine of western India, It is made from mat bean, wheat flour and oil. It is served usually during breakfast', 'images/Thepla-Khakhra.webp', 0, 'Khakhra'),
(50, 'Thepla', 1, 3, 'Thepla is a soft Indian flatbread typical of Gujarati cuisine While extremely popular across Gujarat, it is especially common amongst the Jain community. It is served as breakfast,', 'images/methi-thepla-recipe.jpg', 0, 'Thepla'),
(51, 'Khaman', 1, 3, 'Khaman is a savoury snack from India that found fame in Gujarat. Khaman is made from ground channa daal or channa gram flour, usually with lemon juice, semolina, and curd.', 'images/cropped-khaman.jpg', 0, 'Khaman'),
(52, 'Basundi', 1, 3, 'Basundi is an Indian sweet mostly in Maharashtra, Gujarat, Andhra Pradesh, Telangana, Tamil Nadu and Karnataka. It is a sweetened condensed milk made by boiling milk on low heat until the milk is reduced by half. In North India, a similar dish goes by the name rabri..', 'images/basundi.jpg', 0, 'Basundi'),
(53, 'Dal dhokli', 1, 3, 'Daal dhokli is an Indian dish common in Rajasthani and Gujarati cuisine, made by boiling wheat flour pieces in a pigeon pea stew. A similar preparation is called varanfal,', 'images/Dal_Dhokali.jpg', 0, 'Dal_dhokli'),
(54, 'Meen Pollichathu', 2, 4, 'Meen pollichathu is one of the most popular dishes from the Syrian Christian community in Kerala. A must-eat in any local toddy shop (or makeshift drinking establishment), the dish is typically made with karimeen, or pearl spot fish, which is found in abundance in the waters of Kerala. (In the absence of karimeen, you can also use pomfret or mackerel.) An onion and tomato masala is slathered generously on the fish before it’s sealed in a banana leaf and cooked to perfection. Traditionally, the dish is paired with rice—but we also suggest grabbing a couple of beers to wash down all that fiery goodness, or you could go local and sample some toddy, an alcohol made from date palm.', 'images/meen-pollichathu-fish-pollichathu-tasty-kerala-dish-fish-with-masala-cooked-banana-leaf_527904-1658.avif', 0, 'Meen_Pollichathu'),
(55, 'Poriyal', 1, 4, 'The word poriyal is Tamil for fried or sauteed, but as expected, this dish goes by various names in different regions: palya in Kannada (Karnataka), vepudu in Telugu (Andhra Pradesh and Telangana), and mezhukupuratti in Malayalam (Kerala). To make it, you shallow fry diced or chopped vegetables and greens along with spices like mustard seeds, urad dal (black gram), onions, and vegetables, before further spices—often turmeric, dried red chilies, and coriander—are then added to the dish. In Tamil Nadu, shredded coconut is used as a dressing; elsewhere, poriyal serves as a popular side dish alongside the typical trio of rice with sambar, rasam, and yogurt.', 'images/68599406.webp', 0, 'Poriyal'),
(56, 'Chemmeen Manga Curry', 1, 4, 'Savour the delights of this tangy delicacy that will transport you straight to Kerala. Translating to a prawn mango curry, the addition of raw mangoes gives it a sour aftertaste, while the coconut milk adds body to the dish; some recipes also call for grated coconut as an alternative. Like most South Indian curry, it pairs perfectly with appam (a fermented rice pancake) or rice. (Matta, or red rice, is ideal here.) Perfect as an afternoon meal—followed by a siesta, of course.', 'images/chemmeen_shrimp-manga-curry.jpg', 0, 'Chemmeen_Manga_Curry'),
(57, 'Ghee Roast', 2, 4, 'A popular delicacy from Mangalore—Kundapur, to be more specific—ghee roast can be prepared with either mutton or chicken, and includes a spicy masala (a mix of byadagi chilies, cumin, peppercorns, clove, fenugreek, coriander, tamarind paste, and garlic). The region is known for its use of whole spices that are toasted and then ground to powder, imparting multiple layers of flavor and a heady aroma. (In all honesty, cook anything in ghee, or clarified butter, and it will turn to gold—what butter is to France, ghee is to India.) Pair this with neer dosa (a crepe made from rice batter) or appam (a fermented rice batter and coconut milk pancake) for a hearty experience; ditch the cutlery and be ready to use your hands.', 'images/ghee-roast.jpg', 0, 'Ghee_Roast'),
(58, 'Kori Gassi', 2, 4, 'Another Mangalorean specialty, kori gassi comes in a fiery red hue (the chilies impart the color—although that may seem daunting, the dish is mild), and is a chicken curry popular among the Bunt community of this coastal region in Karnataka. The thick curry is laced with notes of caramelized onions, coconut, and a spice paste of garlic, ginger, grated coconut, coriander, red chili, cumin, fenugreek, black peppercorns, and turmeric. The addition of tamarind lends it a much-needed depth, while the dish is traditionally enjoyed with kori roti (a flatbread made with rice flour) or neer dosa.', 'images/Kori-Gassi.jpg', 0, 'Kori_Gassi'),
(59, 'Pandi Curry', 2, 4, 'A popular delicacy in Coorg—a popular vacation spot for South Indians—pandi curry is a pork specialty that is hard to miss if you’re in the area. (Coorg is known for its lush green hills and coffee plantations, which also explains the tourists.) The dish has a distinct flavor of kachampuli extract that acts as a souring agent; although the extract is indigenous to the region, one can use tamarind extract to achieve a similar flavor profile. The meat is first cooked in its fat, before spices are added; it goes best with akki roti and a beer. ', 'images/Pandi-Curry.jpg', 0, 'Pandi_Curry'),
(60, 'Aloo Bonda ', 1, 4, 'South Indians have no shame in loving a fried treat at tea time—from fried eggplants and onions to potato chops and everything in between, give us a cup of chai to go along with it and we’re happy. Aloo bonda is the South Indian version of mashed potato chops, made with a filling of onions, curry leaves, spices, and a mixture of gram and rice flour before they’re tossed into a deep pan. Enjoy these with coriander or coconut chutney and some chai for maximum satisfaction.', 'images/PSX_20210920_215137-scaled-1-1300x1272.webp', 0, 'Aloo_Bonda '),
(61, 'Gongura Mutton ', 2, 4, 'Gongura mutton curry is a simple dish from Andhra Pradesh that goes well with piping hot rice. In this dish, the mutton is cooked with gongura leaves—although the recipe is quite simple, what makes this dish unique is the earthy, herbaceous taste that lowers the spice levels. Like most Indian dishes, however, the recipe differs depending on the region. ', 'images/download (3).jpg', 0, 'Gongura_Mutton '),
(62, 'Shikampuri Kebab', 2, 4, 'While most kebabs are cooked in the tandoor, shikampuri kebabs are fried. These delights from Hyderabad are a local favorite and feature a combination of chicken and dal (lentils) with a flavored yogurt filling in the center. While some might confuse shikampuri kebab with shammi kebabs due to its similarity in the recipe, the primary difference is the addition of malai (a sort of clotted cream) that makes it moist and delectable. A popular appetizer, these go perfectly with mint chutney.  ', 'images/Hyderabadi_Chicken_Shikampuri_Kebab_.jpg', 0, 'Shikampuri_Kebab '),
(63, 'Ambur Biryani', 2, 4, 'While the world is familiar with Hyderabadi biryani, don’t forget to try the elusive Ambur biryani too. (It dates all the way back to the 18th century, when it was first cooked by the Nawabs of Arcot in the Vellore district of Tamil Nadu.) Unlike most biryanis across India, this variant uses short grain rice called jeera samba and is cooked over a wood fire with red chili paste and whole spices like cloves, cinnamon, and cardamom. It also uses fresh herbs like mint and coriander and is served with accompaniments like ennai kathirikai, a spicy and sour eggplant curry, and raita, a yogurt side dish. Other than the Hyderabadi biryani, most South Indian biryanis tend to use short-grain rice. ', 'images/Ambur_Star_Chicken_Biryani_Recipe_.jpg', 0, 'Ambur_Biryani '),
(64, 'Puliyogare', 1, 4, 'Puliyogare, or tamarind rice, is a popular dish from Karnataka that serves as a staple for locals. Made with tamarind extract and dry spices, the recipe is quite simple, although as always it has many variants—namely puliyodarai, pulinchoru, pulihora, and kokum rice—and is popular across the states of Telangana, Andhra Pradesh, Kerala, and Tamil Nadu. There are two ways to prepare this dish: one where the rice is cooked and added to the tamarind sauce, the other where the raw rice is mixed in with the tamarind sauce and cooked off. This can be served with a number of accompaniments, but the typical ones are pappadam, potato fry, and raita.  ', 'images/8546644721_e9a5b7b313_z-500x375.jpg', 0, 'Puliyogare '),
(65, 'Pongal', 1, 4, 'Pongal in its typical definition is a heart-warming porridge made of rice and yellow lentils that can be prepared to be both sweet and savory. Laced with cumin, asafoetida, curry leaves, ginger, black pepper, and ghee, it is usually made during the popular Pongal festival or other Hindu celebrations in South India, where it is offered to the deities. On a regular day, however, one can find it in local restaurants across Tamil Nadu.  ', 'images/download (4).jpg', 0, 'Pongal '),
(66, 'Chicken Chettinad', 2, 4, 'One of the pillars of South Indian cuisine around the world, chicken chettinad is a popular dish that originated from the Narukottai Chettiar community, who hail from the Chettinad region in Tamil Nadu. The dish packs a punch: the chicken is slathered in a ginger, garlic, cumin, fennel, peppercorns, and red chili marinade that is then cooked off with onions, tomatoes, cinnamon sticks, and cloves, and pairs well with ghee rice.', 'images/Chicken-Chettinad-Featured.jpg', 0, 'Chicken_Chettinad '),
(67, 'nonveg-Hakka Noodles', 2, 5, 'Hakka Noodles Hakka noodles are wheat noodles tossed with chili sauce, egg, meat and vegetables—quintessential comfort food!', 'images/75356205.webp', 0, 'nonveg_Hakka_Noodles'),
(68, 'Hakka Noodles', 1, 5, 'Hakka Noodles Hakka noodles are wheat noodles tossed with chili sauce,vegetables—quintessential comfort food!', 'images/Hakka-Noodles-1.webp', 0, 'Hakka_Noodles'),
(69, 'Manchurian', 1, 5, 'deep fried cauliflower (gobi manchurian is one of our favourite', 'images/veg-manchurian.jpg', 0, 'Manchurian'),
(70, 'nonveg Manchurian', 2, 5, 'The gravy-based manchurian dishes often contain deep-fried chicken, prawns or mixed vegetable balls.', 'images/Chicken-Manchurian-10.webp', 0, 'nonveg_Manchurian'),
(71, 'Chicken Lollipops', 2, 5, 'Drums of Heaven are indeed one of those divine appetizers that you can never get enough of! On the podcast, Tanya explains how chicken drumsticks that are frenched, battered and deep fried until crisp and are typically served with a spicy dipping sauce alongside.', 'images/chicken-lollipop.jpg.webp', 0, 'Chicken_Lollipops'),
(72, 'Chilli Chicken', 2, 5, 'Drums of Heaven are indeed one of those divine appetizers that you can never get enough of! On the podcast, Tanya explains how chicken drumsticks that are frenched, battered and deep fried until crisp and are typically served with a spicy dipping sauce alongside.', 'images/Chili-chicken-Indo-Chinese-Piping-Pot-Curry.jpg', 0, 'Chilli_Chicken'),
(73, 'American Chopsuey', 2, 5, 'The Indian Chinese version of American Chopsuey  ironically neither American nor Chinese! It consists of deep fried crunchy noodles topped  julienned veggies , capsicum , carrots , a thick sweet-sour tomato based gravy. ', 'images/American-Chopsuey-1.jpg', 0, 'American_Chopsuey'),
(74, 'Prawns Toast', 2, 5, 'These crisp sesame-seeded triangles of deep fried bread smeared with prawn paste are hands down one of the best appetizers you can get at an Indian Chinese restaurant (along with chicken lollipops!) ', 'images/Prawn-Toast-square-FS-28.jpg', 0, 'Prawns_Toast'),
(75, 'Gulab jamun', 1, 1, 'Gulab jamun is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/gulab-jamun-recipe_9fb159dc2674f395436a64666227c988.jpeg', 0, 'Gulab_jamun'),
(76, 'Mysore pak', 1, 1, 'Mysore pak is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/53376135.webp', 0, 'Mysore_pak'),
(77, 'Barfi', 1, 1, 'Barfi is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/250-kaju-katli-barfi-pack-250g-indian-sweet-1-kaju-katli-delight-original-imag6ux78x3gnyfz.webp', 0, 'Barfi'),
(78, 'Gajar halwa', 1, 1, 'Gajar ka halwa is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Gajar-ka-Halwa-03-1024x683.webp', 0, 'Gajar_halwa'),
(79, 'Jalebi', 1, 1, 'Jalebi is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/53099699.webp', 0, 'Jalebi'),
(80, 'Kheer', 1, 1, 'Gulab jamun is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/kheer-feat.webp', 0, 'Kheer'),
(81, 'Laddu', 1, 1, 'Laddu is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/download (5).jpg', 0, 'Laddu'),
(82, 'Peda', 1, 2, 'Peda is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/peda-diwali-sweet-main.jpg', 0, 'Peda'),
(83, 'Kaju katli', 1, 2, 'Kaju katli is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/p-delicious-kaju-katli-400-gm--101059-m.jpg', 0, 'Kaju_katli'),
(84, 'Rasgulla', 1, 2, 'Rasgulla is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Rasgulla-Image-_3_1024x1024.webp', 0, 'Rasgulla'),
(85, 'Kulfi', 1, 2, 'Kulfi is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Badam_Elaichi_Kulfi_Recipe_With_Condensed_Milk-1.jpg', 0, 'Kulfi'),
(86, 'Modak', 1, 2, 'Modak is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/ganesh-chaturthi-modak-featured.jpg', 0, 'Modak'),
(87, 'Halwa', 1, 2, 'Halwa is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Amazing-Sooji-Halwa-1-1 (1).jpg', 0, 'Halwa'),
(88, 'Kalakand', 1, 2, 'Kalakand is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/51DnJdZ3uEL._AC_UF894,1000_QL80_.jpg', 0, 'Kalakand'),
(89, 'Sooji halwa', 1, 2, 'Sooji halwa is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/31234158333_488863af1d_z.jpg', 0, 'Sooji_halwa'),
(90, 'Besan Ladoo', 1, 2, 'Besan Ladoo is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Besan-Ladoo.jpg', 0, 'Besan_Ladoo'),
(91, 'Coconut burfi', 1, 3, 'Coconut burfi is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Coconut-Barfi-4-1.jpg', 0, 'Coconut_burfi'),
(92, 'Malpua', 1, 3, 'Malpua is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/img-20210322-wa0001-1616414957.jpg', 0, 'Malpua'),
(93, 'Rabri', 1, 3, 'Rabri is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/rabri-rabdi.jpg', 0, 'Rabri'),
(94, 'Rasmalai', 1, 3, 'Rasmalai is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/Rasmalai-Recipe.webp', 0, 'Rasmalai'),
(95, 'Chhena poda', 1, 3, 'Chhena poda is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/PaneerCheeseCake_RECIPE_101520_0597_VOG_final.webp', 0, 'Chhena_poda'),
(96, 'Ghevar', 1, 3, 'Ghevar is a sweet confectionary or dessert, originating in the Indian subcontinent and a type of mithai popular in India', 'images/ghevar-sweet.jpg', 0, 'Ghevar'),
(97, 'samosa', 1, 4, 'nice samosa', 'images/lake-balaton-847072_960_720.jpg', 0, 'samosa'),
(98, 'pokemon', 1, 2, 'nice', 'images/ashim-d-silva-JHUgc_HJN5Q-unsplash.jpg', 0, '12345'),
(99, 'pokemon', 1, 2, 'nice', 'images/ashim-d-silva-JHUgc_HJN5Q-unsplash.jpg', 0, '12345'),
(100, 'pokemon', 1, 2, 'nice', 'images/ashim-d-silva-JHUgc_HJN5Q-unsplash.jpg', 0, '12345'),
(101, 'pokemon', 1, 2, 'nice', 'images/ashim-d-silva-JHUgc_HJN5Q-unsplash.jpg', 0, '12345'),
(102, 'pokemon', 1, 2, 'nice', 'images/ashim-d-silva-JHUgc_HJN5Q-unsplash.jpg', 0, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `main_category`
--

CREATE TABLE `main_category` (
  `id` int(8) NOT NULL,
  `cat_name` varchar(240) NOT NULL,
  `cat_desc` text NOT NULL,
  `cat_image` varchar(240) NOT NULL,
  `alias` varchar(88) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_category`
--

INSERT INTO `main_category` (`id`, `cat_name`, `cat_desc`, `cat_image`, `alias`) VALUES
(1, 'Vegetarian', '', '', 'Vegetarian'),
(2, 'Non-Vegetarian', '', '', 'Non_Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `meals_cat`
--

CREATE TABLE `meals_cat` (
  `id` int(8) NOT NULL,
  `meals_name` varchar(240) NOT NULL,
  `meals_desc` text NOT NULL,
  `alias` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meals_cat`
--

INSERT INTO `meals_cat` (`id`, `meals_name`, `meals_desc`, `alias`) VALUES
(1, 'BreakFast', '', 'BreakFast'),
(2, 'Brunch', '', 'Brunch'),
(3, 'Lunch', '', 'Lunch'),
(4, 'Dinner', '', 'Dinner'),
(5, 'Sweet Dish', '', 'sweet_dish');

-- --------------------------------------------------------

--
-- Table structure for table `plate_size_record`
--

CREATE TABLE `plate_size_record` (
  `id` int(8) NOT NULL,
  `food_menu_id` int(8) NOT NULL,
  `plate_size` varchar(88) NOT NULL,
  `price` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plate_size_record`
--

INSERT INTO `plate_size_record` (`id`, `food_menu_id`, `plate_size`, `price`) VALUES
(1, 1, 'Half Plate', 287),
(2, 1, 'Full Plate', 1145),
(3, 1, 'Quater Plate', 117),
(6, 2, 'Half Plate', 948),
(7, 2, 'Full Plate', 139),
(8, 3, 'Half Plate', 974),
(9, 3, 'Full Plate', 103),
(10, 4, 'Half  Plate', 752),
(11, 4, 'Full Plate', 201),
(12, 5, 'Half Plate', 839),
(13, 5, 'Full Plate', 393),
(14, 6, 'Half Plate', 940),
(15, 6, 'Full Plate', 170),
(16, 7, 'Half Plate', 889),
(17, 7, 'Full Plate', 189),
(18, 8, ' Half Plate', 906),
(19, 8, ' Full Plate', 62),
(20, 9, 'Half Plate', 815),
(21, 9, 'Full Plate', 490),
(22, 10, 'Half Plate', 723),
(23, 10, 'Full Plate', 246),
(24, 11, 'Half Plate', 782),
(25, 11, 'Full Plate', 274),
(26, 12, ' Half Plate', 742),
(27, 12, 'Full Plate', 491),
(28, 13, 'Half Plate', 948),
(29, 13, 'Full Plate', 366),
(30, 14, 'Half Plate', 706),
(31, 14, 'full Plate', 36),
(32, 15, 'Half Plate', 779),
(33, 15, 'Full Plate', 389),
(34, 16, 'Half Plate', 829),
(35, 16, 'Full Plate', 78),
(36, 17, 'Half Plate', 1125),
(37, 17, 'Full Plate', 492),
(38, 18, 'Half Plate', 802),
(39, 18, 'Full Plate', 138),
(40, 19, 'Half Plate', 1004),
(41, 19, 'Full Plate', 208),
(42, 20, 'Half Plate', 746),
(43, 20, 'Full Plate', 207),
(44, 21, 'Half Plate', 1017),
(45, 21, 'Full Plate', 65),
(46, 22, 'Half Plate', 994),
(47, 22, 'Full Plate', 374),
(48, 23, 'Half Plate', 1110),
(49, 23, 'Full Plate', 30),
(50, 24, 'Half Plate', 1039),
(51, 24, 'Full Plate', 205),
(52, 25, 'Half Plate', 1130),
(53, 25, 'Full Plate', 135),
(54, 26, 'Half Plate', 1005),
(55, 26, 'Full Plate', 222),
(56, 27, 'Half Plate', 815),
(57, 27, 'Full Plate', 11),
(58, 28, 'Half Plate', 828),
(59, 28, 'Full Plate', 210),
(60, 29, 'Half Plate', 787),
(61, 29, 'Full Plate', 405),
(62, 30, 'Half Plate', 883),
(63, 30, 'Full Plate', 300),
(64, 31, 'Half Plate', 1074),
(65, 31, 'Full Plate', 69),
(66, 32, 'Half Plate', 843),
(67, 32, 'Full Plate', 111),
(68, 33, 'Half Plate', 744),
(69, 33, 'Full Plate', 486),
(70, 34, 'Half Plate', 921),
(71, 34, 'Full Plate', 248),
(72, 35, 'Half Plate', 698),
(73, 35, 'Full Plate', 347),
(74, 36, 'Half Plate', 860),
(75, 36, 'Full Plate', 362),
(76, 37, 'Half Plate', 947),
(77, 37, 'Full Plate', 250),
(78, 38, 'Half Plate', 1132),
(79, 38, 'Full Plate', 7),
(80, 39, 'Half Plate', 863),
(81, 39, 'Full Plate', 393),
(82, 40, 'Half Plate', 1097),
(83, 40, 'Full Plate', 408),
(84, 41, 'Half Plate', 968),
(85, 41, 'Full Plate', 218),
(86, 42, 'Half Plate', 903),
(87, 42, 'Full Plate', 465),
(88, 43, 'Half Plate', 836),
(89, 43, 'Full Plate', 386),
(90, 44, 'Half Plate', 1141),
(91, 44, 'Full Plate', 148),
(92, 45, 'Half Plate', 1035),
(93, 45, 'Full Plate', 335),
(94, 46, 'Half Plate', 789),
(95, 46, 'Full Plate', 42),
(96, 47, 'Half Plate', 1062),
(97, 47, 'Full Plate', 284),
(98, 48, 'Half Plate', 956),
(99, 48, 'Full Plate', 30),
(100, 49, 'Half Plate', 999),
(101, 49, 'Full Plate', 7),
(102, 50, 'Half Plate', 760),
(103, 50, 'Full Plate', 379),
(104, 51, ' Half Plate', 837),
(105, 51, 'Full Plate', 146),
(106, 52, 'Half Plate', 938),
(107, 52, 'Full Plate', 355),
(108, 53, 'Half plate', 683),
(109, 53, 'Full Plate', 449),
(110, 54, ' Half Plate', 917),
(111, 54, 'Full Plate', 339),
(112, 55, 'Half Plate', 1165),
(113, 55, 'Full Plate', 406),
(114, 56, 'Half Plate', 758),
(115, 56, 'Full Plate', 171),
(116, 57, ' Half Plate', 802),
(117, 57, 'Full Plate', 99),
(118, 58, 'Half Plate', 806),
(119, 58, 'Full Plate', 337),
(120, 59, 'Half Plate', 987),
(121, 59, 'Full Plate', 22),
(122, 60, 'Half Plate', 991),
(123, 60, 'Full Plate', 390),
(124, 61, 'Half Plate', 1428),
(125, 61, ' Full Plate', 219),
(126, 62, 'Half Plate', 1261),
(127, 62, 'Full Plate', 151),
(128, 63, 'Half Plate', 1169),
(129, 63, 'Full\r\nPlate', 396),
(130, 64, 'Half Plate', 1171),
(131, 64, 'Full Plate', 170),
(132, 65, 'Half Plate', 1035),
(133, 65, 'Full Plate', 167),
(134, 66, 'Half Plate', 931),
(135, 66, 'Full Plate', 156),
(136, 67, 'Half Plate', 1184),
(137, 67, 'Full Plate', 454),
(138, 68, 'Half Plate', 917),
(139, 68, 'Full Plate', 225),
(140, 69, 'Half Plate', 1075),
(141, 69, 'Full Plate', 201),
(142, 70, 'Half Plate', 981),
(143, 70, 'Full Plate', 302),
(144, 71, 'Half Plate', 1266),
(145, 71, 'Full Plate', 427),
(146, 72, 'Half Plate', 1035),
(147, 72, 'Full Plate', 397),
(148, 73, 'Half Plate', 1079),
(149, 73, 'Full Plate', 205),
(150, 74, 'Half Plate', 988),
(151, 74, 'Full Plate', 326),
(152, 75, 'Half Plate', 866),
(153, 75, 'Full Plate', 353),
(154, 76, 'Half Plate', 868),
(155, 76, 'Full Plate', 283),
(156, 77, 'Half Plate', 1008),
(157, 77, 'Full Plate', 195),
(158, 78, 'Half Plate', 1150),
(159, 78, 'Full Plate', 165),
(160, 79, 'Half Plate', 1078),
(161, 79, 'Full Plate', 393),
(162, 80, 'Half Plate', 931),
(163, 80, 'Full Plate', 477),
(164, 81, 'Half Plate', 1292),
(165, 81, 'Full Plate', 29),
(166, 82, 'Half Plate', 970),
(167, 82, 'Full Plate', 262),
(168, 83, 'Half Plate', 1102),
(169, 83, 'Full Plate', 224),
(170, 84, 'Half Plate', 1263),
(171, 84, 'Full Plate', 396),
(172, 85, 'Half Plate', 1392),
(173, 85, 'Full Plate', 22),
(174, 86, 'Half Plate', 884),
(175, 86, 'Full Plate', 354),
(176, 87, 'Half Plate', 1070),
(177, 87, 'Full Plate', 37),
(178, 88, 'Half Plate', 778),
(179, 88, 'Full Plate', 26),
(180, 89, 'Half Plate', 898),
(181, 89, 'Full Plate', 164),
(182, 90, 'Half Plate', 873),
(183, 90, 'Full Plate', 377),
(184, 91, 'Half Plate', 966),
(185, 91, 'Full Plate', 201),
(186, 92, 'Half Plate', 1056),
(187, 92, 'Full Plate', 430),
(188, 93, 'Half Plate', 929),
(189, 93, 'Full  Plate', 359),
(202, 93, 'Quater Plate', 800);

-- --------------------------------------------------------

--
-- Table structure for table `session_records`
--

CREATE TABLE `session_records` (
  `id` int(8) NOT NULL,
  `session_start_date` varchar(240) NOT NULL,
  `session_start_time` varchar(240) NOT NULL,
  `session_end_date` varchar(240) NOT NULL,
  `session_end_time` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `state_food`
--

CREATE TABLE `state_food` (
  `id` int(8) NOT NULL,
  `state_name` varchar(240) NOT NULL,
  `alias` varchar(240) NOT NULL,
  `state_desc` text NOT NULL,
  `state_image` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state_food`
--

INSERT INTO `state_food` (`id`, `state_name`, `alias`, `state_desc`, `state_image`) VALUES
(1, 'Rajasthan', 'rajasthan', '', ''),
(2, 'Punjab', 'punjab', '', ''),
(3, 'Gujrat', 'gujrat', '', ''),
(4, 'South Indian', 'south_indian', '', ''),
(5, 'Chinese', 'chinese', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `token`, `role`) VALUES
(1, 'yash', 'yash@gmail.com', '12345', 'dcqHArxQqBQ7G0rZH2enxIDwvb6BOQsZf1ESYN9fDA4yKdAvCE', 'admin'),
(2, 'sourav', 'sourav@gmail.com', '12345Yash!@#', 'YpCgcki12ZegsG7PCTDlfQShpeK6bpAKDN2FZysZYCRdORuXsS', 'user'),
(3, 'sourav', 'sourav@gmail.com', '12345Yash!@#', '60wMdYhpihU9uZduxFUZWG11byH1pTBxVkCKMRZj0MPk4B2CZE', 'user'),
(4, 'sourav', 'sourav@gmail.com', '12345Yash!@#', 'LrPlWdrEHqV1fCtb0Kh7LP4LRyxFDvTTPmbSVHcrWsikABHpN2', 'user'),
(5, 'sourav', 'sourav@gmail.com', '12345Yash!@#', 'gW6Up5Ofsns8lA2JuIHoMCMLPZ0eqVtVHQm87mTQYZQpOoG1iG', 'user'),
(6, 'kalid', 'kalid@gmail.com', 'Kalid123!@#', 'ay0cN9FCoWGldNNmISUhXW6ifViEZR7Lxzo92K9t3a3e5pPEBo', 'user'),
(7, 'sanju', 'sanju@gmail.com', 'Yash!@#123', 'YxaGN3pBZTt7ihbx1yDo59rJfakwj65ZM61RX0r95f67vWZs4U', 'user'),
(8, 'he', 'he@gmail.com', '12345', 'VLdUa1JXtATyzBtt0xNZzwvcvVbjCThka4mlbRee4sz84WVEi2', 'user'),
(9, 'hello', 'hello@gmail.com', '2002', '28CgzUAoMArGcMREoCgJvJaPb7bUniMqPSzhfHJbpV4vgzjNKk', 'user'),
(10, 'rahul', 'rahul@gmail.com', '$2y$10$aHmtsVS6TKTmxcTGW.j3luK.SGTEcYkkch6cMq7Ybeu', '1ecd58e6832a26692eff61e5fe31f7d891c65284abdf676a2a', 'user'),
(11, 'hello', 'hello@gmail.com', '$2y$10$/BL5EzPXLq2nezYzkNPM9Oi1nVbKVyrqE3FImtjnl8l', '13321ba8bea2fd8b8a2b1fad5b8dcb357b4c4c6fe54720fd81', 'user'),
(12, 'kahild', 'hello@gmail.com', '$2y$10$z.EwGZVRnr2NBH3UbOhv3OBSYbWzosueNkuiyw5q4JI', 'e3fe52710c83de85b0c43410ae999f76f1f71bc7693a140f45', 'user'),
(13, 'rose', 'rose@gmail.com', '12345', 'ughcBv6ONeRDhH3BHSG2KjxF6wgWFdgoWuDrJEnJLiCC9aa2dM', 'user');

-- --------------------------------------------------------

--
-- Structure for view `food_all_details`
--
DROP TABLE IF EXISTS `food_all_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `food_all_details`  AS  (select `food_details`.`food_name` AS `food_name`,`food_details`.`food_desc` AS `food_desc`,`food_details`.`food_image` AS `food_image`,`food_details`.`food_menu_alias` AS `food_menu_alias`,`food_details`.`cat_name` AS `cat_name`,`food_details`.`cat_desc` AS `cat_desc`,`food_details`.`cat_image` AS `cat_image`,`food_details`.`state_name` AS `state_name`,`food_details`.`state_alias` AS `state_alias`,`food_details`.`state_desc` AS `state_desc`,`food_details`.`state_image` AS `state_image`,`meals_cat`.`meals_name` AS `meals_name`,`meals_cat`.`meals_desc` AS `meals_desc`,`plate_size_record`.`plate_size` AS `plate_size`,`plate_size_record`.`price` AS `price` from (((`food_details` join `food_meal_cat` on(`food_details`.`id` = `food_meal_cat`.`food_menu_id`)) join `meals_cat` on(`food_meal_cat`.`food_meal_type` = `meals_cat`.`id`)) join `plate_size_record` on(`plate_size_record`.`food_menu_id` = `food_details`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `food_details`
--
DROP TABLE IF EXISTS `food_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `food_details`  AS  (select `food_menu`.`id` AS `id`,`food_menu`.`food_name` AS `food_name`,`food_menu`.`food_desc` AS `food_desc`,`food_menu`.`food_image` AS `food_image`,`food_menu`.`alias` AS `food_menu_alias`,`main_category`.`cat_name` AS `cat_name`,`main_category`.`cat_desc` AS `cat_desc`,`main_category`.`cat_image` AS `cat_image`,`state_food`.`state_name` AS `state_name`,`state_food`.`alias` AS `state_alias`,`state_food`.`state_desc` AS `state_desc`,`state_food`.`state_image` AS `state_image` from ((`food_menu` join `main_category` on(`food_menu`.`food_main_cat` = `main_category`.`id`)) join `state_food` on(`food_menu`.`food_state_cat` = `state_food`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `food_meal_details`
--
DROP TABLE IF EXISTS `food_meal_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `food_meal_details`  AS  (select `food_details`.`food_name` AS `food_name`,`food_details`.`food_desc` AS `food_desc`,`food_details`.`food_image` AS `food_image`,`food_details`.`food_menu_alias` AS `food_menu_alias`,`food_details`.`cat_name` AS `cat_name`,`food_details`.`cat_desc` AS `cat_desc`,`food_details`.`cat_image` AS `cat_image`,`food_details`.`state_name` AS `state_name`,`food_details`.`state_alias` AS `state_alias`,`food_details`.`state_desc` AS `state_desc`,`food_details`.`state_image` AS `state_image`,`meals_cat`.`meals_name` AS `meals_name`,`meals_cat`.`meals_desc` AS `meals_desc` from ((`food_details` join `food_meal_cat` on(`food_details`.`id` = `food_meal_cat`.`food_menu_id`)) join `meals_cat` on(`food_meal_cat`.`food_meal_type` = `meals_cat`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_meal_cat`
--
ALTER TABLE `food_meal_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_menu`
--
ALTER TABLE `food_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_category`
--
ALTER TABLE `main_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meals_cat`
--
ALTER TABLE `meals_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plate_size_record`
--
ALTER TABLE `plate_size_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state_food`
--
ALTER TABLE `state_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `food_meal_cat`
--
ALTER TABLE `food_meal_cat`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `food_menu`
--
ALTER TABLE `food_menu`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `main_category`
--
ALTER TABLE `main_category`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meals_cat`
--
ALTER TABLE `meals_cat`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plate_size_record`
--
ALTER TABLE `plate_size_record`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `state_food`
--
ALTER TABLE `state_food`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
