/*
SQLyog Trial v13.1.1 (64 bit)
MySQL - 8.0.13 : Database - shc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `appoinment_slot` */

DROP TABLE IF EXISTS `appoinment_slot`;

CREATE TABLE `appoinment_slot` (
  `appoinment_slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `appoinment_slot_time` varchar(45) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`appoinment_slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19;

/*Data for the table `appoinment_slot` */

insert  into `appoinment_slot`(`appoinment_slot_id`,`appoinment_slot_time`,`doctor_id`) values 
(1,'9 AM to 10 AM',1),
(2,'10 AM to 11 AM',1),
(3,'11 AM to 12 PM',1),
(4,'1 PM to 2 PM',2),
(5,'2 PM to 3 PM',2),
(6,'3 PM to 4 PM',2),
(7,'10 AM to 11 AM',3),
(8,'11 AM to 12 PM',3),
(9,'1 PM to 2 PM',3),
(10,'2 PM to 3 PM',3),
(11,'3 PM to 4 PM',3),
(12,'2 PM to 3 PM',4),
(13,'3 PM to 4 PM',4),
(14,'10 AM to 11 AM',5),
(15,'11 AM to 12 PM',5),
(16,'1 PM to 2 PM',5),
(17,'2 PM to 3 PM',5),
(18,'3 PM to 4 PM',5);

/*Table structure for table `appoinments` */

DROP TABLE IF EXISTS `appoinments`;

CREATE TABLE `appoinments` (
  `appoinments_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  `doctor` varchar(45) DEFAULT NULL,
  `slot` varchar(45) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `current_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`appoinments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

/*Data for the table `appoinments` */

insert  into `appoinments`(`appoinments_id`,`name`,`address`,`contact_number`,`disease`,`doctor`,`slot`,`transaction_id`,`doctor_id`,`slot_id`,`current_date`) values 
(1,'Banee Ishaque K','Assets','9446827218','hypertension','D1','9AM to 10 PM',410,1,1,'27-10-2015');

/*Table structure for table `disease` */

DROP TABLE IF EXISTS `disease`;

CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=593;

/*Data for the table `disease` */

insert  into `disease`(`disease_id`,`disease_name`) values 
(444,'hypertensive disease'),
(445,'diabetes'),
(446,'depression mental'),
(447,'depressive disorder'),
(448,'coronary arteriosclerosis'),
(449,'coronary heart disease'),
(450,'pneumonia'),
(451,'failure heart congestive'),
(452,'accident cerebrovascular'),
(453,'asthma'),
(454,'myocardial infarction'),
(455,'hypercholesterolemia'),
(456,'infection'),
(457,'infection urinary tract'),
(458,'anemia'),
(459,'chronic obstructive airway disease'),
(460,'dementia'),
(461,'insufficiency renal'),
(462,'confusion'),
(463,'degenerative polyarthritis'),
(464,'hypothyroidism'),
(465,'anxiety state'),
(466,'malignant neoplasms'),
(467,'primary malignant neoplasm'),
(468,'acquired immuno-deficiency syndrome'),
(469,'HIV'),
(470,'hiv infections'),
(471,'cellulitis'),
(472,'gastroesophageal reflux disease'),
(473,'septicemia'),
(474,'systemic infection'),
(475,'sepsis (invertebrate)'),
(476,'deep vein thrombosis'),
(477,'dehydration'),
(478,'neoplasm'),
(479,'embolism pulmonary'),
(480,'epilepsy'),
(481,'cardiomyopathy'),
(482,'chronic kidney failure'),
(483,'carcinoma'),
(484,'hepatitis C'),
(485,'peripheral vascular disease'),
(486,'psychotic disorder'),
(487,'hyperlipidemia'),
(488,'bipolar disorder'),
(489,'obesity'),
(490,'ischemia'),
(491,'cirrhosis'),
(492,'exanthema'),
(493,'benign prostatic hypertrophy'),
(494,'kidney failure acute'),
(495,'mitral valve insufficiency'),
(496,'arthritis'),
(497,'bronchitis'),
(498,'hemiparesis'),
(499,'osteoporosis'),
(500,'transient ischemic attack'),
(501,'adenocarcinoma'),
(502,'paranoia'),
(503,'pancreatitis'),
(504,'incontinence'),
(505,'paroxysmal dyspnea'),
(506,'hernia'),
(507,'malignant neoplasm of prostate'),
(508,'carcinoma prostate'),
(509,'edema pulmonary'),
(510,'lymphatic diseases'),
(511,'stenosis aortic valve'),
(512,'malignant neoplasm of breast'),
(513,'carcinoma breast'),
(514,'schizophrenia'),
(515,'diverticulitis'),
(516,'overload fluid'),
(517,'ulcer peptic'),
(518,'osteomyelitis'),
(519,'gastritis'),
(520,'bacteremia'),
(521,'failure kidney'),
(522,'sickle cell anemia'),
(523,'failure heart'),
(524,'upper respiratory infection'),
(525,'hepatitis'),
(526,'hypertension pulmonary'),
(527,'deglutition disorder'),
(528,'gout'),
(529,'thrombocytopaenia'),
(530,'hypoglycemia'),
(531,'pneumonia aspiration'),
(532,'colitis'),
(533,'diverticulosis'),
(534,'suicide attempt'),
(535,'Pneumocystis carinii pneumonia'),
(536,'hepatitis B'),
(537,'parkinson disease'),
(538,'lymphoma'),
(539,'hyperglycemia'),
(540,'encephalopathy'),
(541,'tricuspid valve insufficiency'),
(542,'Alzheimer\'s disease'),
(543,'candidiasis'),
(544,'oralcandidiasis'),
(545,'neuropathy'),
(546,'kidney disease'),
(547,'fibroid tumor'),
(548,'glaucoma'),
(549,'neoplasm metastasis'),
(550,'malignant tumor of colon'),
(551,'carcinoma colon'),
(552,'ketoacidosis diabetic'),
(553,'tonic-clonic epilepsy'),
(554,'tonic-clonic seizures'),
(555,'malignant neoplasms'),
(556,'respiratory failure'),
(557,'melanoma'),
(558,'gastroenteritis'),
(559,'malignant neoplasm of lung'),
(560,'carcinoma of lung'),
(561,'manic disorder'),
(562,'personality disorder'),
(563,'primary carcinoma of the liver cells'),
(564,'emphysema pulmonary'),
(565,'hemorrhoids'),
(566,'spasm bronchial'),
(567,'aphasia'),
(568,'obesity morbid'),
(569,'pyelonephritis'),
(570,'endocarditis'),
(571,'effusion pericardial'),
(572,'pericardial effusion body substance'),
(573,'chronic alcoholic intoxication'),
(574,'pneumothorax'),
(575,'delirium'),
(576,'neutropenia'),
(577,'hyperbilirubinemia'),
(578,'influenza'),
(579,'dependence'),
(580,'thrombus'),
(581,'cholecystitis'),
(582,'hernia hiatal'),
(583,'migraine disorders'),
(584,'pancytopenia'),
(585,'cholelithiasis'),
(586,'biliary calculus'),
(587,'tachycardia sinus'),
(588,'ileus'),
(589,'adhesion'),
(590,'delusion'),
(591,'affect labile'),
(592,'decubitus ulcer');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(45) DEFAULT NULL,
  `doctor_address` varchar(150) DEFAULT NULL,
  `doctor_designation` varchar(45) DEFAULT NULL,
  `doctor_working_hospital` varchar(45) DEFAULT NULL,
  `doctor_available_time` varchar(45) DEFAULT NULL,
  `doctor_certificate_id` varchar(45) DEFAULT NULL,
  `doctor_working_clinic` varchar(45) DEFAULT NULL,
  `doctor_consultation_fee` double DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6;

/*Data for the table `doctor` */

insert  into `doctor`(`doctor_id`,`doctor_name`,`doctor_address`,`doctor_designation`,`doctor_working_hospital`,`doctor_available_time`,`doctor_certificate_id`,`doctor_working_clinic`,`doctor_consultation_fee`) values 
(1,'D1','D1 address','D1 designation','D1 working hospital','9 AM to 12 PM','D1 certificate ID','D1 working clinic',500),
(2,'D2','D2 address','D2 designation','D2 working hospital','1 PM to 4 PM','D2 certificate ID','D2 working clinic',300),
(3,'D3','D3 address','D3 designation','D3 working hospital','10 AM to 4 PM','D3 certificate ID','D3 working clinic',200),
(4,'D4','D4 address','D4 designation','D4 working hospital','2 PM to 4 PM','D4 certificate ID','D4 working clinic',100),
(5,'D5','D5 address','D4 designation','D5 working hospital','10 AM to 2 PM','D5 certificate ID','D5 working clinic',150);

/*Table structure for table `doctor_disease` */

DROP TABLE IF EXISTS `doctor_disease`;

CREATE TABLE `doctor_disease` (
  `doctor_disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` varchar(45) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doctor_disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26;

/*Data for the table `doctor_disease` */

insert  into `doctor_disease`(`doctor_disease_id`,`doctor_id`,`disease`) values 
(1,'1','hypertensive disease'),
(2,'1','diabetes'),
(3,'1','pneumonia'),
(4,'1','anemia'),
(5,'1','cellulitis'),
(6,'2','arthritis'),
(7,'2','gastritis'),
(8,'2','sickle cell anemia'),
(9,'2','hepatitis B'),
(10,'2','kidney disease'),
(11,'3','decubitus ulcer'),
(12,'3','affect labile'),
(13,'3','accident cerebrovascular'),
(14,'3','ileus'),
(15,'3','transient ischemic attack'),
(16,'4','lymphatic diseases'),
(17,'4','malignant neoplasm of breast'),
(18,'4','bacteremia'),
(19,'4','upper respiratory infection'),
(20,'4','hypoglycemia'),
(21,'5','hepatitis B'),
(22,'5','lymphoma'),
(23,'5','malignant tumor of colon'),
(24,'5','thrombus'),
(25,'5','influenza');

/*Table structure for table `doctor_diseases` */

DROP TABLE IF EXISTS `doctor_diseases`;

CREATE TABLE `doctor_diseases` (
  `doctor_diseases_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctor_diseases_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26;

/*Data for the table `doctor_diseases` */

insert  into `doctor_diseases`(`doctor_diseases_id`,`doctor_id`,`disease_id`) values 
(1,1,444),
(2,1,445),
(3,1,450),
(4,1,458),
(5,1,471),
(6,2,496),
(7,2,519),
(8,2,522),
(9,2,536),
(10,2,546),
(11,3,592),
(12,3,591),
(13,3,452),
(14,3,588),
(15,3,500),
(16,4,510),
(17,4,512),
(18,4,520),
(19,4,524),
(20,4,530),
(21,5,536),
(22,5,538),
(23,5,550),
(24,5,580),
(25,5,578);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
