import 'package:flutter/material.dart';

// ##### Setting config
// ### System
// # device threshold
const double mobileThreshold = 850;
const double designWidthMobile = 1080;
const double designWidthDesktop = 1920;

// # Language
const List<Locale> supportedLocales = [
  Locale('zh', 'TW'),
  Locale('en', 'US'),
];

// # Tab name
List<String> tabNames = [
  'tab_search',
  'tab_rule',
  'tab_credit',
  'tab_interdisciplinary',
  'tab_map',
];

// ### UI
// # Light theme
const Color lightBackground = Colors.white;

// # Dark theme
const Color darkBackground = Color.fromRGBO(42, 42, 42, 1);

// # Shared
const Color colorError = Color.fromRGBO(243, 13, 13, 1);
const Color colorPrimary1 = Color.fromRGBO(181, 42, 203, 1);
const Color colorPrimary2 = Color.fromRGBO(60, 195, 38, 1);
const Color colorSecondary = Color.fromRGBO(231, 153, 193, 1);
const Color colorComponent1 = Color.fromRGBO(83, 210, 39, 1);
const Color colorComponent2 = Color.fromRGBO(250, 137, 195, 1);
const Color colorComponent3 = Color.fromRGBO(180, 180, 180, 1);
const Color colorComponent4 = Color.fromRGBO(218, 218, 218, 1);
const Color colorComponent5 = Color.fromRGBO(71, 192, 29, 1);
const Color colorComponent6 = Color.fromRGBO(138, 19, 143, 1);
const Color colorComponent7 = Color.fromRGBO(233, 85, 161, 1);

// # Font
const double fontP = 18;
const double fontH2 = 32;
const double fontH3 = 24;
const double fontH4 = 20;
const double fontRegular = 16;
const double fontMobileLarge = 18;
const double fontMobileRegular = 16;

// # Radius
BorderRadius radiusMenu = BorderRadius.circular(20);
BorderRadius radiusFilter = BorderRadius.circular(25);
BorderRadius radiusButton = BorderRadius.circular(50);

// # Time
List<String> dayCodes = ["M", "T", "W", "R", "F", "S"];
List<String> courseCodes = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c"];

// ### Test data
// # filter
List<String> departments = ["大學部", "碩士班", "博士班", "碩專班", "碩士在職專班", "博士在職專班"];
List<String> grades = ["一年級", "二年級", "三年級", "四年級"];
List<String> classes = ["A班", "B班", "C班", "D班"];
List<String> groups = ["A組", "B組", "C組", "D組"];
List<String> languages = ["英語", "華語"];
List<String> institutes = [
  'AES-分理所',
  'AIIM-AI智造暨聯網產碩專班',
  'AMEV-電動載具先進製造產碩專班',
  'ANTH-人類所',
  'ASTR-天文所',
  'BAI-智慧生醫博士學程',
  'BME-醫工所',
  '醫BME5-碩室',
  'CHE-化工所',
  'CHEM-化學系',
  'CLI-中文系',
  'COM-通訊所',
  'CS-資工系',
  'CSR-半導體學院',
  'DMS-醫科系',
  'ECON-經濟系',
  'EE-電機系',
  'EECS-電資院學士班',
  'EMBA-EMBA專班',
  'EMD-EMBA雙聯',
  'EMIM-智慧製造高階在職專班學程',
  'EMM-EMBA亞太高階境外專班',
  'EMS-EMBA深圳境外專班',
  'ENE-電子所',
  'ESS-工科系',
  'EST-環境博士學程',
  'FL-外語系',
  'FMMI-流體晶材料與智能系碩專班',
  'GLLB-學士後法律',
  'GOM-全球運籌管碩士學程',
  'GPTS-台研教在職學位班',
  'HBA-健康經管專班',
  'HIS-歷史所',
  'HSS-人社英學士班',
  'IACS-亞際文化碩士學程',
  'IBIP-國際學士班',
  'ICMS-科技所',
  'IEEM-工工系',
  'IEM-工工在職班',
  'IIMT-智慧製造技術產碩專班',
  'IIS-資訊所',
  'ILS-學科所',
  'IMBA-IMBA碩士班',
  'IMIE-智生馬達電控產碩專班',
  'IMII-AI智造與物聯網產碩專班',
  'IMS-奈微國際碩士',
  'IPE-工學院學士班',
  'IPHD-跨院國際博士',
  'IPIM-智生製造產碩專班',
  'IPMT-科管院學士班',
  'IPNS-原科院學士班',
  'IPT-光電所',
  'IPTH-清華學院學士班',
  'ISA-資應所',
  'ISS-服科所',
  'JAD-藝設系',
  'JADN-藝設系在職專班',
  'JANT-科藝所',
  'JITA-藝術學院學士班',
  'JMU',
  'JUM-音樂系',
  'JMUN-音樂系在職專班',
  'KCSN-學前教教在職專班',
  'KEC-幼教系',
  'KECN-特文系在職專班'
];
