CREATE DATABASE  IF NOT EXISTS `app_jaysonhwang` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `app_jaysonhwang`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

-- LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

-- LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

-- LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add blog post',7,'add_blogpost'),(20,'Can change blog post',7,'change_blogpost'),(21,'Can delete blog post',7,'delete_blogpost');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

-- LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

-- LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

-- LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost`
--

DROP TABLE IF EXISTS `blog_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost`
--

-- LOCK TABLES `blog_blogpost` WRITE;
/*!40000 ALTER TABLE `blog_blogpost` DISABLE KEYS */;
INSERT INTO `blog_blogpost` VALUES (1,'Markdown 语法说明 (简体中文版)','Markdown 语法说明 (简体中文版)\r\n================\r\n\r\n*   [概述](#overview)\r\n    *   [宗旨](#philosophy)\r\n    *   [兼容 HTML](#html)\r\n    *   [特殊字符自动转换](#autoescape)\r\n*   [区块元素](#block)\r\n    *   [段落和换行](#p)\r\n    *   [标题](#header)\r\n    *   [区块引用](#blockquote)\r\n    *   [列表](#list)\r\n    *   [代码区块](#precode)\r\n    *   [分隔线](#hr)\r\n*   [区段元素](#span)\r\n    *   [链接](#link)\r\n    *   [强调](#em)\r\n    *   [代码](#code)\r\n    *   [图片](#img)\r\n*   [其它](#misc)\r\n    *   [反斜杠](#backslash)\r\n    *   [自动链接](#autolink)\r\n*   [感谢](#acknowledgement)\r\n*	[Markdown 免费编辑器](#editor)\r\n\r\n* * *\r\n\r\n##概述##\r\n\r\n###宗旨###\r\n\r\nMarkdown 的目标是实现「易读易写」。\r\n\r\n可读性，无论如何，都是最重要的。一份使用 Markdown 格式撰写的文件应该可以直接以纯文本发布，并且看起来不会像是由许多标签或是格式指令所构成。Markdown 语法受到一些既有 text-to-HTML 格式的影响，包括 [Setext] [1]、[atx] [2]、[Textile] [3]、[reStructuredText] [4]、[Grutatext] [5] 和 [EtText] [6]，而最大灵感来源其实是纯文本电子邮件的格式。\r\n\r\n  [1]: http://docutils.sourceforge.net/mirror/setext.html\r\n  [2]: http://www.aaronsw.com/2002/atx/\r\n  [3]: http://textism.com/tools/textile/\r\n  [4]: http://docutils.sourceforge.net/rst.html\r\n  [5]: http://www.triptico.com/software/grutatxt.html\r\n  [6]: http://ettext.taint.org/doc/\r\n\r\n总之， Markdown 的语法全由一些符号所组成，这些符号经过精挑细选，其作用一目了然。比如：在文字两旁加上星号，看起来就像\\*强调\\*。Markdown 的列表看起来，嗯，就是列表。Markdown 的区块引用看起来就真的像是引用一段文字，就像你曾在电子邮件中见过的那样。\r\n\r\n<h3 id=\"html\">兼容 HTML</h3>\r\n\r\nMarkdown 语法的目标是：成为一种适用于网络的*书写*语言。\r\n\r\nMarkdown 不是想要取代 HTML，甚至也没有要和它相近，它的语法种类很少，只对应 HTML 标记的一小部分。Markdown 的构想*不是*要使得 HTML 文档更容易书写。在我看来， HTML 已经很容易写了。Markdown 的理念是，能让文档更容易读、写和随意改。HTML 是一种*发布*的格式，Markdown 是一种*书写*的格式。就这样，Markdown 的格式语法只涵盖纯文本可以涵盖的范围。\r\n\r\n不在 Markdown 涵盖范围之内的标签，都可以直接在文档里面用 HTML 撰写。不需要额外标注这是 HTML 或是 Markdown；只要直接加标签就可以了。\r\n\r\n要制约的只有一些 HTML 区块元素――比如 `<div>`、`<table>`、`<pre>`、`<p>` 等标签，必须在前后加上空行与其它内容区隔开，还要求它们的开始标签与结尾标签不能用制表符或空格来缩进。Markdown 的生成器有足够智能，不会在 HTML 区块标签外加上不必要的 `<p>` 标签。\r\n\r\n例子如下，在 Markdown 文件里加上一段 HTML 表格：\r\n\r\n    这是一个普通段落。\r\n\r\n    <table>\r\n        <tr>\r\n            <td>Foo</td>\r\n        </tr>\r\n    </table>\r\n\r\n    这是另一个普通段落。\r\n\r\n请注意，在 HTML 区块标签间的 Markdown 格式语法将不会被处理。比如，你在 HTML 区块内使用 Markdown 样式的`*强调*`会没有效果。\r\n\r\nHTML 的区段（行内）标签如 `<span>`、`<cite>`、`<del>` 可以在 Markdown 的段落、列表或是标题里随意使用。依照个人习惯，甚至可以不用 Markdown 格式，而直接采用 HTML 标签来格式化。举例说明：如果比较喜欢 HTML 的 `<a>` 或 `<img>` 标签，可以直接使用这些标签，而不用 Markdown 提供的链接或是图像标签语法。\r\n\r\n和处在 HTML 区块标签间不同，Markdown 语法在 HTML 区段标签间是有效的。\r\n\r\n<h3 id=\"autoescape\">特殊字符自动转换</h3>\r\n\r\n在 HTML 文件中，有两个字符需要特殊处理： `<` 和 `&` 。 `<` 符号用于起始标签，`&` 符号则用于标记 HTML 实体，如果你只是想要显示这些字符的原型，你必须要使用实体的形式，像是 `&lt;` 和 `&amp;`。\r\n\r\n`&` 字符尤其让网络文档编写者受折磨，如果你要打「`AT&T`」 ，你必须要写成「`AT&amp;T`」。而网址中的 `&` 字符也要转换。比如你要链接到：\r\n\r\n    http://images.google.com/images?num=30&q=larry+bird\r\n\r\n你必须要把网址转换写为：\r\n\r\n    http://images.google.com/images?num=30&amp;q=larry+bird\r\n\r\n才能放到链接标签的 `href` 属性里。不用说也知道这很容易忽略，这也可能是 HTML 标准检验所检查到的错误中，数量最多的。\r\n\r\nMarkdown 让你可以自然地书写字符，需要转换的由它来处理好了。如果你使用的 `&` 字符是 HTML 字符实体的一部分，它会保留原状，否则它会被转换成 `&amp`;。\r\n\r\n所以你如果要在文档中插入一个版权符号 `©`，你可以这样写：\r\n\r\n    &copy;\r\n\r\nMarkdown 会保留它不动。而若你写：\r\n\r\n    AT&T\r\n\r\nMarkdown 就会将它转为：\r\n\r\n    AT&amp;T\r\n\r\n类似的状况也会发生在 `<` 符号上，因为 Markdown 允许 [兼容 HTML](#html) ，如果你是把 `<` 符号作为 HTML 标签的定界符使用，那 Markdown 也不会对它做任何转换，但是如果你写：\r\n\r\n    4 < 5\r\n\r\nMarkdown 将会把它转换为：\r\n\r\n    4 &lt; 5\r\n\r\n不过需要注意的是，code 范围内，不论是行内还是区块， `<` 和 `&` 两个符号都*一定*会被转换成 HTML 实体，这项特性让你可以很容易地用 Markdown 写 HTML code （和 HTML 相对而言， HTML 语法中，你要把所有的 `<` 和 `&` 都转换为 HTML 实体，才能在 HTML 文件里面写出 HTML code。）\r\n\r\n* * *\r\n\r\n<h2 id=\"block\">区块元素</h2>\r\n\r\n\r\n<h3 id=\"p\">段落和换行</h3>\r\n\r\n一个 Markdown 段落是由一个或多个连续的文本行组成，它的前后要有一个以上的空行（空行的定义是显示上看起来像是空的，便会被视为空行。比方说，若某一行只包含空格和制表符，则该行也会被视为空行）。普通段落不该用空格或制表符来缩进。\r\n\r\n「由一个或多个连续的文本行组成」这句话其实暗示了 Markdown 允许段落内的强迫换行（插入换行符），这个特性和其他大部分的 text-to-HTML 格式不一样（包括 Movable Type 的「Convert Line Breaks」选项），其它的格式会把每个换行符都转成 `<br />` 标签。\r\n\r\n如果你*确实*想要依赖 Markdown 来插入 `<br />` 标签的话，在插入处先按入两个以上的空格然后回车。\r\n\r\n的确，需要多费点事（多加空格）来产生 `<br />` ，但是简单地「每个换行都转换为 `<br />`」的方法在 Markdown 中并不适合， Markdown 中 email 式的 [区块引用][bq] 和多段落的 [列表][l] 在使用换行来排版的时候，不但更好用，还更方便阅读。\r\n\r\n  [bq]: #blockquote\r\n  [l]:  #list\r\n\r\n<h3 id=\"header\">标题</h3>\r\n\r\nMarkdown 支持两种标题的语法，类 [Setext] [1] 和类 [atx] [2] 形式。\r\n\r\n类 Setext 形式是用底线的形式，利用 `=` （最高阶标题）和 `-` （第二阶标题），例如：\r\n\r\n    This is an H1\r\n    =============\r\n\r\n    This is an H2\r\n    -------------\r\n\r\n任何数量的 `=` 和 `-` 都可以有效果。\r\n\r\n类 Atx 形式则是在行首插入 1 到 6 个 `#` ，对应到标题 1 到 6 阶，例如：\r\n\r\n    # 这是 H1\r\n\r\n    ## 这是 H2\r\n\r\n    ###### 这是 H6\r\n\r\n你可以选择性地「闭合」类 atx 样式的标题，这纯粹只是美观用的，若是觉得这样看起来比较舒适，你就可以在行尾加上 `#`，而行尾的 `#` 数量也不用和开头一样（行首的井字符数量决定标题的阶数）：\r\n\r\n    # 这是 H1 #\r\n\r\n    ## 这是 H2 ##\r\n\r\n    ### 这是 H3 ######\r\n\r\n\r\n<h3 id=\"blockquote\">区块引用 Blockquotes</h3>\r\n\r\nMarkdown 标记区块引用是使用类似 email 中用 `>` 的引用方式。如果你还熟悉在 email 信件中的引言部分，你就知道怎么在 Markdown 文件中建立一个区块引用，那会看起来像是你自己先断好行，然后在每行的最前面加上 `>` ：\r\n\r\n    > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,\r\n    > consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\r\n    > Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.\r\n    > \r\n    > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\r\n    > id sem consectetuer libero luctus adipiscing.\r\n\r\nMarkdown 也允许你偷懒只在整个段落的第一行最前面加上 `>` ：\r\n\r\n    > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,\r\n    consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\r\n    Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.\r\n\r\n    > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\r\n    id sem consectetuer libero luctus adipiscing.\r\n\r\n区块引用可以嵌套（例如：引用内的引用），只要根据层次加上不同数量的 `>` ：\r\n\r\n    > This is the first level of quoting.\r\n    >\r\n    > > This is nested blockquote.\r\n    >\r\n    > Back to the first level.\r\n\r\n引用的区块内也可以使用其他的 Markdown 语法，包括标题、列表、代码区块等：\r\n\r\n	> ## 这是一个标题。\r\n	> \r\n	> 1.   这是第一行列表项。\r\n	> 2.   这是第二行列表项。\r\n	> \r\n	> 给出一些例子代码：\r\n	> \r\n	>     return shell_exec(\"echo $input | $markdown_script\");\r\n\r\n任何像样的文本编辑器都能轻松地建立 email 型的引用。例如在 BBEdit 中，你可以选取文字后然后从选单中选择*增加引用阶层*。\r\n\r\n<h3 id=\"list\">列表</h3>\r\n\r\nMarkdown 支持有序列表和无序列表。\r\n\r\n无序列表使用星号、加号或是减号作为列表标记：\r\n\r\n    *   Red\r\n    *   Green\r\n    *   Blue\r\n\r\n等同于：\r\n\r\n    +   Red\r\n    +   Green\r\n    +   Blue\r\n\r\n也等同于：\r\n\r\n    -   Red\r\n    -   Green\r\n    -   Blue\r\n\r\n有序列表则使用数字接着一个英文句点：\r\n\r\n    1.  Bird\r\n    2.  McHale\r\n    3.  Parish\r\n\r\n很重要的一点是，你在列表标记上使用的数字并不会影响输出的 HTML 结果，上面的列表所产生的 HTML 标记为：\r\n\r\n    <ol>\r\n    <li>Bird</li>\r\n    <li>McHale</li>\r\n    <li>Parish</li>\r\n    </ol>\r\n\r\n如果你的列表标记写成：\r\n\r\n    1.  Bird\r\n    1.  McHale\r\n    1.  Parish\r\n\r\n或甚至是：\r\n\r\n    3. Bird\r\n    1. McHale\r\n    8. Parish\r\n\r\n你都会得到完全相同的 HTML 输出。重点在于，你可以让 Markdown 文件的列表数字和输出的结果相同，或是你懒一点，你可以完全不用在意数字的正确性。\r\n\r\n如果你使用懒惰的写法，建议第一个项目最好还是从 1. 开始，因为 Markdown 未来可能会支持有序列表的 start 属性。\r\n\r\n列表项目标记通常是放在最左边，但是其实也可以缩进，最多 3 个空格，项目标记后面则一定要接着至少一个空格或制表符。\r\n\r\n要让列表看起来更漂亮，你可以把内容用固定的缩进整理好：\r\n\r\n    *   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\r\n        Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,\r\n        viverra nec, fringilla in, laoreet vitae, risus.\r\n    *   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.\r\n        Suspendisse id sem consectetuer libero luctus adipiscing.\r\n\r\n但是如果你懒，那也行：\r\n\r\n    *   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\r\n    Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,\r\n    viverra nec, fringilla in, laoreet vitae, risus.\r\n    *   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.\r\n    Suspendisse id sem consectetuer libero luctus adipiscing.\r\n\r\n如果列表项目间用空行分开，在输出 HTML 时 Markdown 就会将项目内容用 `<p>` \r\n标签包起来，举例来说：\r\n\r\n    *   Bird\r\n    *   Magic\r\n\r\n会被转换为：\r\n\r\n    <ul>\r\n    <li>Bird</li>\r\n    <li>Magic</li>\r\n    </ul>\r\n\r\n但是这个：\r\n\r\n    *   Bird\r\n\r\n    *   Magic\r\n\r\n会被转换为：\r\n\r\n    <ul>\r\n    <li><p>Bird</p></li>\r\n    <li><p>Magic</p></li>\r\n    </ul>\r\n\r\n列表项目可以包含多个段落，每个项目下的段落都必须缩进 4 个空格或是 1 个制表符：\r\n\r\n    1.  This is a list item with two paragraphs. Lorem ipsum dolor\r\n        sit amet, consectetuer adipiscing elit. Aliquam hendrerit\r\n        mi posuere lectus.\r\n\r\n        Vestibulum enim wisi, viverra nec, fringilla in, laoreet\r\n        vitae, risus. Donec sit amet nisl. Aliquam semper ipsum\r\n        sit amet velit.\r\n\r\n    2.  Suspendisse id sem consectetuer libero luctus adipiscing.\r\n\r\n如果你每行都有缩进，看起来会看好很多，当然，再次地，如果你很懒惰，Markdown 也允许：\r\n\r\n    *   This is a list item with two paragraphs.\r\n\r\n        This is the second paragraph in the list item. You\'re\r\n    only required to indent the first line. Lorem ipsum dolor\r\n    sit amet, consectetuer adipiscing elit.\r\n\r\n    *   Another item in the same list.\r\n\r\n如果要在列表项目内放进引用，那 `>` 就需要缩进：\r\n\r\n    *   A list item with a blockquote:\r\n\r\n        > This is a blockquote\r\n        > inside a list item.\r\n\r\n如果要放代码区块的话，该区块就需要缩进*两次*，也就是 8 个空格或是 2 个制表符：\r\n\r\n    *   一列表项包含一个列表区块：\r\n\r\n            <代码写在这>\r\n\r\n\r\n当然，项目列表很可能会不小心产生，像是下面这样的写法：\r\n\r\n    1986. What a great season.\r\n\r\n换句话说，也就是在行首出现*数字-句点-空白*，要避免这样的状况，你可以在句点前面加上反斜杠。\r\n\r\n    1986\\. What a great season.\r\n\r\n<h3 id=\"precode\">代码区块</h3>\r\n\r\n和程序相关的写作或是标签语言原始码通常会有已经排版好的代码区块，通常这些区块我们并不希望它以一般段落文件的方式去排版，而是照原来的样子显示，Markdown 会用 `<pre>` 和 `<code>` 标签来把代码区块包起来。\r\n\r\n要在 Markdown 中建立代码区块很简单，只要简单地缩进 4 个空格或是 1 个制表符就可以，例如，下面的输入：\r\n\r\n    这是一个普通段落：\r\n\r\n        这是一个代码区块。\r\n\r\nMarkdown 会转换成：\r\n\r\n    <p>这是一个普通段落：</p>\r\n\r\n    <pre><code>这是一个代码区块。\r\n    </code></pre>\r\n\r\n这个每行一阶的缩进（4 个空格或是 1 个制表符），都会被移除，例如：\r\n\r\n    Here is an example of AppleScript:\r\n\r\n        tell application \"Foo\"\r\n            beep\r\n        end tell\r\n\r\n会被转换为：\r\n\r\n    <p>Here is an example of AppleScript:</p>\r\n\r\n    <pre><code>tell application \"Foo\"\r\n        beep\r\n    end tell\r\n    </code></pre>\r\n\r\n一个代码区块会一直持续到没有缩进的那一行（或是文件结尾）。\r\n\r\n在代码区块里面， `&` 、 `<` 和 `>` 会自动转成 HTML 实体，这样的方式让你非常容易使用 Markdown 插入范例用的 HTML 原始码，只需要复制贴上，再加上缩进就可以了，剩下的 Markdown 都会帮你处理，例如：\r\n\r\n        <div class=\"footer\">\r\n            &copy; 2004 Foo Corporation\r\n        </div>\r\n\r\n会被转换为：\r\n\r\n    <pre><code>&lt;div class=\"footer\"&gt;\r\n        &amp;copy; 2004 Foo Corporation\r\n    &lt;/div&gt;\r\n    </code></pre>\r\n\r\n代码区块中，一般的 Markdown 语法不会被转换，像是星号便只是星号，这表示你可以很容易地以 Markdown 语法撰写 Markdown 语法相关的文件。\r\n\r\n<h3 id=\"hr\">分隔线</h3>\r\n\r\n你可以在一行中用三个以上的星号、减号、底线来建立一个分隔线，行内不能有其他东西。你也可以在星号或是减号中间插入空格。下面每种写法都可以建立分隔线：\r\n\r\n    * * *\r\n\r\n    ***\r\n\r\n    *****\r\n\r\n    - - -\r\n\r\n    ---------------------------------------\r\n\r\n\r\n* * *\r\n\r\n<h2 id=\"span\">区段元素</h2>\r\n\r\n<h3 id=\"link\">链接</h3>\r\n\r\nMarkdown 支持两种形式的链接语法： *行内式*和*参考式*两种形式。\r\n\r\n不管是哪一种，链接文字都是用 [方括号] 来标记。\r\n\r\n要建立一个*行内式*的链接，只要在方块括号后面紧接着圆括号并插入网址链接即可，如果你还想要加上链接的 title 文字，只要在网址后面，用双引号把 title 文字包起来即可，例如：\r\n\r\n    This is [an example](http://example.com/ \"Title\") inline link.\r\n\r\n    [This link](http://example.net/) has no title attribute.\r\n\r\n会产生：\r\n\r\n    <p>This is <a href=\"http://example.com/\" title=\"Title\">\r\n    an example</a> inline link.</p>\r\n\r\n    <p><a href=\"http://example.net/\">This link</a> has no\r\n    title attribute.</p>\r\n\r\n如果你是要链接到同样主机的资源，你可以使用相对路径：\r\n\r\n    See my [About](/about/) page for details.   \r\n\r\n*参考式*的链接是在链接文字的括号后面再接上另一个方括号，而在第二个方括号里面要填入用以辨识链接的标记：\r\n\r\n    This is [an example][id] reference-style link.\r\n\r\n你也可以选择性地在两个方括号中间加上一个空格：\r\n\r\n    This is [an example] [id] reference-style link.\r\n\r\n接着，在文件的任意处，你可以把这个标记的链接内容定义出来：\r\n\r\n    [id]: http://example.com/  \"Optional Title Here\"\r\n\r\n链接内容定义的形式为：\r\n\r\n*   方括号（前面可以选择性地加上至多三个空格来缩进），里面输入链接文字\r\n*   接着一个冒号\r\n*   接着一个以上的空格或制表符\r\n*   接着链接的网址\r\n*   选择性地接着 title 内容，可以用单引号、双引号或是括弧包着\r\n\r\n下面这三种链接的定义都是相同：\r\n\r\n	[foo]: http://example.com/  \"Optional Title Here\"\r\n	[foo]: http://example.com/  \'Optional Title Here\'\r\n	[foo]: http://example.com/  (Optional Title Here)\r\n\r\n**请注意：**有一个已知的问题是 Markdown.pl 1.0.1 会忽略单引号包起来的链接 title。\r\n\r\n链接网址也可以用尖括号包起来：\r\n\r\n    [id]: <http://example.com/>  \"Optional Title Here\"\r\n\r\n你也可以把 title 属性放到下一行，也可以加一些缩进，若网址太长的话，这样会比较好看：\r\n\r\n    [id]: http://example.com/longish/path/to/resource/here\r\n        \"Optional Title Here\"\r\n\r\n网址定义只有在产生链接的时候用到，并不会直接出现在文件之中。\r\n\r\n链接辨别标签可以有字母、数字、空白和标点符号，但是并*不*区分大小写，因此下面两个链接是一样的：\r\n\r\n	[link text][a]\r\n	[link text][A]\r\n\r\n*隐式链接标记*功能让你可以省略指定链接标记，这种情形下，链接标记会视为等同于链接文字，要用隐式链接标记只要在链接文字后面加上一个空的方括号，如果你要让 \"Google\" 链接到 google.com，你可以简化成：\r\n\r\n	[Google][]\r\n\r\n然后定义链接内容：\r\n\r\n	[Google]: http://google.com/\r\n\r\n由于链接文字可能包含空白，所以这种简化型的标记内也许包含多个单词：\r\n\r\n	Visit [Daring Fireball][] for more information.\r\n\r\n然后接着定义链接：\r\n\r\n	[Daring Fireball]: http://daringfireball.net/\r\n\r\n链接的定义可以放在文件中的任何一个地方，我比较偏好直接放在链接出现段落的后面，你也可以把它放在文件最后面，就像是注解一样。\r\n\r\n下面是一个参考式链接的范例：\r\n\r\n    I get 10 times more traffic from [Google] [1] than from\r\n    [Yahoo] [2] or [MSN] [3].\r\n\r\n      [1]: http://google.com/        \"Google\"\r\n      [2]: http://search.yahoo.com/  \"Yahoo Search\"\r\n      [3]: http://search.msn.com/    \"MSN Search\"\r\n\r\n如果改成用链接名称的方式写：\r\n\r\n    I get 10 times more traffic from [Google][] than from\r\n    [Yahoo][] or [MSN][].\r\n\r\n      [google]: http://google.com/        \"Google\"\r\n      [yahoo]:  http://search.yahoo.com/  \"Yahoo Search\"\r\n      [msn]:    http://search.msn.com/    \"MSN Search\"\r\n\r\n上面两种写法都会产生下面的 HTML。\r\n\r\n    <p>I get 10 times more traffic from <a href=\"http://google.com/\"\r\n    title=\"Google\">Google</a> than from\r\n    <a href=\"http://search.yahoo.com/\" title=\"Yahoo Search\">Yahoo</a>\r\n    or <a href=\"http://search.msn.com/\" title=\"MSN Search\">MSN</a>.</p>\r\n\r\n下面是用行内式写的同样一段内容的 Markdown 文件，提供作为比较之用：\r\n\r\n    I get 10 times more traffic from [Google](http://google.com/ \"Google\")\r\n    than from [Yahoo](http://search.yahoo.com/ \"Yahoo Search\") or\r\n    [MSN](http://search.msn.com/ \"MSN Search\").\r\n\r\n参考式的链接其实重点不在于它比较好写，而是它比较好读，比较一下上面的范例，使用参考式的文章本身只有 81 个字符，但是用行内形式的却会增加到 176 个字元，如果是用纯 HTML 格式来写，会有 234 个字元，在 HTML 格式中，标签比文本还要多。\r\n\r\n使用 Markdown 的参考式链接，可以让文件更像是浏览器最后产生的结果，让你可以把一些标记相关的元数据移到段落文字之外，你就可以增加链接而不让文章的阅读感觉被打断。\r\n\r\n<h3 id=\"em\">强调</h3>\r\n\r\nMarkdown 使用星号（`*`）和底线（`_`）作为标记强调字词的符号，被 `*` 或 `_` 包围的字词会被转成用 `<em>` 标签包围，用两个 `*` 或 `_` 包起来的话，则会被转成 `<strong>`，例如：\r\n\r\n    *single asterisks*\r\n\r\n    _single underscores_\r\n\r\n    **double asterisks**\r\n\r\n    __double underscores__\r\n\r\n会转成：\r\n\r\n    <em>single asterisks</em>\r\n\r\n    <em>single underscores</em>\r\n\r\n    <strong>double asterisks</strong>\r\n\r\n    <strong>double underscores</strong>\r\n\r\n你可以随便用你喜欢的样式，唯一的限制是，你用什么符号开启标签，就要用什么符号结束。\r\n\r\n强调也可以直接插在文字中间：\r\n\r\n    un*frigging*believable\r\n\r\n但是**如果你的 `*` 和 `_` 两边都有空白的话，它们就只会被当成普通的符号**。\r\n\r\n如果要在文字前后直接插入普通的星号或底线，你可以用反斜线：\r\n\r\n    \\*this text is surrounded by literal asterisks\\*\r\n\r\n<h3 id=\"code\">代码</h3>\r\n\r\n如果要标记一小段行内代码，你可以用反引号把它包起来（`` ` ``），例如：\r\n\r\n    Use the `printf()` function.\r\n\r\n会产生：\r\n\r\n    <p>Use the <code>printf()</code> function.</p>\r\n\r\n如果要在代码区段内插入反引号，你可以用多个反引号来开启和结束代码区段：\r\n\r\n    ``There is a literal backtick (`) here.``\r\n\r\n这段语法会产生：\r\n\r\n    <p><code>There is a literal backtick (`) here.</code></p>\r\n\r\n代码区段的起始和结束端都可以放入一个空白，起始端后面一个，结束端前面一个，这样你就可以在区段的一开始就插入反引号：\r\n\r\n	A single backtick in a code span: `` ` ``\r\n	\r\n	A backtick-delimited string in a code span: `` `foo` ``\r\n\r\n会产生：\r\n\r\n	<p>A single backtick in a code span: <code>`</code></p>\r\n	\r\n	<p>A backtick-delimited string in a code span: <code>`foo`</code></p>\r\n\r\n在代码区段内，`&` 和尖括号**都**会被自动地转成 HTML 实体，这使得插入 HTML 原始码变得很容易，Markdown 会把下面这段：\r\n\r\n    Please don\'t use any `<blink>` tags.\r\n\r\n转为：\r\n\r\n    <p>Please don\'t use any <code>&lt;blink&gt;</code> tags.</p>\r\n\r\n你也可以这样写：\r\n\r\n    `&#8212;` is the decimal-encoded equivalent of `&mdash;`.\r\n\r\n以产生：\r\n\r\n    <p><code>&amp;#8212;</code> is the decimal-encoded\r\n    equivalent of <code>&amp;mdash;</code>.</p>\r\n\r\n\r\n\r\n<h3 id=\"img\">图片</h3>\r\n\r\n很明显地，要在纯文字应用中设计一个「自然」的语法来插入图片是有一定难度的。\r\n\r\nMarkdown 使用一种和链接很相似的语法来标记图片，同样也允许两种样式： *行内式*和*参考式*。\r\n\r\n行内式的图片语法看起来像是：\r\n\r\n    ![Alt text](/path/to/img.jpg)\r\n\r\n    ![Alt text](/path/to/img.jpg \"Optional title\")\r\n\r\n详细叙述如下：\r\n\r\n*   一个惊叹号 `!`\r\n*   接着一个方括号，里面放上图片的替代文字\r\n*   接着一个普通括号，里面放上图片的网址，最后还可以用引号包住并加上\r\n    选择性的 \'title\' 文字。\r\n\r\n参考式的图片语法则长得像这样：\r\n\r\n    ![Alt text][id]\r\n\r\n「id」是图片参考的名称，图片参考的定义方式则和连结参考一样：\r\n\r\n    [id]: url/to/image  \"Optional title attribute\"\r\n\r\n到目前为止， Markdown 还没有办法指定图片的宽高，如果你需要的话，你可以使用普通的 `<img>` 标签。\r\n\r\n* * *\r\n\r\n<h2 id=\"misc\">其它</h2>\r\n\r\n<h3 id=\"autolink\">自动链接</h3>\r\n\r\nMarkdown 支持以比较简短的自动链接形式来处理网址和电子邮件信箱，只要是用尖括号包起来， Markdown 就会自动把它转成链接。一般网址的链接文字就和链接地址一样，例如：\r\n\r\n    <http://example.com/>\r\n\r\nMarkdown 会转为：\r\n\r\n    <a href=\"http://example.com/\">http://example.com/</a>\r\n\r\n邮址的自动链接也很类似，只是 Markdown 会先做一个编码转换的过程，把文字字符转成 16 进位码的 HTML 实体，这样的格式可以糊弄一些不好的邮址收集机器人，例如：\r\n\r\n    <address@example.com>\r\n\r\nMarkdown 会转成：\r\n\r\n    <a href=\"&#x6D;&#x61;i&#x6C;&#x74;&#x6F;:&#x61;&#x64;&#x64;&#x72;&#x65;\r\n    &#115;&#115;&#64;&#101;&#120;&#x61;&#109;&#x70;&#x6C;e&#x2E;&#99;&#111;\r\n    &#109;\">&#x61;&#x64;&#x64;&#x72;&#x65;&#115;&#115;&#64;&#101;&#120;&#x61;\r\n    &#109;&#x70;&#x6C;e&#x2E;&#99;&#111;&#109;</a>\r\n\r\n在浏览器里面，这段字串（其实是 `<a href=\"mailto:address@example.com\">address@example.com</a>`）会变成一个可以点击的「address@example.com」链接。\r\n\r\n（这种作法虽然可以糊弄不少的机器人，但并不能全部挡下来，不过总比什么都不做好些。不管怎样，公开你的信箱终究会引来广告信件的。）\r\n\r\n<h3 id=\"backslash\">反斜杠</h3>\r\n\r\nMarkdown 可以利用反斜杠来插入一些在语法中有其它意义的符号，例如：如果你想要用星号加在文字旁边的方式来做出强调效果（但不用 `<em>` 标签），你可以在星号的前面加上反斜杠：\r\n\r\n    \\*literal asterisks\\*\r\n\r\nMarkdown 支持以下这些符号前面加上反斜杠来帮助插入普通的符号：\r\n\r\n    \\   反斜线\r\n    `   反引号\r\n    *   星号\r\n    _   底线\r\n    {}  花括号\r\n    []  方括号\r\n    ()  括弧\r\n    #   井字号\r\n    +   加号\r\n    -   减号\r\n    .   英文句点\r\n    !   惊叹号\r\n\r\n<h2 id=\"acknowledgement\">感谢</h2>\r\n\r\n感谢 [leafy7382][] 协助翻译，[hlb][]、[Randylien][] 帮忙润稿，[ethantw][] 的[汉字标准格式・CSS Reset][]， [WM][] 回报文字错误。\r\n\r\n[leafy7382]:https://twitter.com/#!/leafy7382\r\n[hlb]:http://iamhlb.com/\r\n[Randylien]:http://twitter.com/randylien\r\n[ethantw]:https://twitter.com/#!/ethantw\r\n[汉字标准格式・CSS Reset]:http://ethantw.net/projects/han/\r\n[WM]:http://kidwm.net/\r\n\r\n感谢 [fenprace][]，[addv][]。\r\n\r\n[fenprace]:https://github.com/fenprace\r\n[addv]:https://github.com/addv\r\n\r\n----------\r\n<h2 id=\"editor\">Markdown 免费编辑器</h2>\r\n\r\nWindows 平台\r\n\r\n* [MarkdownPad](http://markdownpad.com/)\r\n* [MarkPad](http://code52.org/DownmarkerWPF/)\r\n\r\nLinux 平台\r\n\r\n* [ReText](http://sourceforge.net/p/retext/home/ReText/)\r\n\r\nMac 平台\r\n\r\n* [Mou](http://mouapp.com/)\r\n\r\n在线编辑器\r\n\r\n* [Markable.in](http://markable.in/)\r\n* [Dillinger.io](http://dillinger.io/)\r\n\r\n浏览器插件\r\n\r\n* [MaDe](https://chrome.google.com/webstore/detail/oknndfeeopgpibecfjljjfanledpbkog) (Chrome)\r\n\r\n高级应用\r\n\r\n* [Sublime Text 2](http://www.sublimetext.com/2) + [MarkdownEditing](http://ttscoff.github.com/MarkdownEditing/) / [教程](http://lucifr.com/2012/07/12/markdownediting-for-sublime-text-2/)\r\n\r\n\\*** 如有更好的 Markdown 免费编辑器推荐，请到[这里反馈](https://gitcafe.com/riku/Markdown-Syntax-CN/tickets/1)，谢谢！','2014-08-19 21:05:08'),(2,'终于初步建好了','寒假时就边看Django，边在改一个找到的html静态模板，但是后来开学了，各种社团活动、课程忙起来导致网站补全计划搁浅了。  \r\n这个暑假前的计划之一就是完成这个网站，结果因为7月去实习，8月同学聚会+进行SRP研究的论文改进，导致前一天才决定继续完成这个网站。  \r\n部署到SAE过程中略多坑- -b，后面再用一篇日志记录一下。  \r\n睡觉去了(～﹃～)~zZ\r\n=====','2014-08-19 21:26:32'),(3,'总结下SAE部署Django遇到的问题','#总结下SAE部署Django遇到的问题\r\n##0x00\r\n使用svn把代码同步到SAE上，进入admin后台时,加载不了CSS样式.要把*site-packages/contrib/admin/static*下的*admin*文件夹copy一份放到项目的static目录下.\r\n配置settings.py，加入STATICFILES_DIRS,让本地的Django运行时也能找到静态文件**记得*STATICFILES_DIRS*是一个[*元组(tuple)*](https://docs.python.org/3/library/stdtypes.html?highlight=tuple#tuple)，即使只有一个也要在末尾加上逗号,不然Python就认不粗这是一个元组了=、=**\r\n\r\n<pre><code class=\"python\">\r\nSTATICFILES_DIRS = (\r\n    BASE_DIR + \'/static/\',\r\n)\r\nSTATIC_URL = \'/static/\'\r\n</code></pre>\r\n##0x01 本地数据库与SAE上数据库的同步\r\n建好Blog的models后，在本地用*python manage.py syncdb*更新下数据库的结构，但是这样做并不能更新SAE上的表结构啊(#ﾟДﾟ)  \r\n官方文档好像有个方法是可以，不过据说很buggy=。=  \r\n最终采用把本地MySQL数据库Dump出来，再上传到SAE的PHPMyAdmin上的方法。  \r\n**Dump的时候选择把所有表Dump到同一个文件会方便很多.**  \r\n直接把.sql文件扔上去，会发生错误，是类似这样的SQL语句导致的。应该是SAE上禁止了LOCK的操作吧。  \r\n\r\n    -- LOCK TABLES `auth_group` WRITE;\r\n    -- UNLOCK TABLES;\r\n在Sublime Text中长按`Command + D`选中所有LOCK，`Command + L`，选中行，然后`Command + /`注释掉全部LOCK操作。UNLOCK操作也同理注释掉。\r\n##0x02 SAE上使用第三方库\r\n首先部署下SAE本地开发环境，按照[官方指示](http://sae.sina.com.cn/doc/python/tools.html#id2)来。  \r\n然后是[安装第三方库](http://sae.sina.com.cn/doc/python/tools.html#howto-use-saecloud-install)。  \r\n不过官方文档中说**在应用目录中执行下面的命令安装依赖的第三方包**这一句略坑爹。。。\r\n比如SAE的目录结构是\r\n\r\n    |mysite/\r\n    --|1/\r\n      --|manage.py\r\n      --|index.wsgi\r\n      --|static/\r\n      --|mysite/\r\n      --|其他文件...省略\r\n    --|2\r\n这样的结构，平时做操作都是在*1/*目录下操作，然后也很顺手地在这里运行*saecloud install package*来装，然后*site-packages*文件夹就在*1/*的目录之下，和*mysite*目录同级，上传到SAE之后死活使用不了。。。  \r\n后来仔细看DEBUG信息，发现那个寻找路径竟然是在*1/mysite/*目录下找的！**site-packages应该在1/mysite/site-packages这里，SAE上的Django才能在这个路径里找到第三方库！**  \r\n移动了*site-packages*位置之后，我的markdown渲染终于能用了！^_^  \r\n##0x03 MySQL字符集\r\nMySQL字符集默认为latin，在后台编辑保存中文Blog时出现Invalid String Error(好像是这个吧..)。查了一下，确定是MySQL的存储字符集问题。\r\nmac os的/etc下默认没有my.cnf，需要进入MySQL的目录下copy一个放到/etc下。\r\n\r\n    > sudo cp /usr/local/mysql/support-files/my-medium.cnf\r\n                   /etc/my.cnf\r\n    > sudo vi /etc/my.cnf\r\n    [client]部分加入：\r\n    default-character-set=utf8\r\n    [mysqld]部分加入：\r\n    character-set-server=utf8\r\n检查结果：\r\n\r\n    mysql> show variables like \'%char%\';\r\n    +--------------------------+--------------------------------------------------------+  \r\n    | Variable_name            | Value                                                  |  \r\n    +--------------------------+--------------------------------------------------------+  \r\n    | character_set_client     | utf8                                                   |\r\n    | character_set_connection | utf8                                                   |\r\n    | character_set_database   | utf8                                                   |\r\n    | character_set_filesystem | binary                                                 |\r\n    | character_set_results    | utf8                                                   |\r\n    | character_set_server     | utf8                                                   |\r\n    | character_set_system     | utf8                                                   |\r\n    | character_sets_dir       | /usr/local/mysql-5.5.23-osx10.6-x86_64/share/charsets/ |\r\n    +--------------------------+--------------------------------------------------------+\r\n    8 rows in set (0.00 sec)  \r\n修改完毕  \r\n然后再把本地数据库之前建立的表全部Drop了，重新用*python manage.py syncdb*建表。Dump出来，重建SAE上的数据库。','2014-08-20 12:34:05');
/*!40000 ALTER TABLE `blog_blogpost` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

-- LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-08-19 21:05:11',1,7,'1','Markdown 语法说明 (简体中文版)',1,''),(2,'2014-08-19 21:07:13',1,7,'1','Markdown 语法说明 (简体中文版)',2,'已修改 body 。'),(3,'2014-08-19 21:08:20',1,7,'1','Markdown 语法说明 (简体中文版)',2,'已修改 body 。'),(4,'2014-08-19 21:11:22',1,7,'1','Markdown 语法说明 (简体中文版)',2,'已修改 body 。'),(5,'2014-08-20 12:33:45',1,7,'2','总结下SAE部署Django遇到的问题',1,''),(6,'2014-08-20 12:34:07',1,7,'3','总结下SAE部署Django遇到的问题',1,''),(7,'2014-08-20 12:34:22',1,7,'2','终于初步建好了',2,'已修改 title 。'),(8,'2014-08-20 15:59:00',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(9,'2014-08-20 15:59:19',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(10,'2014-08-20 16:00:30',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(11,'2014-08-20 16:00:53',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(12,'2014-08-20 16:01:15',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(13,'2014-08-20 16:03:04',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(14,'2014-08-20 16:14:06',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(15,'2014-08-20 16:31:35',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(16,'2014-08-20 17:38:20',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。'),(17,'2014-08-20 17:44:28',1,7,'3','总结下SAE部署Django遇到的问题',2,'已修改 body 。');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

-- LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'blog post','blog','blogpost');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

-- LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jqbytxp9ad4a15pbsa53l4l0gztn1o88','ZmNiM2I4OGJlM2I3YmMxZjZkY2MyMTFmOWZjNTQ4MDVlY2Q1MWVhZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-02 21:04:52');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
-- UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-21  3:17:14
