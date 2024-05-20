create database occupationdb;

use occupationdb;

CREATE TABLE `users` (
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
);

INSERT INTO `occupationdb`.`users`
(`username`,
`password`)
VALUES
('an@gmail.com', '$2y$10$yIqZ6DJroEx7x7/u4v7rRe3JFJ1Gkbo8N1YTQ5i7AnfS3xzs1eh12'),
('binh@gmail.com', '$2y$10$6RzjzvsCs8R0dWPCVcdp7OgC6zhG4ODUWpibKVM33QvltH50sjH2O'),
('hoa@gmail.com', '$2y$10$FZF8byr/pszItKQwJLBphOMVb6NyguksdtIazY7hqVMlSZ0v7B/qy'),
('lam@gmail.com', '$2a$12$FvhOXIeapXtDexFpwjf2JuqNej6rvA0ADiNlzMhNZpB.Gpbu1OVWC'),
('lephonglam92@gmail.com', '$2a$10$jbii6gniRqbAYtg/OU5JFuibGrgYsC5wtF146WuWB90BSUbDWdQsK'),
('phong@gmail.com', '$2y$10$YC0km1yWSVto3QY77bmUxuKKzvkepf/Eaom..zSMjZS9JMhgor4qC');

CREATE TABLE `users_roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `role_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `user_roleFK_idx` (`username`),
  CONSTRAINT `user_roleFK` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);

INSERT INTO `occupationdb`.`users_roles`
(`username`,
`role_desc`)
VALUES
('lam@gmail.com', 'ADMIN'),
('phong@gmail.com', 'USER'),
('hoa@gmail.com', 'EMPLOYER'),
('binh@gmail.com', 'EMPLOYER'),
('lephonglam92@gmail.com', 'USER'),
('an@gmail.com', 'EMPLOYER');

