-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smarthome
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Board`
--

DROP TABLE IF EXISTS `Board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Board` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(125) NOT NULL,
  `Writer` varchar(50) DEFAULT NULL,
  `Title` varchar(250) NOT NULL,
  `Contents` longtext NOT NULL,
  `PostDate` datetime DEFAULT NULL,
  `ReadCount` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Board`
--

LOCK TABLES `Board` WRITE;
/*!40000 ALTER TABLE `Board` DISABLE KEYS */;
INSERT INTO `Board` VALUES (1,'alice@example.com',NULL,'처음 인사드립니다','이 게시판에 처음 글 써봐요.','2025-05-12 00:00:00',123),(2,'bob@example.com',NULL,'정보 공유합니다','유용한 정보 발견해서 공유해요.','2025-06-01 00:00:00',42),(3,'carol@example.com',NULL,'오늘 하루','오늘 하루는 정말 길었네요.','2025-05-22 00:00:00',87),(4,'david@example.com',NULL,'안녕하세요!','모두 반가워요~','2025-05-30 00:00:00',3),(5,'emma@example.com',NULL,'질문 있어요','이 기능은 어떻게 사용하나요?','2025-05-28 00:00:00',198),(6,'frank@example.com',NULL,'좋은 하루 되세요','오늘도 파이팅입니다!','2025-06-02 00:00:00',55),(7,'grace@example.com',NULL,'새로운 시작','이제부터 열심히 해볼게요.','2025-05-20 00:00:00',233),(8,'henry@example.com',NULL,'공지 확인','공지사항 잘 읽었습니다.','2025-06-03 00:00:00',412),(9,'ivy@example.com',NULL,'오류 발생','무언가 잘 안돼요 도와주세요.','2025-05-27 00:00:00',129),(10,'jack@example.com',NULL,'이벤트 참여','이벤트 신청했습니다!','2025-05-15 00:00:00',88),(11,'kate@example.com',NULL,'오늘 날씨 어때요?','비가 오려나요?','2025-06-04 00:00:00',12),(12,'leo@example.com',NULL,'출석 체크','오늘도 들어왔어요~','2025-06-01 00:00:00',75),(13,'mia@example.com',NULL,'좋은 글 감사합니다','덕분에 많이 배웠습니다.','2025-05-29 00:00:00',211),(14,'nate@example.com',NULL,'개발자 모임?','혹시 개발자분들 계신가요?','2025-05-16 00:00:00',300),(15,'olivia@example.com',NULL,'사진 공유해요','여행 사진 몇 장 올려요!','2025-05-19 00:00:00',177),(16,'paul@example.com',NULL,'영화 후기','어벤져스 봤는데 재밌네요.','2025-06-03 00:00:00',411),(17,'quinn@example.com',NULL,'책 추천해주세요','요즘 읽을 책이 없어요.','2025-05-25 00:00:00',68),(18,'rachel@example.com',NULL,'자기소개','저는 부산에 살고 있어요.','2025-05-30 00:00:00',150),(19,'sam@example.com',NULL,'버그 제보','버튼이 작동 안 해요.','2025-05-28 00:00:00',99),(20,'tina@example.com',NULL,'출첵~','오늘도 로그인!','2025-06-02 00:00:00',210),(21,'ursula@example.com',NULL,'기능 문의','검색 기능은 어디 있나요?','2025-05-18 00:00:00',66),(22,'victor@example.com',NULL,'리뷰 남겨요','이 웹사이트 좋아요.','2025-05-23 00:00:00',324),(23,'wendy@example.com',NULL,'아무말 대잔치','그냥 심심해서 글 써요.','2025-06-01 00:00:00',54),(24,'xander@example.com',NULL,'질문입니다','프로필 사진은 어떻게 바꿔요?','2025-05-17 00:00:00',99),(25,'yuna@example.com',NULL,'응원합니다!','운영자님 화이팅!!','2025-06-04 00:00:00',295),(26,'zack@example.com',NULL,'이벤트 문의','당첨자는 언제 발표되나요?','2025-05-21 00:00:00',139),(27,'ana@example.com',NULL,'건의사항 있어요','이런 기능이 있었으면 해요.','2025-06-03 00:00:00',170),(28,'ben@example.com',NULL,'다들 안녕하세요','반가워요 여러분!','2025-05-24 00:00:00',60),(29,'cindy@example.com',NULL,'도움이 필요해요','이 코드에서 오류가 나요.','2025-05-31 00:00:00',222),(30,'dan@example.com',NULL,'공지 읽음','업데이트 감사합니다.','2025-06-01 00:00:00',78),(31,'elena@example.com',NULL,'사진 첨부 방법','이미지는 어떻게 올리죠?','2025-05-20 00:00:00',33),(32,'felix@example.com',NULL,'운영자님께','버그 좀 봐주세요.','2025-05-27 00:00:00',184),(33,'gina@example.com',NULL,'하이루~','글 남기고 갑니다!','2025-05-26 00:00:00',312),(34,'hank@example.com',NULL,'글 수정 가능?','작성한 글 수정할 수 있나요?','2025-05-14 00:00:00',108),(35,'irene@example.com',NULL,'글 삭제?','삭제 기능이 안 보여요.','2025-05-13 00:00:00',72),(36,'jon@example.com',NULL,'모바일 좋아요','모바일에서도 잘 보이네요.','2025-06-03 00:00:00',59),(37,'kyle@example.com',NULL,'디자인 칭찬','UI가 깔끔해요.','2025-05-29 00:00:00',192),(38,'lena@example.com',NULL,'초보입니다','잘 부탁드려요!','2025-05-12 00:00:00',37),(39,'mark@example.com',NULL,'디버깅중','디버깅하다가 멘붕왔어요.','2025-05-22 00:00:00',97),(41,'oscar@example.com',NULL,'이런 기능!','태그 기능도 있었으면.','2025-05-15 00:00:00',122),(42,'peter@example.com',NULL,'업데이트 확인','정기 업데이트 감사합니다.','2025-06-02 00:00:00',174),(43,'queen@example.com',NULL,'밤샘 중','코딩하다가 새벽...','2025-05-18 00:00:00',356),(44,'rose@example.com',NULL,'공지 재확인','읽었던 공지 다시 읽었어요.','2025-05-26 00:00:00',90),(45,'steve@example.com',NULL,'좋은 아침','오늘도 좋은 하루!','2025-06-01 00:00:00',47),(46,'tori@example.com',NULL,'링크 공유','좋은 글 링크 드려요.','2025-05-23 00:00:00',264),(47,'umar@example.com',NULL,'헬프미','도움이 절실해요.','2025-05-21 00:00:00',157),(48,'vivi@example.com',NULL,'방가방가','가입 인사 드려요.','2025-05-24 00:00:00',283),(50,'xena@example.com',NULL,'콘텐츠 요청','다른 게시판도 생기면 좋겠어요.','2025-05-25 00:00:00',311),(52,'zoe@example.com',NULL,'마무리 인사','모두 수고하셨습니다~','2025-05-28 00:00:00',165);
/*!40000 ALTER TABLE `Board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12 16:06:01