CREATE TABLE `company` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL DEFAULT 'ic4.png',
  `city` varchar(45) NOT NULL,
  `contact_email` varchar(200) NOT NULL,
  PRIMARY KEY (`comp_id`),
  KEY `emailFK_idx` (`contact_email`),
  CONSTRAINT `emailFK` FOREIGN KEY (`contact_email`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `occupationdb`.`company`
(`contact_name`,
`company_name`,
`phone`,
`address`,
`image`,
`city`,
`contact_email`)
VALUES
('Nguyễn Văn An', 'FPT Software', '0123456789', 'FPT Complex, đường Nam Kỳ Khởi Nghĩa, phường Hoà Hải, quận Ngũ Hành Sơn, Đà Nẵng', 'fpt-logo.png', 'Đà Nẵng', 'an@gmail.com'),
('Lê Thị Hoa', 'Home Credit', '0123456789', 'Tầng 12, Tòa nhà Viet Tower, số 1, 2 Thái Hà, Phường Trung Liệt, Quận Đống đa, Hà Nội', 'home-credit.png', 'Hà Nội', 'hoa@gmail.com'),
('Trần Phương Bình', 'Grab', '0123456789', 'Tòa nhà Mapletree Business Centre, 1060 Nguyễn Văn Linh, Phường Tân Phong, Quận 7, Thành phố Hồ Chí Minh', 'grab-vietnam.png', 'Hồ Chí Minh', 'binh@gmail.com');

CREATE TABLE `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `job_require` longtext NOT NULL,
  `interest` longtext NOT NULL,
  `quantity` int NOT NULL,
  `max_salary` double NOT NULL,
  `min_salary` double NOT NULL,
  `profession` varchar(100) NOT NULL,
  `due_date` varchar(50) NOT NULL,
  `confirm` tinyint NOT NULL DEFAULT '0',
  `city` varchar(45) NOT NULL,
  `comp_id` int NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `comp_id_idx` (`comp_id`),
  CONSTRAINT `comp_id` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `occupationdb`.`job`
(`title`,
`description`,
`job_require`,
`interest`,
`quantity`,
`max_salary`,
`min_salary`,
`profession`,
`due_date`,
`confirm`,
`city`,
`comp_id`)
VALUES
('Embedded Software Engineer', 'Our vendor is the world leading company in IoT Wireless technology including Bluetooth, Zigbee, Z-wave, Proprietary wireless, Thread, Wi-Fi, Wi-Sun. The projects are dealing with hardware integration and software platform for IOT applications such as Home Automation & Security, lighting, Industrial Automation, Smart Metering, Retail & Commercial. The software platforms include RTOS, drivers, security and middleware while hardware platforms include IoT SOC, radio modules and development boards. With the future of a smarter world and stage-of-art radio frequency, mesh networking, high-end tool chains from the vendor, you have a chance to look for deeper software development to solve key problems in IoT nowadays.', 'Strong in Embedded C programming.From 1.5 years experience in embedded software development.Basic English verbal communication', '“FPT care” health insurance provided by AON and is exclusive for FPT employees.Annual Summer Vacation: follows company’s policy and starts from May every year.Salary review once a year or on excellent performance.', 4, 30000000, 10000000, 'CNTT-Phần mềm', '2023/12/31', 1, 'Đà Nẵng', 1),
('Chuyên Viên Kinh Doanh (Giải Pháp CNTT)', 'Tiềm kiếm, phát triển và giới thiệu tới khách hàng các giải pháp, phần mềm và dịch vụ CNTT. \nNghiên cứu thị trường, thu thập và xây dựng database khách hàng tiềm năng. \nĐàm phán, thương lượng và thuyết phục khách hàng sử dụng dịch vụ. \nPhối hợp với các bộ phận phòng ban có liên quan để triển khai dịch vụ và chăm sóc Khách hàng.\nĐề xuất và thực hiện các kế hoạch, chiến lược kinh doanh để quảng bá thương hiệu công ty. \nCông việc sẽ trao đổi chi tiết thêm trong quá trình phỏng vấn.', 'Tốt nghiệp ĐH chuyên ngành Kinh tế, Quản trị Kinh doanh, Ngoại ngữ, Công nghệ Thông tin….\n Đam mê kinh doanh, chủ động trong công việc.\n Ưu tiên có hiểu biết, kiến thức về Công nghệ thông tin.\n Kỹ năng trình bày/thuyết trình tốt, kỹ năng đàm phán, thuyết phục khách hàng tốt.', 'Thời gian làm việc: Thứ Hai – Thứ Sáu.\n Được làm việc với các doanh nghiệp, tập đoàn trong và ngoài nước ở nhiều lĩnh vực khác nhau.\n Được học hỏi, đào tạo và tham gia vào các dự án lớn theo xu hướng công nghệ 4.0 trong lĩnh vực: Chính phủ, Y tế 4.0, SmartCity, Doanh nghiệp, Ngân hàng.\n Môi trường làm việc thân thiện, năng động.\n Được tham gia bảo hiểm đầy đủ theo quy định của pháp luật & Khám sức khỏe định kỳ hàng năm.\n Được tham gia bảo hiểm FPTCare cho bản thân và gia đình;', 2, 15000000, 10000000, 'Bán hàng/Kinh doanh', '2023/12/31', 1, 'Đà Nẵng', 1),
('Verification Engineer', ' Engineers for pre- and/or post-silicon verification of mixed-signal integrated\n circuits, satisfying the most challenging quality criteria of the automotive market using state-of-the-art tools\n and methodology. The customer is the No. 1 in the world-wide automotive semiconductor market.\n Their products cover microprocessors, microcontrollers, and mixed-signal and analog devices in multiple domains,\n e.g., in vehicle networking, Advanced Driver Assistant Systems (ADAS), power management, etc.\n In this project, products related to Secure Car Access will be involved.\n Ensure the correct operation of digital hardware and System-on-a-Chip with focus on integration and usage on system level', 'Background in computer engineering, electrical engineering and similar majors.\n Testing/verification mindset.\n Knowledge in digital hardware design for embedded systems.\n Experience of hardware description language (Verilog/SystemVerilog, VHDL, with AMS)', '“FPT care” health insurance provided by AON and is exclusive for FPT employees.\n Annual Summer Vacation: follows company’s policy and starts from May every year.\n Salary review once a year or on excellent performance.\n International, dynamic, friendly working environment', 4, 20000000, 10000000, 'CNTT - Phần mềm', '2023/12/31', 1, 'Đà Nẵng', 1),
('Automation Test', '  Estimates testing efforts and takes care that they are considered in the story points.\n Takes care that user stories and acceptance criteria are testable.\n Creates, manages and executes automation test cases based on user stories and technical specifications.\n Log bug to Defect management tool and communicates test related impediments timely.\n Execute automated tests on demand', 'Experience as a Test Automation Engineer such as Selenium, Appium, Katalon, Ranorex, Jenkin.\n Proficiency in programming languages such as C, C++, Java, Java Script, Python.\n Experience in Web driver, TestNG, and automation framework POM / Keyword or hybrid.\n Experience in TDD, Cucumber frameworks, API testing', 'COMPETITIVE SALARY PACKAGE based on your competent plus Annual Bonus and Project \n Performance Bonus “FPT care” health insurance provided by AON and is exclusive for FPT employees.\n Young and competitive environment – we don’t focus on the projects only, we also focus on personal development.\n “FPT care” health insurance provided by AON and is exclusive for FPT employees.', 4, 15000000, 10000000, 'CNTT - Phần mềm', '2023/12/31', 1, 'Đà Nẵng', 1),
('Nhân Viên Tư Vấn Trả Góp', 'Tư vấn gói vay trả góp sản phẩm tại các cửa hàng đối tác liên kết của Home Credit.\n Tìm kiếm khách hàng mới và chăm sóc khách hàng cũ.\n 50% trực cửa hàng, 50% hỗ trở di chuyển làm hợp đồng cho khách hàng.\n Hướng dẫn khách hàng hoàn tất hợp đồng.\n Thời gian làm việc linh hoạt: 8 tiếng/ngày, nghỉ 1 ngày/ tuần', 'Nam/Nữ, từ 18 – 33 tuổi.\n Yêu thích công việc bán hàng, tư vấn và chăm sóc khách hàng, thu nhập không giới hạn.\n Giao tiếp tốt, có kỹ năng thuyết phục.\n Cẩn thận, trung thực, chịu khó', 'Thu nhập từ 10.000.000 - 20.000.000 đồng/tháng (hưởng 100% lương trong 2 tháng thử việc).\n Thưởng doanh số hàng tháng theo năng lực cá nhân.\n Được đào tạo nghiệp vụ (có lương) & Lộ trình thăng tiến rõ ràng.\n Lương tháng 13', 10, 20000000, 10000000, 'Tài Chính', '2023/12/31', 1, 'Hà Nội', 2),
('Nhân Viên Hỗ Trợ Kinh Doanh', 'Tư vấn gói vay trả góp sản phẩm tại các cửa hàng đối tác liên kết của Home Credit.\n Tìm kiếm khách hàng mới và chăm sóc khách hàng cũ.\n 50% trực cửa hàng, 50% hỗ trở di chuyển làm hợp đồng cho khách hàng.\n Hướng dẫn khách hàng hoàn tất hợp đồng.\n Thời gian làm việc linh hoạt: 8 tiếng/ngày, nghỉ 1 ngày/ tuần', 'Nam/Nữ, từ 18 – 33 tuổi.\n Yêu thích công việc bán hàng, tư vấn và chăm sóc khách hàng, thu nhập không giới hạn.\n Giao tiếp tốt, có kỹ năng thuyết phục.\n Cẩn thận, trung thực, chịu khó', 'Thu nhập từ 10.000.000 - 20.000.000 đồng/tháng (hưởng 100% lương trong 2 tháng thử việc).\n Thưởng doanh số hàng tháng theo năng lực cá nhân.\n Được đào tạo nghiệp vụ (có lương) & Lộ trình thăng tiến rõ ràng.\n Lương tháng 13', 10, 20000000, 10000000, 'Tài Chính', '2023/12/31', 1, 'Hà Nội', 2),
('Nhân Viên Tư Vấn Bán Hàng', 'Tìm kiếm khách hàng thông qua data công công ty và các nguồn khác nhau, tư vấn sản phẩm đến khách hàng mới và khách hàng cũ.\n- Hỗ trợ giới thiệu, tư vấn gói vay trả góp sản phẩm tại các cửa hàng điện thoại, điện máy, xe máy.\n Telesale khách hàng cũ theo thông tin công ty cung cấp, giới thiệu các chương trình ưu đãi và sản phẩm của Home Credit.\n 60% trực shop, 40% hỗ trợ di chuyển đến khách hàng hoàn tất hợp đồng.\n Thời gian làm việc: 8 tiếng/ngày, nghỉ 1 ngày/ tuần', 'Nam/Nữ, từ 18 – 33 tuổi.\n Yêu thích công việc bán hàng, tư vấn và chăm sóc khách hàng, thu nhập không giới hạn.\n Giao tiếp tốt, có kỹ năng thuyết phục.\n Cẩn thận, trung thực, chịu khó', 'Thu nhập từ 10.000.000 - 20.000.000 đồng/tháng (hưởng 100% lương trong 2 tháng thử việc).\n Thưởng doanh số hàng tháng theo năng lực cá nhân.\n Được đào tạo nghiệp vụ (có lương) & Lộ trình thăng tiến rõ ràng.\n Lương tháng 13', 10, 20000000, 10000000, 'Tài Chính', '2023/12/31', 1, 'Hà Nội', 2),
('Nhân viên chăm sóc khách hàng GRAB', 'Tiếp nhận cuộc gọi đến , giải đáp thắc mắc của khách hàng về dịch vụ booking xe.\n Không call đi , không áp doanh số.\n Chưa có kinh nghiệm sẽ được training.', 'Tốt nghiệp THPT trở lên.\n Nam + Nữ (Tuổi 18t -35t).\n Kỹ năng đánh máy, giao tiếp tốt.', 'Lương TB : 6.700.000 - 7.200,000 ( LCB : 4.700.000 – 5.500.000 + 500.000 tiền ăn + 900.000 – 1.200.000 thưởng doanh số ).\n Được tham gia BH đầy đủ.\n Có thiết bị nhà bếp, giường nằm cho nv nghỉ.\n 14 ngày phép/năm', 4, 7000000, 6000000, 'Vận tải hành khách', '2023/12/31', 1, 'Hồ Chí Minh', 3),
('Giám Sát Vận Hành Đối Tác Tài Xế', 'Trực tiếp điều hành hoạt động vận hành: điều phối tài xế và hàng hóa theo đúng thiết kế của công ty đưa ra. Kiểm soát lấy/giao hàng các chuyến đối tác tài xế mình quản lý chạy.\n Phỏng vấn tuyển dụng, đào tạo, huấn luyện và quản lý đối tác tài xế.\n Quản lý vận hành đối tác tài xế và đảm bảo tuân thủ các chính sách, quy trình và tiêu chuẩn hoạt động dành cho tài xế.\n Xây dựng và quản lý chiến lược phát triển đối tác tài xế.', 'Tuổi từ 25 - 35, tốt nghiệp trung cấp trở lên.\n Có kinh nghiệm 03 năm trong việc quản lý, làm việc trong lĩnh vực last mile delivery.\n Có kiến thức về logistics, giao nhận, thương mại điện tử.\n Ưu tiên các ứng viên làm việc tại các Công ty như Grab, Gojek, Loship, Ahamove, Be, Lalamove.\n Có kỹ năng thuyết trình, huấn luyện, kèm cặp nhân viên;', 'Thu nhập thỏa thuận.\n Lương tháng 13, review lương, quà tết, sinh nhật, 8/3, 20/10.\n Chế độ bảo hiểm đầy đủ theo quy định như: BHXH, BHTN, BHYT.\n Du lịch, hoạt động team building, tất niên,...', 4, 10000000, 8000000, 'Vận tải hành khách', '2023/12/31', 1, 'Hồ Chí Minh', 3),
('Grab Car Driver', 'Trực tiếp điều hành hoạt động vận hành: điều phối tài xế và hàng hóa theo đúng thiết kế của công ty đưa ra. Kiểm soát lấy/giao hàng các chuyến đối tác tài xế mình quản lý chạy.\n Phỏng vấn tuyển dụng, đào tạo, huấn luyện và quản lý đối tác tài xế.\n Quản lý vận hành đối tác tài xế và đảm bảo tuân thủ các chính sách, quy trình và tiêu chuẩn hoạt động dành cho tài xế.\n Xây dựng và quản lý chiến lược phát triển đối tác tài xế.', 'Tuổi từ 25 - 35, tốt nghiệp trung cấp trở lên.\n Có kinh nghiệm 03 năm trong việc quản lý, làm việc trong lĩnh vực last mile delivery.\n Có kiến thức về logistics, giao nhận, thương mại điện tử.\n Ưu tiên các ứng viên làm việc tại các Công ty như Grab, Gojek, Loship, Ahamove, Be, Lalamove.\n Có kỹ năng thuyết trình, huấn luyện, kèm cặp nhân viên;', 'Thu nhập thỏa thuận.\n Lương tháng 13, review lương, quà tết, sinh nhật, 8/3, 20/10.\n Chế độ bảo hiểm đầy đủ theo quy định như: BHXH, BHTN, BHYT.\n Du lịch, hoạt động team building, tất niên,...', 4, 10000000, 8000000, 'Vận tải hành khách', '2023/09/23', 1, 'Hồ Chí Minh', 3);

CREATE TABLE `profile` (
  `prof_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `user_prof` varchar(100) NOT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `email_pro_idx` (`user_prof`),
  CONSTRAINT `user_proFK` FOREIGN KEY (`user_prof`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `occupationdb`.`profile`
(`name`,
`phone`,
`address`,
`sex`,
`dob`,
`user_prof`)
VALUES
('Lam Le', '0786845761', 'Bình Định', 'Nam', '1990/08/31', 'phong@gmail.com');

CREATE TABLE `job_profile` (
  `prof_id` int NOT NULL,
  `job_id` int NOT NULL,
  `file_cv` varchar(100) NOT NULL,
  PRIMARY KEY (`prof_id`,`job_id`),
  KEY `prof_id_idx` (`prof_id`),
  KEY `job_id_idx` (`job_id`),
  CONSTRAINT `job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prof_id` FOREIGN KEY (`prof_id`) REFERENCES `profile` (`prof_id`) ON DELETE CASCADE ON UPDATE CASCADE
);