DROP DATABASE IF EXISTS onus;

CREATE DATABASE IF NOT EXISTS onus;

USE onus;

CREATE TABLE IF NOT EXISTS employee (
    employeeId INT,
    city VARCHAR(25),
    income INT,
    status TINYTEXT,
    roleTitle TINYTEXT,
    phoneNumber VARCHAR(25),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    age INT,
    email VARCHAR(75) UNIQUE,
    supID INT,
    PRIMARY KEY (employeeId),
    FOREIGN KEY (supID) REFERENCES employee(employeeId)
);

CREATE TABLE IF NOT EXISTS meeting (
    meetingId INT,
    location VARCHAR(75),
    time TIME,
    date DATE,
    employeeId INT,
    PRIMARY KEY (meetingId),
    FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);

CREATE TABLE IF NOT EXISTS feedback (
    date  DATE,
    time TIME,
    comment    TINYTEXT,
    feedbackId INT,
    meetingId  INT,
    FOREIGN KEY (meetingId) REFERENCES meeting (meetingId)
);


CREATE TABLE IF NOT EXISTS task (
    taskId INT,
    description TEXT,
    dueDate DATE,
    status TINYTEXT,
    employeeId INT,
    FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);

CREATE TABLE IF NOT EXISTS timeLog (
    logId INT,
    date DATE,
    hours INT,
    tasksCompleted INT,
    PRIMARY KEY (logId)
);

CREATE TABLE IF NOT EXISTS employeeTimeLog (
    employeeId INT,
    logId INT,
    FOREIGN KEY (employeeId) REFERENCES employee(employeeId),
    FOREIGN KEY (logId) REFERENCES timeLog(logId)
);

CREATE TABLE IF NOT EXISTS professor (
    profId INT,
    firstName VARCHAR(75),
    lastName VARCHAR(75),
    department VARCHAR(75),
    PRIMARY KEY (profId)
);

CREATE TABLE IF NOT EXISTS course (
    courseId INT,
    section VARCHAR(50),
    courseName VARCHAR(50),
    profId INT,
    PRIMARY KEY (courseId),
    FOREIGN KEY (profId) REFERENCES professor(profId)
);

CREATE TABLE IF NOT EXISTS project (
    projectId INT PRIMARY KEY,
    status TINYTEXT,
    timeline VARCHAR(200),
    industry VARCHAR(50),
    summary TEXT,
    projectName VARCHAR(50),
    dueDate DATE,
    courseId INT,
    FOREIGN KEY (courseId) REFERENCES course(courseId)
);

CREATE TABLE IF NOT EXISTS employeeProject (
    employeeId INT,
    projectId INT,
    FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);

CREATE TABLE IF NOT EXISTS projectTimeLog (
    projectId INT,
    logId INT,
    FOREIGN KEY (projectId) REFERENCES project(projectId),
    FOREIGN KEY (logId) REFERENCES timeLog(logId)
);

CREATE TABLE IF NOT EXISTS clientCommunication (
    messageId INT,
    attachments TEXT,
    client VARCHAR(75),
    text TEXT,
    projectId INT,
    PRIMARY KEY (messageId),
    FOREIGN KEY (projectId) REFERENCES project(projectId)
);

CREATE TABLE IF NOT EXISTS groupMembers (
    memberId INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    role VARCHAR(1000),
    projectId INT,
    FOREIGN KEY (projectId) REFERENCES project(projectId)
);

CREATE TABLE IF NOT EXISTS exam (
    examId INT,
    date DATE,
    grade INT,
    courseId INT,
    FOREIGN KEY (courseId) REFERENCES course(courseId)
);

CREATE TABLE IF NOT EXISTS section (
    sectionId INT PRIMARY KEY,
    sectionNumber INT,
    courseId INT,
    FOREIGN KEY (courseId) REFERENCES course(courseId)
);

CREATE TABLE IF NOT EXISTS student (
    studentId INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    phoneNumber VARCHAR(15),
    year INT,
    email VARCHAR(75),
    PRIMARY KEY (studentId)
);

CREATE TABLE IF NOT EXISTS studentSection (
    studentId INT,
    sectionId INT,
    FOREIGN KEY (studentId) REFERENCES student(studentId),
    FOREIGN KEY (sectionId) REFERENCES section(sectionId)
);

CREATE TABLE IF NOT EXISTS attendance (
    attendanceId INT,
    date DATE,
    status TINYTEXT,
    PRIMARY KEY (attendanceId)
);

CREATE TABLE IF NOT EXISTS studentAttendance (
    studentId INT,
    sectionId INT,
    attendanceId INT,
    FOREIGN KEY (studentId) REFERENCES student(studentId),
    FOREIGN KEY (sectionId) REFERENCES section(sectionId),
    FOREIGN KEY (attendanceId) REFERENCES attendance(attendanceId)
);

CREATE TABLE IF NOT EXISTS homeworkAssignment (
    homeworkId INT,
    dueDate DATE,
    description TEXT,
    status TINYTEXT,
    type VARCHAR(500),
    studentId INT,
    courseId INT,
    PRIMARY KEY (homeworkId),
    FOREIGN KEY (studentId) REFERENCES student(studentId),
    FOREIGN KEY (courseId) REFERENCES course(courseId)
);

CREATE TABLE IF NOT EXISTS homeworkSubmission (
    submissionId INT,
    submissionDate DATE,
    grade TINYTEXT,
    homeworkId INT,
    studentId INT,
    PRIMARY KEY (submissionId),
    FOREIGN KEY (homeworkId) REFERENCES homeworkAssignment(homeworkId),
    FOREIGN KEY (studentId) REFERENCES student(studentId)
);

CREATE TABLE IF NOT EXISTS studyPlan (
    planId INT,
    examDate DATE,
    chapters TINYTEXT,
    confidenceLevel INT,
    homeworkId INT,
    PRIMARY KEY (planId),
    FOREIGN KEY (homeworkId) REFERENCES homeworkAssignment(homeworkId)
);

# IF NOT EXISTS
CREATE TABLE IF NOT EXISTS studyBreak (
    breakId INT,
    startTime TIME,
    endTime TIME,
    homeworkId INT,
    PRIMARY KEY (breakId),
    FOREIGN KEY (homeworkId) REFERENCES homeworkAssignment(homeworkId)
);

# employee
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (1, 'Ochakiv', 130172, 1, 'Financial Analyst', '167-175-5171', 'Claudianus', 'Bewshea', 50, 'cbewshea0@shop-pro.jp', NULL);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (2, 'Bazar-Korgon', 428816, 0, 'Account Representative III', '944-444-0852', 'Maryjane', 'Joffe', 61, 'mjoffe1@infoseek.co.jp', NULL);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (3, 'Teseney', 164495, 1, 'Account Coordinator', '225-502-9811', 'Brady', 'Scutchings', 60, 'bscutchings2@angelfire.com', NULL);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (4, 'La Huerta', 63249, 0, 'Senior Quality Engineer', '818-669-4296', 'Corney', 'Gibben', 36, 'cgibben3@ucsd.edu', NULL);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (5, 'Balkh', 345859, 0, 'Database Administrator III', '672-975-7554', 'Madlen', 'Chatenet', 55, 'mchatenet4@ucoz.com', NULL);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (6, 'Lazurne', 216408, 0, 'Research Nurse', '902-421-6940', 'Nat', 'Castagne', 37, 'ncastagne5@admin.ch', 1);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (7, 'Orocuina', 95675, 0, 'Tax Accountant', '411-264-5290', 'Raeann', 'Gater', 34, 'rgater6@technorati.com', 1);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (8, 'Huancapallac', 300811, 0, 'Staff Scientist', '950-970-2238', 'Deloria', 'Parfrey', 43, 'dparfrey7@aboutads.info', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (9, 'Ourtzagh', 174928, 0, 'Civil Engineer', '209-410-7389', 'Errol', 'Hutfield', 40, 'ehutfield8@chronoengine.com', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (10, 'Saint-Paul', 59531, 1, 'Librarian', '324-653-1420', 'Giacopo', 'Hurler', 72, 'ghurler9@imageshack.us', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (11, 'Dimitsána', 245842, 0, 'Marketing Manager', '694-114-9458', 'Eydie', 'Celes', 44, 'ecelesa@ibm.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (12, 'Ríohacha', 273009, 0, 'Office Assistant IV', '321-799-9267', 'Belinda', 'Saintsbury', 73, 'bsaintsburyb@alexa.com', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (13, 'Bankeryd', 485248, 0, 'Chief Design Engineer', '306-297-4011', 'Hulda', 'Keenan', 70, 'hkeenanc@creativecommons.org', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (14, 'Kamennyye Potoki', 93085, 0, 'Account Representative III', '678-973-1956', 'Petronille', 'Ickovic', 40, 'pickovicd@illinois.edu', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (15, 'Gammad', 169759, 1, 'Assistant Manager', '222-547-3485', 'Clarey', 'Bonnier', 56, 'cbonniere@slideshare.net', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (16, 'Berat', 488959, 1, 'Information Systems Manager', '166-122-9759', 'Marietta', 'Tournie', 68, 'mtournief@slate.com', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (17, 'Gaoqiao', 344878, 0, 'Structural Engineer', '784-752-5469', 'Merv', 'Abethell', 62, 'mabethellg@google.com.br', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (18, 'Kedrovoye', 129447, 0, 'Recruiting Manager', '998-966-8516', 'Melanie', 'Pote', 35, 'mpoteh@amazon.co.uk', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (19, 'Akhmīm', 152287, 1, 'Speech Pathologist', '289-522-4252', 'Joshuah', 'Stamp', 63, 'jstampi@ucoz.com', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (20, 'São José dos Pinhais', 365012, 0, 'Developer II', '430-182-9765', 'Georgie', 'Fayers', 71, 'gfayersj@cdc.gov', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (21, 'Jōetsu', 446224, 1, 'Engineer III', '751-284-6684', 'Grove', 'Eyden', 73, 'geydenk@webnode.com', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (22, 'Izumi', 443878, 0, 'Sales Representative', '118-652-3908', 'Grayce', 'Hourigan', 41, 'ghouriganl@mapquest.com', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (23, 'Montfavet', 245643, 0, 'Help Desk Operator', '799-813-0489', 'Francois', 'Gooms', 34, 'fgoomsm@ft.com', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (24, 'Sulaco', 140587, 1, 'Recruiting Manager', '476-346-3043', 'Payton', 'Nizet', 25, 'pnizetn@huffingtonpost.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (25, 'Colón', 472367, 0, 'Technical Writer', '607-156-2803', 'Aura', 'Roughsedge', 55, 'aroughsedgeo@1688.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (26, 'El Tránsito', 55898, 0, 'Safety Technician II', '704-218-5483', 'Arnuad', 'Lord', 68, 'alordp@sourceforge.net', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (27, 'Pedrulheira', 299694, 1, 'Administrative Assistant IV', '440-654-5760', 'Dougy', 'Tysall', 33, 'dtysallq@shop-pro.jp', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (28, 'Probolinggo', 433073, 0, 'Software Test Engineer I', '691-447-6192', 'Fraze', 'Shurmore', 62, 'fshurmorer@sina.com.cn', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (29, 'Elena', 142462, 1, 'Information Systems Manager', '631-539-6811', 'Mireille', 'Pomroy', 67, 'mpomroys@apache.org', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (30, 'Riangblolong', 96091, 1, 'Web Designer II', '361-888-1530', 'Koressa', 'Windley', 26, 'kwindleyt@dailymail.co.uk', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (31, 'Donskoye', 186286, 0, 'Occupational Therapist', '368-883-5150', 'Elizabet', 'Robelet', 32, 'erobeletu@narod.ru', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (32, 'Frankfurt am Main', 395691, 1, 'Biostatistician II', '476-961-7449', 'Corbet', 'Maypowder', 68, 'cmaypowderv@nationalgeographic.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (33, 'Qal‘ah-ye Shahr', 202947, 1, 'Mechanical Systems Engineer', '608-795-4290', 'Leora', 'Grisley', 47, 'lgrisleyw@constantcontact.com', 1);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (34, 'Dzoraghbyur', 337372, 1, 'Business Systems Development Analyst', '500-637-8474', 'Dennis', 'Allworthy', 56, 'dallworthyx@amazon.com', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (35, 'Winong', 324724, 0, 'Chemical Engineer', '413-666-3449', 'Mollie', 'Rubertelli', 69, 'mrubertelliy@mayoclinic.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (36, 'Carman', 230745, 0, 'Marketing Manager', '602-618-3584', 'Karla', 'Hindenburg', 73, 'khindenburgz@nih.gov', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (37, 'Cukanguncal', 324485, 0, 'VP Sales', '887-193-0734', 'Viviana', 'Jakab', 63, 'vjakab10@japanpost.jp', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (38, 'Laagri', 410272, 1, 'Cost Accountant', '596-683-1750', 'Marylou', 'Polhill', 61, 'mpolhill11@discuz.net', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (39, 'Matanza', 53734, 0, 'Project Manager', '879-884-0181', 'Wyatan', 'Corkett', 48, 'wcorkett12@imgur.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (40, 'Petaling Jaya', 383829, 1, 'Human Resources Manager', '553-393-7919', 'Ethelda', 'Tomasik', 68, 'etomasik13@scientificamerican.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (41, 'Warnes', 249561, 0, 'VP Marketing', '436-562-8408', 'Steffi', 'Longforth', 67, 'slongforth14@cbslocal.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (42, 'Farsta', 464332, 1, 'Paralegal', '238-547-5936', 'Margarete', 'Cressingham', 29, 'mcressingham15@marriott.com', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (43, 'Ituverava', 78865, 1, 'Biostatistician II', '916-525-1007', 'Karolina', 'Connichie', 36, 'kconnichie16@squidoo.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (44, 'Guéret', 371397, 0, 'Financial Advisor', '905-359-1075', 'Zared', 'Osburn', 46, 'zosburn17@hostgator.com', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (45, 'Napalitan', 114236, 0, 'Senior Sales Associate', '279-653-6405', 'Elianore', 'Vian', 38, 'evian18@about.me', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (46, 'Baddomalhi', 308146, 0, 'Geologist IV', '439-898-2811', 'Dilly', 'Blaasch', 75, 'dblaasch19@blogger.com', 2);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (47, 'Duoxiang', 121065, 0, 'Database Administrator II', '739-435-6969', 'Pearl', 'Youngs', 51, 'pyoungs1a@state.gov', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (48, 'Hamilton', 158340, 1, 'Desktop Support Technician', '214-999-5360', 'Ambrosi', 'Godber', 43, 'agodber1b@infoseek.co.jp', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (49, 'Sonzacate', 471112, 0, 'Systems Administrator III', '728-914-6992', 'Gabriele', 'Spaduzza', 51, 'gspaduzza1c@skyrock.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (50, 'İsmayıllı', 328112, 1, 'Technical Writer', '295-140-5571', 'Claude', 'Muff', 29, 'cmuff1d@patch.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (51, 'Šumice', 81921, 0, 'Teacher', '243-308-6689', 'Aluino', 'Threlfall', 36, 'athrelfall1e@bbb.org', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (52, 'Cibolang', 119969, 1, 'Account Executive', '562-825-7968', 'Zed', 'Kinghorn', 60, 'zkinghorn1f@is.gd', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (53, 'Contraalmirante Cordero', 57676, 1, 'Assistant Manager', '727-725-4668', 'Rodrick', 'Caris', 31, 'rcaris1g@apple.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (54, 'Köln', 166727, 1, 'Nurse', '755-718-5015', 'Kliment', 'Alfonsetto', 44, 'kalfonsetto1h@etsy.com', 3);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (55, 'Chixi', 233665, 0, 'Nurse', '504-896-7042', 'Alec', 'Milvarnie', 38, 'amilvarnie1i@msu.edu', 1);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (56, 'Longjin', 94740, 1, 'Safety Technician II', '755-846-5586', 'Irena', 'Wapplington', 68, 'iwapplington1j@stanford.edu', 1);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (57, 'Le Mans', 301821, 0, 'Junior Executive', '308-788-9854', 'Lindon', 'Garnsworth', 69, 'lgarnsworth1k@boston.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (58, 'Obukhiv', 67358, 0, 'Teacher', '378-755-4914', 'Ronni', 'Leopold', 44, 'rleopold1l@oracle.com', 5);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (59, 'Heshui', 370296, 0, 'Computer Systems Analyst I', '353-674-7956', 'Starlin', 'Lindelof', 59, 'slindelof1m@google.es', 4);
insert into employee (employeeId, city, income, status, roleTitle, phoneNumber, firstName, lastName, age, email, supId) values (60, 'Bechyně', 246054, 0, 'Electrical Engineer', '101-169-6919', 'Joe', 'Deverose', 49, 'jdeverose1n@sogou.com', 2);

# meeting
insert into meeting (meetingId, location, time, date, employeeId) values (1, 'room-540', '12:44:02', '2023-03-22', '7');
insert into meeting (meetingId, location, time, date, employeeId) values (2, 'room-538', '14:45:36', '2022-12-20', '12');
insert into meeting (meetingId, location, time, date, employeeId) values (3, 'room-696', '16:50:14', '2023-01-23', '20');
insert into meeting (meetingId, location, time, date, employeeId) values (4, 'room-965', '11:22:52', '2023-06-29', '53');
insert into meeting (meetingId, location, time, date, employeeId) values (5, 'room-539', '18:41:14', '2023-10-23', '10');
insert into meeting (meetingId, location, time, date, employeeId) values (6, 'room-641', '18:39:48', '2023-07-13', '15');
insert into meeting (meetingId, location, time, date, employeeId) values (7, 'room-073', '22:14:25', '2023-08-23', '39');
insert into meeting (meetingId, location, time, date, employeeId) values (8, 'room-305', '0:08:54', '2023-10-17', '16');
insert into meeting (meetingId, location, time, date, employeeId) values (9, 'room-638', '17:20:02', '2023-01-05', '58');
insert into meeting (meetingId, location, time, date, employeeId) values (10, 'room-837', '19:18:12', '2023-07-14', '25');
insert into meeting (meetingId, location, time, date, employeeId) values (11, 'room-748', '8:21:36', '2023-05-27', '45');
insert into meeting (meetingId, location, time, date, employeeId) values (12, 'room-942', '22:26:23', '2023-03-09', '8');
insert into meeting (meetingId, location, time, date, employeeId) values (13, 'room-177', '21:10:09', '2023-11-14', '5');
insert into meeting (meetingId, location, time, date, employeeId) values (14, 'room-700', '17:04:59', '2023-03-15', '60');
insert into meeting (meetingId, location, time, date, employeeId) values (15, 'room-045', '15:22:54', '2023-08-30', '27');
insert into meeting (meetingId, location, time, date, employeeId) values (16, 'room-328', '17:32:49', '2022-12-09', '37');
insert into meeting (meetingId, location, time, date, employeeId) values (17, 'room-595', '20:13:55', '2023-03-13', '52');
insert into meeting (meetingId, location, time, date, employeeId) values (18, 'room-968', '15:02:37', '2023-06-24', '17');
insert into meeting (meetingId, location, time, date, employeeId) values (19, 'room-665', '13:51:40', '2023-09-19', '11');
insert into meeting (meetingId, location, time, date, employeeId) values (20, 'room-218', '19:10:17', '2023-05-03', '22');
insert into meeting (meetingId, location, time, date, employeeId) values (21, 'room-741', '9:32:23', '2022-12-31', '59');
insert into meeting (meetingId, location, time, date, employeeId) values (22, 'room-669', '23:54:52', '2023-08-11', '28');
insert into meeting (meetingId, location, time, date, employeeId) values (23, 'room-677', '2:09:21', '2023-05-27', '38');
insert into meeting (meetingId, location, time, date, employeeId) values (24, 'room-326', '9:49:53', '2023-09-10', '48');
insert into meeting (meetingId, location, time, date, employeeId) values (25, 'room-037', '18:57:58', '2023-02-08', '35');
insert into meeting (meetingId, location, time, date, employeeId) values (26, 'room-732', '12:22:05', '2023-11-20', '34');
insert into meeting (meetingId, location, time, date, employeeId) values (27, 'room-772', '11:53:12', '2023-07-12', '36');
insert into meeting (meetingId, location, time, date, employeeId) values (28, 'room-526', '18:16:55', '2023-02-08', '29');
insert into meeting (meetingId, location, time, date, employeeId) values (29, 'room-252', '13:25:16', '2023-11-15', '57');
insert into meeting (meetingId, location, time, date, employeeId) values (30, 'room-892', '10:00:03', '2023-05-05', '19');
insert into meeting (meetingId, location, time, date, employeeId) values (31, 'room-750', '4:49:56', '2023-05-24', '2');
insert into meeting (meetingId, location, time, date, employeeId) values (32, 'room-009', '14:50:35', '2023-06-21', '50');
insert into meeting (meetingId, location, time, date, employeeId) values (33, 'room-938', '9:51:30', '2023-11-13', '4');
insert into meeting (meetingId, location, time, date, employeeId) values (34, 'room-076', '8:20:02', '2023-04-02', '13');
insert into meeting (meetingId, location, time, date, employeeId) values (35, 'room-278', '2:24:27', '2023-03-22', '14');
insert into meeting (meetingId, location, time, date, employeeId) values (36, 'room-824', '10:25:59', '2023-08-29', '43');
insert into meeting (meetingId, location, time, date, employeeId) values (37, 'room-555', '15:14:29', '2022-12-31', '46');
insert into meeting (meetingId, location, time, date, employeeId) values (38, 'room-362', '14:02:29', '2022-12-16', '33');
insert into meeting (meetingId, location, time, date, employeeId) values (39, 'room-770', '6:25:48', '2023-03-12', '41');
insert into meeting (meetingId, location, time, date, employeeId) values (40, 'room-485', '5:21:43', '2023-07-07', '1');
insert into meeting (meetingId, location, time, date, employeeId) values (41, 'room-351', '13:12:31', '2023-05-14', '49');
insert into meeting (meetingId, location, time, date, employeeId) values (42, 'room-010', '23:21:27', '2023-02-27', '26');
insert into meeting (meetingId, location, time, date, employeeId) values (43, 'room-997', '21:07:07', '2023-11-21', '3');
insert into meeting (meetingId, location, time, date, employeeId) values (44, 'room-957', '5:19:42', '2023-10-06', '31');
insert into meeting (meetingId, location, time, date, employeeId) values (45, 'room-540', '6:28:38', '2023-04-06', '56');
insert into meeting (meetingId, location, time, date, employeeId) values (46, 'room-370', '3:45:09', '2023-03-22', '40');
insert into meeting (meetingId, location, time, date, employeeId) values (47, 'room-483', '3:11:38', '2022-12-20', '44');
insert into meeting (meetingId, location, time, date, employeeId) values (48, 'room-334', '8:12:52', '2023-03-16', '23');
insert into meeting (meetingId, location, time, date, employeeId) values (49, 'room-177', '19:46:59', '2023-07-25', '30');
insert into meeting (meetingId, location, time, date, employeeId) values (50, 'room-554', '1:06:25', '2023-03-30', '55');
insert into meeting (meetingId, location, time, date, employeeId) values (51, 'room-366', '20:39:18', '2023-05-05', '54');
insert into meeting (meetingId, location, time, date, employeeId) values (52, 'room-450', '0:46:26', '2023-07-19', '32');
insert into meeting (meetingId, location, time, date, employeeId) values (53, 'room-841', '2:32:32', '2023-11-15', '6');
insert into meeting (meetingId, location, time, date, employeeId) values (54, 'room-304', '15:24:38', '2023-01-17', '42');
insert into meeting (meetingId, location, time, date, employeeId) values (55, 'room-354', '17:48:38', '2023-04-30', '51');
insert into meeting (meetingId, location, time, date, employeeId) values (56, 'room-219', '16:12:08', '2023-09-28', '47');
insert into meeting (meetingId, location, time, date, employeeId) values (57, 'room-937', '8:12:45', '2023-03-10', '24');
insert into meeting (meetingId, location, time, date, employeeId) values (58, 'room-291', '0:59:34', '2022-12-31', '21');
insert into meeting (meetingId, location, time, date, employeeId) values (59, 'room-324', '2:32:50', '2023-03-24', '9');
insert into meeting (meetingId, location, time, date, employeeId) values (60, 'room-722', '4:41:15', '2023-01-07', '18');

# feedback
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-02-13', '4:55:48', 'Duis consequat dui nec nisi volutpat eleifend.', 1, '1');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-08-24', '2:06:02', 'Pellentesque eget nunc.', 2, '2');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-26', '3:15:01', 'Praesent blandit lacinia erat.', 3, '3');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-07-03', '22:30:53', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4, '4');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-07-14', '16:04:12', 'Vivamus vestibulum sagittis sapien.', 5, '5');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-07-21', '12:39:44', 'Ut at dolor quis odio consequat varius.', 6, '6');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-02-11', '14:44:49', 'Nunc rhoncus dui vel sem.', 7, '7');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-05-29', '2:35:39', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 8, '8');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-26', '3:09:14', 'Ut tellus.', 9, '9');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-08-15', '18:58:50', 'Maecenas tincidunt lacus at velit.', 10, '10');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-09-09', '13:33:33', 'Etiam faucibus cursus urna.', 11, '11');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-13', '15:55:04', 'Nunc purus.', 12, '12');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-11-14', '18:10:14', 'Nullam varius.', 13, '13');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-06-28', '6:05:26', 'Praesent blandit lacinia erat.', 14, '14');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-09-05', '17:13:37', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 15, '15');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-07', '0:05:44', 'Integer ac leo.', 16, '16');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-05-18', '12:26:27', 'Quisque ut erat.', 17, '17');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-27', '17:18:15', 'Proin eu mi.', 18, '18');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-14', '16:48:44', 'Cras pellentesque volutpat dui.', 19, '19');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-11-16', '17:12:53', 'Fusce consequat.', 20, '20');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-09-26', '1:50:42', 'Proin risus.', 21, '21');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-15', '19:54:36', 'Donec vitae nisi.', 22, '22');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-31', '17:23:34', 'Nam tristique tortor eu pede.', 23, '23');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-06-11', '11:13:33', 'Curabitur convallis.', 24, '24');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-30', '19:29:23', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 25, '25');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-05', '19:46:53', 'Vivamus vel nulla eget eros elementum pellentesque.', 26, '26');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-02-14', '17:43:16', 'Aliquam quis turpis eget elit sodales scelerisque.', 27, '27');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2022-12-10', '22:37:25', 'Duis aliquam convallis nunc.', 28, '28');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-21', '14:00:26', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 29, '29');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-09-16', '3:38:39', 'Curabitur in libero ut massa volutpat convallis.', 30, '30');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-05-24', '0:13:52', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 31, '31');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-07-09', '17:12:20', 'In hac habitasse platea dictumst.', 32, '32');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-19', '0:58:01', 'In eleifend quam a odio.', 33, '33');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-06-20', '15:24:56', 'Aenean auctor gravida sem.', 34, '34');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-17', '6:31:10', 'Duis aliquam convallis nunc.', 35, '35');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-04', '1:30:08', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 36, '36');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-14', '13:13:00', 'In hac habitasse platea dictumst.', 37, '37');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-02-22', '12:42:07', 'Nullam varius.', 38, '38');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-13', '18:33:32', 'Nulla justo.', 39, '39');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-15', '8:40:34', 'Proin at turpis a pede posuere nonummy.', 40, '40');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-11-14', '20:28:35', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 41, '41');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-02-06', '8:25:20', 'Morbi porttitor lorem id ligula.', 42, '42');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-30', '11:21:21', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 43, '43');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-07-20', '4:41:57', 'Nulla ut erat id mauris vulputate elementum.', 44, '44');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-27', '21:24:42', 'Etiam pretium iaculis justo.', 45, '45');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-10-05', '13:50:13', 'Integer non velit.', 46, '46');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-09-02', '11:44:54', 'Cras non velit nec nisi vulputate nonummy.', 47, '47');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-04-07', '9:03:58', 'Duis mattis egestas metus.', 48, '48');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-11-19', '4:31:27', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 49, '49');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-23', '19:43:28', 'Morbi non quam nec dui luctus rutrum.', 50, '50');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-30', '14:13:31', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 51, '51');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-09-28', '4:49:55', 'Nulla nisl.', 52, '52');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-11-15', '12:09:21', 'Duis consequat dui nec nisi volutpat eleifend.', 53, '53');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-11-10', '22:09:08', 'Integer non velit.', 54, '54');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-01-27', '7:42:46', 'Curabitur in libero ut massa volutpat convallis.', 55, '55');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-25', '10:38:16', 'Etiam justo.', 56, '56');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-07-04', '10:51:55', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 57, '57');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-10-13', '3:05:03', 'Donec semper sapien a libero.', 58, '58');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-08-21', '12:53:52', 'Maecenas ut massa quis augue luctus tincidunt.', 59, '59');
insert into feedback (date, time, comment, feedbackId, meetingId) values ('2023-03-18', '23:51:31', 'Morbi ut odio.', 60, '60');

# task
insert into task (taskId, description, dueDate, status, employeeId) values (1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2023-02-03', 1, '39');
insert into task (taskId, description, dueDate, status, employeeId) values (2, 'Nunc purus.', '2023-06-26', 0, '31');
insert into task (taskId, description, dueDate, status, employeeId) values (3, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2023-07-25', 0, '51');
insert into task (taskId, description, dueDate, status, employeeId) values (4, 'Vestibulum ac est lacinia nisi venenatis tristique.', '2023-03-09', 1, '13');
insert into task (taskId, description, dueDate, status, employeeId) values (5, 'Ut tellus.', '2023-09-01', 0, '52');
insert into task (taskId, description, dueDate, status, employeeId) values (6, 'Vestibulum sed magna at nunc commodo placerat.', '2023-11-15', 0, '46');
insert into task (taskId, description, dueDate, status, employeeId) values (7, 'Mauris lacinia sapien quis libero.', '2023-01-02', 1, '16');
insert into task (taskId, description, dueDate, status, employeeId) values (8, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2023-10-10', 0, '45');
insert into task (taskId, description, dueDate, status, employeeId) values (9, 'Suspendisse potenti.', '2023-06-15', 0, '60');
insert into task (taskId, description, dueDate, status, employeeId) values (10, 'Donec ut dolor.', '2023-04-26', 1, '20');
insert into task (taskId, description, dueDate, status, employeeId) values (11, 'Phasellus in felis.', '2023-01-29', 0, '18');
insert into task (taskId, description, dueDate, status, employeeId) values (12, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2023-03-21', 0, '9');
insert into task (taskId, description, dueDate, status, employeeId) values (13, 'Maecenas pulvinar lobortis est.', '2023-11-18', 0, '54');
insert into task (taskId, description, dueDate, status, employeeId) values (14, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '2023-08-22', 0, '53');
insert into task (taskId, description, dueDate, status, employeeId) values (15, 'In congue.', '2023-08-19', 0, '17');
insert into task (taskId, description, dueDate, status, employeeId) values (16, 'Morbi non lectus.', '2023-09-05', 0, '27');
insert into task (taskId, description, dueDate, status, employeeId) values (17, 'In eleifend quam a odio.', '2023-02-04', 0, '35');
insert into task (taskId, description, dueDate, status, employeeId) values (18, 'Mauris ullamcorper purus sit amet nulla.', '2023-07-20', 1, '23');
insert into task (taskId, description, dueDate, status, employeeId) values (19, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2023-08-05', 0, '4');
insert into task (taskId, description, dueDate, status, employeeId) values (20, 'Nulla mollis molestie lorem.', '2023-03-26', 0, '30');
insert into task (taskId, description, dueDate, status, employeeId) values (21, 'Curabitur in libero ut massa volutpat convallis.', '2023-08-06', 1, '14');
insert into task (taskId, description, dueDate, status, employeeId) values (22, 'Integer ac leo.', '2023-05-31', 0, '8');
insert into task (taskId, description, dueDate, status, employeeId) values (23, 'Praesent blandit.', '2023-01-12', 1, '44');
insert into task (taskId, description, dueDate, status, employeeId) values (24, 'Morbi a ipsum.', '2023-04-05', 0, '55');
insert into task (taskId, description, dueDate, status, employeeId) values (25, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2023-02-26', 0, '48');
insert into task (taskId, description, dueDate, status, employeeId) values (26, 'Praesent id massa id nisl venenatis lacinia.', '2023-08-27', 0, '41');
insert into task (taskId, description, dueDate, status, employeeId) values (27, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2023-09-16', 0, '40');
insert into task (taskId, description, dueDate, status, employeeId) values (28, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '2023-11-03', 1, '33');
insert into task (taskId, description, dueDate, status, employeeId) values (29, 'Pellentesque at nulla.', '2023-08-20', 0, '1');
insert into task (taskId, description, dueDate, status, employeeId) values (30, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2023-10-26', 0, '22');
insert into task (taskId, description, dueDate, status, employeeId) values (31, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2023-07-23', 0, '21');
insert into task (taskId, description, dueDate, status, employeeId) values (32, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2023-03-17', 0, '29');
insert into task (taskId, description, dueDate, status, employeeId) values (33, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2023-06-29', 1, '58');
insert into task (taskId, description, dueDate, status, employeeId) values (34, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2023-07-27', 1, '38');
insert into task (taskId, description, dueDate, status, employeeId) values (35, 'Curabitur at ipsum ac tellus semper interdum.', '2023-01-19', 0, '3');
insert into task (taskId, description, dueDate, status, employeeId) values (36, 'Nulla tempus.', '2023-08-08', 0, '57');
insert into task (taskId, description, dueDate, status, employeeId) values (37, 'Pellentesque ultrices mattis odio.', '2023-03-30', 0, '24');
insert into task (taskId, description, dueDate, status, employeeId) values (38, 'Morbi vel lectus in quam fringilla rhoncus.', '2023-11-15', 0, '42');
insert into task (taskId, description, dueDate, status, employeeId) values (39, 'Integer ac leo.', '2023-07-24', 1, '34');
insert into task (taskId, description, dueDate, status, employeeId) values (40, 'Etiam faucibus cursus urna.', '2023-09-30', 1, '12');
insert into task (taskId, description, dueDate, status, employeeId) values (41, 'Morbi non lectus.', '2023-03-09', 0, '47');
insert into task (taskId, description, dueDate, status, employeeId) values (42, 'Morbi non quam nec dui luctus rutrum.', '2023-09-26', 0, '26');
insert into task (taskId, description, dueDate, status, employeeId) values (43, 'Praesent id massa id nisl venenatis lacinia.', '2023-09-17', 0, '36');
insert into task (taskId, description, dueDate, status, employeeId) values (44, 'Curabitur in libero ut massa volutpat convallis.', '2023-08-03', 1, '28');
insert into task (taskId, description, dueDate, status, employeeId) values (45, 'Praesent id massa id nisl venenatis lacinia.', '2023-05-17', 1, '15');
insert into task (taskId, description, dueDate, status, employeeId) values (46, 'Praesent lectus.', '2023-04-25', 0, '19');
insert into task (taskId, description, dueDate, status, employeeId) values (47, 'Etiam faucibus cursus urna.', '2023-10-28', 1, '50');
insert into task (taskId, description, dueDate, status, employeeId) values (48, 'Phasellus sit amet erat.', '2023-07-08', 0, '2');
insert into task (taskId, description, dueDate, status, employeeId) values (49, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2023-10-16', 1, '59');
insert into task (taskId, description, dueDate, status, employeeId) values (50, 'Duis at velit eu est congue elementum.', '2023-08-19', 1, '49');
insert into task (taskId, description, dueDate, status, employeeId) values (51, 'Suspendisse accumsan tortor quis turpis.', '2023-08-24', 0, '6');
insert into task (taskId, description, dueDate, status, employeeId) values (52, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2023-10-08', 1, '56');
insert into task (taskId, description, dueDate, status, employeeId) values (53, 'Quisque porta volutpat erat.', '2023-06-06', 0, '5');
insert into task (taskId, description, dueDate, status, employeeId) values (54, 'Proin risus.', '2023-04-08', 1, '11');
insert into task (taskId, description, dueDate, status, employeeId) values (55, 'Etiam faucibus cursus urna.', '2023-11-28', 1, '37');
insert into task (taskId, description, dueDate, status, employeeId) values (56, 'Nunc rhoncus dui vel sem.', '2023-02-10', 1, '10');
insert into task (taskId, description, dueDate, status, employeeId) values (57, 'Vivamus vel nulla eget eros elementum pellentesque.', '2023-02-21', 1, '43');
insert into task (taskId, description, dueDate, status, employeeId) values (58, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2023-10-18', 0, '7');
insert into task (taskId, description, dueDate, status, employeeId) values (59, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2023-09-11', 0, '25');
insert into task (taskId, description, dueDate, status, employeeId) values (60, 'Nunc nisl.', '2023-10-13', 0, '32');

# timeLog
insert into timeLog (logId, date, hours, tasksCompleted) values (1, '2023-04-20', 2, 6);
insert into timeLog (logId, date, hours, tasksCompleted) values (2, '2023-04-09', 9, 3);
insert into timeLog (logId, date, hours, tasksCompleted) values (3, '2023-09-15', 4, 0);
insert into timeLog (logId, date, hours, tasksCompleted) values (4, '2023-01-31', 7, 5);
insert into timeLog (logId, date, hours, tasksCompleted) values (5, '2023-10-12', 6, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (6, '2023-10-30', 4, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (7, '2023-07-22', 9, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (8, '2023-05-20', 9, 3);
insert into timeLog (logId, date, hours, tasksCompleted) values (9, '2023-10-19', 0, 6);
insert into timeLog (logId, date, hours, tasksCompleted) values (10, '2023-06-24', 12, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (11, '2023-09-03', 8, 10);
insert into timeLog (logId, date, hours, tasksCompleted) values (12, '2023-11-08', 11, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (13, '2023-03-19', 6, 6);
insert into timeLog (logId, date, hours, tasksCompleted) values (14, '2023-11-03', 1, 1);
insert into timeLog (logId, date, hours, tasksCompleted) values (15, '2023-08-02', 12, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (16, '2023-05-26', 0, 0);
insert into timeLog (logId, date, hours, tasksCompleted) values (17, '2023-07-01', 0, 5);
insert into timeLog (logId, date, hours, tasksCompleted) values (18, '2023-11-17', 0, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (19, '2023-10-07', 8, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (20, '2023-02-14', 8, 8);
insert into timeLog (logId, date, hours, tasksCompleted) values (21, '2023-10-10', 11, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (22, '2023-06-14', 12, 3);
insert into timeLog (logId, date, hours, tasksCompleted) values (23, '2023-11-03', 4, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (24, '2023-01-13', 2, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (25, '2023-02-13', 8, 8);
insert into timeLog (logId, date, hours, tasksCompleted) values (26, '2023-10-17', 3, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (27, '2023-11-27', 6, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (28, '2023-06-16', 10, 0);
insert into timeLog (logId, date, hours, tasksCompleted) values (29, '2023-09-08', 6, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (30, '2023-04-27', 8, 5);
insert into timeLog (logId, date, hours, tasksCompleted) values (31, '2023-04-25', 11, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (32, '2023-01-23', 3, 10);
insert into timeLog (logId, date, hours, tasksCompleted) values (33, '2023-06-11', 4, 8);
insert into timeLog (logId, date, hours, tasksCompleted) values (34, '2023-09-11', 9, 5);
insert into timeLog (logId, date, hours, tasksCompleted) values (35, '2023-03-27', 5, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (36, '2023-06-04', 10, 3);
insert into timeLog (logId, date, hours, tasksCompleted) values (37, '2023-07-11', 8, 6);
insert into timeLog (logId, date, hours, tasksCompleted) values (38, '2023-01-12', 1, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (39, '2023-05-28', 4, 8);
insert into timeLog (logId, date, hours, tasksCompleted) values (40, '2023-10-07', 10, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (41, '2023-08-12', 0, 1);
insert into timeLog (logId, date, hours, tasksCompleted) values (42, '2023-01-27', 3, 6);
insert into timeLog (logId, date, hours, tasksCompleted) values (43, '2023-06-10', 2, 4);
insert into timeLog (logId, date, hours, tasksCompleted) values (44, '2023-04-14', 1, 10);
insert into timeLog (logId, date, hours, tasksCompleted) values (45, '2023-05-06', 6, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (46, '2023-01-29', 10, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (47, '2023-02-17', 7, 7);
insert into timeLog (logId, date, hours, tasksCompleted) values (48, '2023-04-29', 9, 5);
insert into timeLog (logId, date, hours, tasksCompleted) values (49, '2023-09-13', 6, 6);
insert into timeLog (logId, date, hours, tasksCompleted) values (50, '2023-04-02', 0, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (51, '2023-10-02', 2, 4);
insert into timeLog (logId, date, hours, tasksCompleted) values (52, '2023-11-07', 8, 8);
insert into timeLog (logId, date, hours, tasksCompleted) values (53, '2023-05-07', 7, 3);
insert into timeLog (logId, date, hours, tasksCompleted) values (54, '2023-11-04', 2, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (55, '2023-09-02', 1, 1);
insert into timeLog (logId, date, hours, tasksCompleted) values (56, '2023-02-07', 1, 0);
insert into timeLog (logId, date, hours, tasksCompleted) values (57, '2023-10-01', 12, 2);
insert into timeLog (logId, date, hours, tasksCompleted) values (58, '2023-06-12', 12, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (59, '2023-02-12', 11, 9);
insert into timeLog (logId, date, hours, tasksCompleted) values (60, '2023-01-24', 8, 0);

# employeeTimeLog
insert into employeeTimeLog (employeeId, logId) values ('47', '1');
insert into employeeTimeLog (employeeId, logId) values ('54', '44');
insert into employeeTimeLog (employeeId, logId) values ('17', '6');
insert into employeeTimeLog (employeeId, logId) values ('32', '17');
insert into employeeTimeLog (employeeId, logId) values ('51', '57');
insert into employeeTimeLog (employeeId, logId) values ('20', '18');
insert into employeeTimeLog (employeeId, logId) values ('15', '9');
insert into employeeTimeLog (employeeId, logId) values ('57', '58');
insert into employeeTimeLog (employeeId, logId) values ('5', '27');
insert into employeeTimeLog (employeeId, logId) values ('1', '37');
insert into employeeTimeLog (employeeId, logId) values ('36', '21');
insert into employeeTimeLog (employeeId, logId) values ('9', '50');
insert into employeeTimeLog (employeeId, logId) values ('45', '47');
insert into employeeTimeLog (employeeId, logId) values ('37', '48');
insert into employeeTimeLog (employeeId, logId) values ('44', '42');
insert into employeeTimeLog (employeeId, logId) values ('49', '7');
insert into employeeTimeLog (employeeId, logId) values ('10', '2');
insert into employeeTimeLog (employeeId, logId) values ('46', '46');
insert into employeeTimeLog (employeeId, logId) values ('14', '13');
insert into employeeTimeLog (employeeId, logId) values ('33', '32');
insert into employeeTimeLog (employeeId, logId) values ('48', '49');
insert into employeeTimeLog (employeeId, logId) values ('13', '16');
insert into employeeTimeLog (employeeId, logId) values ('8', '55');
insert into employeeTimeLog (employeeId, logId) values ('56', '36');
insert into employeeTimeLog (employeeId, logId) values ('12', '43');
insert into employeeTimeLog (employeeId, logId) values ('29', '15');
insert into employeeTimeLog (employeeId, logId) values ('53', '38');
insert into employeeTimeLog (employeeId, logId) values ('22', '30');
insert into employeeTimeLog (employeeId, logId) values ('43', '41');
insert into employeeTimeLog (employeeId, logId) values ('52', '28');
insert into employeeTimeLog (employeeId, logId) values ('21', '3');
insert into employeeTimeLog (employeeId, logId) values ('19', '24');
insert into employeeTimeLog (employeeId, logId) values ('58', '54');
insert into employeeTimeLog (employeeId, logId) values ('41', '4');
insert into employeeTimeLog (employeeId, logId) values ('34', '34');
insert into employeeTimeLog (employeeId, logId) values ('27', '10');
insert into employeeTimeLog (employeeId, logId) values ('23', '45');
insert into employeeTimeLog (employeeId, logId) values ('16', '22');
insert into employeeTimeLog (employeeId, logId) values ('59', '19');
insert into employeeTimeLog (employeeId, logId) values ('31', '25');
insert into employeeTimeLog (employeeId, logId) values ('4', '52');
insert into employeeTimeLog (employeeId, logId) values ('6', '51');
insert into employeeTimeLog (employeeId, logId) values ('40', '29');
insert into employeeTimeLog (employeeId, logId) values ('18', '53');
insert into employeeTimeLog (employeeId, logId) values ('3', '60');
insert into employeeTimeLog (employeeId, logId) values ('35', '35');
insert into employeeTimeLog (employeeId, logId) values ('50', '14');
insert into employeeTimeLog (employeeId, logId) values ('28', '8');
insert into employeeTimeLog (employeeId, logId) values ('42', '23');
insert into employeeTimeLog (employeeId, logId) values ('55', '31');
insert into employeeTimeLog (employeeId, logId) values ('11', '20');
insert into employeeTimeLog (employeeId, logId) values ('39', '56');
insert into employeeTimeLog (employeeId, logId) values ('2', '39');
insert into employeeTimeLog (employeeId, logId) values ('24', '40');
insert into employeeTimeLog (employeeId, logId) values ('25', '59');
insert into employeeTimeLog (employeeId, logId) values ('7', '26');
insert into employeeTimeLog (employeeId, logId) values ('26', '11');
insert into employeeTimeLog (employeeId, logId) values ('38', '12');
insert into employeeTimeLog (employeeId, logId) values ('30', '5');
insert into employeeTimeLog (employeeId, logId) values ('60', '33');

# professor
insert into professor (profId, firstName, lastName, department) values (1, 'Everard', 'Rodolphe', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (2, 'Idalina', 'Dolden', 'Training');
insert into professor (profId, firstName, lastName, department) values (3, 'Cecilius', 'Finley', 'Support');
insert into professor (profId, firstName, lastName, department) values (4, 'Thedrick', 'Greasty', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (5, 'Bobette', 'Choffin', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (6, 'Eldon', 'MacKegg', 'Product Management');
insert into professor (profId, firstName, lastName, department) values (7, 'Catina', 'Baldcock', 'Legal');
insert into professor (profId, firstName, lastName, department) values (8, 'Edgardo', 'Heape', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (9, 'Gabriel', 'O'' Dooley', 'Accounting');
insert into professor (profId, firstName, lastName, department) values (10, 'Daniel', 'Theuff', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (11, 'Linette', 'Ziemens', 'Engineering');
insert into professor (profId, firstName, lastName, department) values (12, 'Dennie', 'Bretton', 'Legal');
insert into professor (profId, firstName, lastName, department) values (13, 'Aldwin', 'Cush', 'Services');
insert into professor (profId, firstName, lastName, department) values (14, 'Camila', 'Everist', 'Accounting');
insert into professor (profId, firstName, lastName, department) values (15, 'Ola', 'Vedishchev', 'Research and Development');
insert into professor (profId, firstName, lastName, department) values (16, 'Giraud', 'Zielinski', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (17, 'Amby', 'MacCaffrey', 'Training');
insert into professor (profId, firstName, lastName, department) values (18, 'Minny', 'Vango', 'Legal');
insert into professor (profId, firstName, lastName, department) values (19, 'Mozelle', 'Jeanes', 'Services');
insert into professor (profId, firstName, lastName, department) values (20, 'Hamnet', 'Cyphus', 'Research and Development');
insert into professor (profId, firstName, lastName, department) values (21, 'Sunshine', 'McMarquis', 'Research and Development');
insert into professor (profId, firstName, lastName, department) values (22, 'Bogey', 'Dudley', 'Legal');
insert into professor (profId, firstName, lastName, department) values (23, 'Christina', 'Galsworthy', 'Training');
insert into professor (profId, firstName, lastName, department) values (24, 'Selig', 'Sarjent', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (25, 'Rolfe', 'Seville', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (26, 'Lorita', 'Shatliffe', 'Product Management');
insert into professor (profId, firstName, lastName, department) values (27, 'Jazmin', 'Eilhart', 'Accounting');
insert into professor (profId, firstName, lastName, department) values (28, 'Ailey', 'Gossington', 'Business Development');
insert into professor (profId, firstName, lastName, department) values (29, 'Alfredo', 'Mitford', 'Services');
insert into professor (profId, firstName, lastName, department) values (30, 'Junia', 'De Malchar', 'Sales');
insert into professor (profId, firstName, lastName, department) values (31, 'Diandra', 'Buglass', 'Services');
insert into professor (profId, firstName, lastName, department) values (32, 'Marris', 'Middle', 'Accounting');
insert into professor (profId, firstName, lastName, department) values (33, 'Celinda', 'Marcos', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (34, 'Johannes', 'Crawshaw', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (35, 'Titus', 'Yemm', 'Support');
insert into professor (profId, firstName, lastName, department) values (36, 'Keelia', 'Brymham', 'Research and Development');
insert into professor (profId, firstName, lastName, department) values (37, 'Katuscha', 'MacFadden', 'Product Management');
insert into professor (profId, firstName, lastName, department) values (38, 'Dolores', 'Thursby', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (39, 'Rivy', 'Hanburry', 'Business Development');
insert into professor (profId, firstName, lastName, department) values (40, 'Marrissa', 'Fatkin', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (41, 'Chandler', 'Blune', 'Sales');
insert into professor (profId, firstName, lastName, department) values (42, 'Goober', 'Cronkshaw', 'Accounting');
insert into professor (profId, firstName, lastName, department) values (43, 'Shelly', 'Aronovich', 'Engineering');
insert into professor (profId, firstName, lastName, department) values (44, 'Caresse', 'Boulds', 'Research and Development');
insert into professor (profId, firstName, lastName, department) values (45, 'Orella', 'Wickman', 'Legal');
insert into professor (profId, firstName, lastName, department) values (46, 'Garv', 'Dominy', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (47, 'Mildrid', 'Tewes', 'Sales');
insert into professor (profId, firstName, lastName, department) values (48, 'Laughton', 'Sargeaunt', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (49, 'Christye', 'Darwood', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (50, 'Jermaine', 'Brinsden', 'Support');
insert into professor (profId, firstName, lastName, department) values (51, 'Eada', 'Botte', 'Human Resources');
insert into professor (profId, firstName, lastName, department) values (52, 'Derek', 'Betancourt', 'Training');
insert into professor (profId, firstName, lastName, department) values (53, 'Micky', 'Mcmanaman', 'Services');
insert into professor (profId, firstName, lastName, department) values (54, 'Cazzie', 'Purtell', 'Business Development');
insert into professor (profId, firstName, lastName, department) values (55, 'Lief', 'Scrancher', 'Accounting');
insert into professor (profId, firstName, lastName, department) values (56, 'Stearn', 'Lamberts', 'Support');
insert into professor (profId, firstName, lastName, department) values (57, 'Caspar', 'Bage', 'Sales');
insert into professor (profId, firstName, lastName, department) values (58, 'Ethelred', 'Denacamp', 'Marketing');
insert into professor (profId, firstName, lastName, department) values (59, 'Gipsy', 'Berens', 'Services');
insert into professor (profId, firstName, lastName, department) values (60, 'Ira', 'Joul', 'Services');

# course
insert into course (courseId, section, courseName, profId) values (1, 1, 'Support', '6');
insert into course (courseId, section, courseName, profId) values (2, 2, 'Accounting', '40');
insert into course (courseId, section, courseName, profId) values (3, 3, 'Sales', '50');
insert into course (courseId, section, courseName, profId) values (4, 4, 'Product Management', '29');
insert into course (courseId, section, courseName, profId) values (5, 5, 'Marketing', '24');
insert into course (courseId, section, courseName, profId) values (6, 6, 'Training', '60');
insert into course (courseId, section, courseName, profId) values (7, 7, 'Training', '28');
insert into course (courseId, section, courseName, profId) values (8, 8, 'Sales', '46');
insert into course (courseId, section, courseName, profId) values (9, 9, 'Support', '55');
insert into course (courseId, section, courseName, profId) values (10, 10, 'Sales', '19');
insert into course (courseId, section, courseName, profId) values (11, 11, 'Support', '22');
insert into course (courseId, section, courseName, profId) values (12, 12, 'Marketing', '7');
insert into course (courseId, section, courseName, profId) values (13, 13, 'Product Management', '39');
insert into course (courseId, section, courseName, profId) values (14, 14, 'Research and Development', '57');
insert into course (courseId, section, courseName, profId) values (15, 15, 'Support', '10');
insert into course (courseId, section, courseName, profId) values (16, 16, 'Support', '44');
insert into course (courseId, section, courseName, profId) values (17, 17, 'Engineering', '35');
insert into course (courseId, section, courseName, profId) values (18, 18, 'Sales', '45');
insert into course (courseId, section, courseName, profId) values (19, 19, 'Sales', '4');
insert into course (courseId, section, courseName, profId) values (20, 20, 'Services', '9');
insert into course (courseId, section, courseName, profId) values (21, 21, 'Sales', '21');
insert into course (courseId, section, courseName, profId) values (22, 22, 'Legal', '5');
insert into course (courseId, section, courseName, profId) values (23, 23, 'Product Management', '11');
insert into course (courseId, section, courseName, profId) values (24, 24, 'Training', '37');
insert into course (courseId, section, courseName, profId) values (25, 25, 'Research and Development', '52');
insert into course (courseId, section, courseName, profId) values (26, 26, 'Sales', '14');
insert into course (courseId, section, courseName, profId) values (27, 27, 'Support', '47');
insert into course (courseId, section, courseName, profId) values (28, 28, 'Engineering', '15');
insert into course (courseId, section, courseName, profId) values (29, 29, 'Business Development', '36');
insert into course (courseId, section, courseName, profId) values (30, 30, 'Sales', '23');
insert into course (courseId, section, courseName, profId) values (31, 31, 'Sales', '3');
insert into course (courseId, section, courseName, profId) values (32, 32, 'Sales', '27');
insert into course (courseId, section, courseName, profId) values (33, 33, 'Business Development', '58');
insert into course (courseId, section, courseName, profId) values (34, 34, 'Engineering', '16');
insert into course (courseId, section, courseName, profId) values (35, 35, 'Training', '34');
insert into course (courseId, section, courseName, profId) values (36, 36, 'Training', '51');
insert into course (courseId, section, courseName, profId) values (37, 37, 'Human Resources', '13');
insert into course (courseId, section, courseName, profId) values (38, 38, 'Engineering', '8');
insert into course (courseId, section, courseName, profId) values (39, 39, 'Services', '56');
insert into course (courseId, section, courseName, profId) values (40, 40, 'Research and Development', '20');
insert into course (courseId, section, courseName, profId) values (41, 41, 'Sales', '54');
insert into course (courseId, section, courseName, profId) values (42, 42, 'Accounting', '48');
insert into course (courseId, section, courseName, profId) values (43, 43, 'Product Management', '17');
insert into course (courseId, section, courseName, profId) values (44, 44, 'Marketing', '30');
insert into course (courseId, section, courseName, profId) values (45, 45, 'Accounting', '31');
insert into course (courseId, section, courseName, profId) values (46, 46, 'Research and Development', '38');
insert into course (courseId, section, courseName, profId) values (47, 47, 'Legal', '43');
insert into course (courseId, section, courseName, profId) values (48, 48, 'Business Development', '41');
insert into course (courseId, section, courseName, profId) values (49, 49, 'Sales', '2');
insert into course (courseId, section, courseName, profId) values (50, 50, 'Product Management', '33');
insert into course (courseId, section, courseName, profId) values (51, 51, 'Marketing', '59');
insert into course (courseId, section, courseName, profId) values (52, 52, 'Human Resources', '18');
insert into course (courseId, section, courseName, profId) values (53, 53, 'Marketing', '49');
insert into course (courseId, section, courseName, profId) values (54, 54, 'Accounting', '32');
insert into course (courseId, section, courseName, profId) values (55, 55, 'Services', '25');
insert into course (courseId, section, courseName, profId) values (56, 56, 'Services', '42');
insert into course (courseId, section, courseName, profId) values (57, 57, 'Legal', '12');
insert into course (courseId, section, courseName, profId) values (58, 58, 'Business Development', '53');
insert into course (courseId, section, courseName, profId) values (59, 59, 'Business Development', '26');
insert into course (courseId, section, courseName, profId) values (60, 60, 'Training', '1');

# project
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (1, 0, 'Nulla tellus.', 'Support', 'Maecenas rhoncus aliquam lacus.', 'Bamity', '2023-01-22', '51');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (2, 0, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Human Resources', 'Pellentesque ultrices mattis odio.', 'Stringtough', '2023-11-08', '34');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (3, 0, 'In quis justo.', 'Research and Development', 'Morbi ut odio.', 'Voltsillam', '2023-02-22', '49');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (4, 1, 'Nullam varius.', 'Legal', 'Morbi non lectus.', 'Temp', '2023-10-25', '58');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (5, 0, 'Praesent lectus.', 'Business Development', 'Suspendisse potenti.', 'Y-Solowarm', '2023-03-22', '57');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (6, 0, 'Nam tristique tortor eu pede.', 'Research and Development', 'Curabitur convallis.', 'Cookley', '2023-11-27', '48');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (7, 0, 'Morbi non quam nec dui luctus rutrum.', 'Sales', 'Nullam varius.', 'Flexidy', '2023-08-12', '4');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (8, 1, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Accounting', 'Integer ac leo.', 'Solarbreeze', '2023-02-25', '8');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (9, 1, 'Pellentesque ultrices mattis odio.', 'Product Management', 'In congue.', 'Asoka', '2023-08-11', '9');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (10, 0, 'Curabitur convallis.', 'Services', 'Morbi ut odio.', 'Tampflex', '2023-08-27', '14');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (11, 0, 'Integer ac neque.', 'Training', 'Nulla ut erat id mauris vulputate elementum.', 'Bitchip', '2023-07-20', '33');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (12, 1, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Services', 'Maecenas tincidunt lacus at velit.', 'Trippledex', '2023-02-03', '53');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (13, 0, 'Curabitur gravida nisi at nibh.', 'Product Management', 'Vestibulum rutrum rutrum neque.', 'Stronghold', '2022-12-27', '52');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (14, 1, 'Mauris lacinia sapien quis libero.', 'Accounting', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Span', '2023-06-21', '42');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (15, 1, 'Vestibulum ac est lacinia nisi venenatis tristique.', 'Accounting', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 'Biodex', '2023-04-28', '21');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (16, 0, 'Nulla mollis molestie lorem.', 'Product Management', 'Aliquam quis turpis eget elit sodales scelerisque.', 'Zaam-Dox', '2023-07-30', '47');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (17, 0, 'Nam tristique tortor eu pede.', 'Research and Development', 'Phasellus id sapien in sapien iaculis congue.', 'Quo Lux', '2023-03-01', '5');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (18, 0, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Sales', 'Nullam varius.', 'Voyatouch', '2023-02-20', '44');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (19, 1, 'Nunc rhoncus dui vel sem.', 'Accounting', 'Sed accumsan felis.', 'Alphazap', '2023-03-25', '32');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (20, 1, 'Sed ante.', 'Marketing', 'Pellentesque viverra pede ac diam.', 'Otcom', '2023-09-30', '15');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (21, 0, 'Aenean sit amet justo.', 'Research and Development', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'Prodder', '2023-03-25', '11');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (22, 1, 'Maecenas rhoncus aliquam lacus.', 'Legal', 'Suspendisse potenti.', 'Voltsillam', '2023-03-15', '45');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (23, 0, 'Aliquam non mauris.', 'Sales', 'Nam tristique tortor eu pede.', 'Flexidy', '2023-04-12', '43');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (24, 1, 'Nulla tempus.', 'Product Management', 'Aliquam erat volutpat.', 'Rank', '2023-03-23', '36');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (25, 1, 'Sed ante.', 'Business Development', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Flexidy', '2023-08-04', '10');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (26, 1, 'Duis consequat dui nec nisi volutpat eleifend.', 'Business Development', 'Aenean lectus.', 'Tresom', '2023-04-26', '37');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (27, 0, 'Curabitur gravida nisi at nibh.', 'Product Management', 'Etiam justo.', 'Sonair', '2022-12-14', '31');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (28, 1, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Engineering', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Y-Solowarm', '2023-10-27', '26');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (29, 0, 'Quisque porta volutpat erat.', 'Marketing', 'Praesent blandit lacinia erat.', 'Flowdesk', '2023-10-21', '30');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (30, 1, 'Donec ut mauris eget massa tempor convallis.', 'Business Development', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'Andalax', '2023-07-16', '25');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (31, 1, 'Morbi quis tortor id nulla ultrices aliquet.', 'Support', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Zoolab', '2023-10-10', '50');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (32, 0, 'Aenean sit amet justo.', 'Sales', 'Praesent blandit lacinia erat.', 'Tampflex', '2022-12-18', '35');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (33, 1, 'Donec dapibus.', 'Engineering', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Viva', '2023-11-12', '29');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (34, 1, 'Donec posuere metus vitae ipsum.', 'Engineering', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Keylex', '2023-07-27', '1');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (35, 1, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'Legal', 'Maecenas ut massa quis augue luctus tincidunt.', 'Voyatouch', '2023-08-29', '17');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (36, 0, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Research and Development', 'Pellentesque at nulla.', 'Sonair', '2023-05-05', '56');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (37, 0, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 'Sales', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'Cardify', '2023-11-16', '55');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (38, 1, 'Morbi non quam nec dui luctus rutrum.', 'Services', 'Quisque ut erat.', 'Andalax', '2023-05-19', '2');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (39, 0, 'In congue.', 'Human Resources', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'Veribet', '2023-07-16', '3');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (40, 0, 'Aliquam quis turpis eget elit sodales scelerisque.', 'Support', 'Curabitur in libero ut massa volutpat convallis.', 'Domainer', '2023-04-12', '28');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (41, 1, 'Duis aliquam convallis nunc.', 'Support', 'Suspendisse potenti.', 'Sonsing', '2023-02-21', '59');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (42, 1, 'In hac habitasse platea dictumst.', 'Support', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Tin', '2023-04-16', '22');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (43, 1, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'Sales', 'Praesent blandit.', 'Greenlam', '2023-06-27', '13');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (44, 0, 'Suspendisse potenti.', 'Research and Development', 'In blandit ultrices enim.', 'Veribet', '2023-07-15', '23');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (45, 0, 'Duis aliquam convallis nunc.', 'Sales', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Latlux', '2023-02-09', '38');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (46, 1, 'Sed sagittis.', 'Services', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'Solarbreeze', '2023-07-05', '40');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (47, 0, 'In blandit ultrices enim.', 'Human Resources', 'Nunc rhoncus dui vel sem.', 'Ronstring', '2023-03-09', '6');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (48, 0, 'Vivamus vel nulla eget eros elementum pellentesque.', 'Product Management', 'Proin risus.', 'Namfix', '2023-11-03', '12');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (49, 1, 'Vestibulum sed magna at nunc commodo placerat.', 'Legal', 'Curabitur convallis.', 'Prodder', '2023-08-12', '41');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (50, 1, 'Suspendisse accumsan tortor quis turpis.', 'Business Development', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Bigtax', '2023-02-01', '20');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (51, 0, 'Morbi non lectus.', 'Training', 'Integer tincidunt ante vel ipsum.', 'Sonsing', '2023-06-06', '54');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (52, 1, 'Donec ut dolor.', 'Services', 'Vivamus in felis eu sapien cursus vestibulum.', 'Rank', '2023-07-23', '18');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (53, 0, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 'Engineering', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', 'Cardify', '2022-12-07', '60');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (54, 1, 'Nulla tempus.', 'Accounting', 'In hac habitasse platea dictumst.', 'Opela', '2023-10-05', '24');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (55, 1, 'Maecenas pulvinar lobortis est.', 'Human Resources', 'Nam nulla.', 'Bitchip', '2023-01-01', '27');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (56, 0, 'In hac habitasse platea dictumst.', 'Support', 'Duis mattis egestas metus.', 'Fintone', '2023-01-12', '19');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (57, 1, 'Sed ante.', 'Human Resources', 'Pellentesque ultrices mattis odio.', 'Zoolab', '2023-05-25', '46');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (58, 0, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Sales', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'Konklux', '2023-08-11', '16');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (59, 0, 'Duis consequat dui nec nisi volutpat eleifend.', 'Product Management', 'Proin interdum mauris non ligula pellentesque ultrices.', 'Lotlux', '2023-02-05', '7');
insert into project (projectId, status, timeline, industry, summary, projectName, dueDate, courseId) values (60, 1, 'Nulla tempus.', 'Engineering', 'Quisque id justo sit amet sapien dignissim vestibulum.', 'Opela', '2023-02-16', '39');

# employeeProject
insert into employeeProject (employeeId, projectId) values ('26', 1);
insert into employeeProject (employeeId, projectId) values ('45', 2);
insert into employeeProject (employeeId, projectId) values ('59', 3);
insert into employeeProject (employeeId, projectId) values ('10', 4);
insert into employeeProject (employeeId, projectId) values ('6', 5);
insert into employeeProject (employeeId, projectId) values ('49', 6);
insert into employeeProject (employeeId, projectId) values ('22', 7);
insert into employeeProject (employeeId, projectId) values ('51', 8);
insert into employeeProject (employeeId, projectId) values ('56', 9);
insert into employeeProject (employeeId, projectId) values ('28', 10);
insert into employeeProject (employeeId, projectId) values ('57', 11);
insert into employeeProject (employeeId, projectId) values ('43', 12);
insert into employeeProject (employeeId, projectId) values ('58', 13);
insert into employeeProject (employeeId, projectId) values ('9', 14);
insert into employeeProject (employeeId, projectId) values ('46', 15);
insert into employeeProject (employeeId, projectId) values ('34', 16);
insert into employeeProject (employeeId, projectId) values ('16', 17);
insert into employeeProject (employeeId, projectId) values ('44', 18);
insert into employeeProject (employeeId, projectId) values ('13', 19);
insert into employeeProject (employeeId, projectId) values ('11', 20);
insert into employeeProject (employeeId, projectId) values ('53', 21);
insert into employeeProject (employeeId, projectId) values ('50', 22);
insert into employeeProject (employeeId, projectId) values ('32', 23);
insert into employeeProject (employeeId, projectId) values ('40', 24);
insert into employeeProject (employeeId, projectId) values ('3', 25);
insert into employeeProject (employeeId, projectId) values ('31', 26);
insert into employeeProject (employeeId, projectId) values ('14', 27);
insert into employeeProject (employeeId, projectId) values ('60', 28);
insert into employeeProject (employeeId, projectId) values ('37', 29);
insert into employeeProject (employeeId, projectId) values ('27', 30);
insert into employeeProject (employeeId, projectId) values ('30', 31);
insert into employeeProject (employeeId, projectId) values ('29', 32);
insert into employeeProject (employeeId, projectId) values ('5', 33);
insert into employeeProject (employeeId, projectId) values ('48', 34);
insert into employeeProject (employeeId, projectId) values ('12', 35);
insert into employeeProject (employeeId, projectId) values ('17', 36);
insert into employeeProject (employeeId, projectId) values ('35', 37);
insert into employeeProject (employeeId, projectId) values ('52', 38);
insert into employeeProject (employeeId, projectId) values ('41', 39);
insert into employeeProject (employeeId, projectId) values ('19', 40);
insert into employeeProject (employeeId, projectId) values ('2', 41);
insert into employeeProject (employeeId, projectId) values ('25', 42);
insert into employeeProject (employeeId, projectId) values ('20', 43);
insert into employeeProject (employeeId, projectId) values ('33', 44);
insert into employeeProject (employeeId, projectId) values ('55', 45);
insert into employeeProject (employeeId, projectId) values ('4', 46);
insert into employeeProject (employeeId, projectId) values ('38', 47);
insert into employeeProject (employeeId, projectId) values ('7', 48);
insert into employeeProject (employeeId, projectId) values ('47', 49);
insert into employeeProject (employeeId, projectId) values ('39', 50);
insert into employeeProject (employeeId, projectId) values ('8', 51);
insert into employeeProject (employeeId, projectId) values ('15', 52);
insert into employeeProject (employeeId, projectId) values ('23', 53);
insert into employeeProject (employeeId, projectId) values ('42', 54);
insert into employeeProject (employeeId, projectId) values ('21', 55);
insert into employeeProject (employeeId, projectId) values ('54', 56);
insert into employeeProject (employeeId, projectId) values ('36', 57);
insert into employeeProject (employeeId, projectId) values ('18', 58);
insert into employeeProject (employeeId, projectId) values ('24', 59);
insert into employeeProject (employeeId, projectId) values ('1', 60);
insert into employeeProject (employeeId, projectId) values ('44', 61);
insert into employeeProject (employeeId, projectId) values ('29', 62);
insert into employeeProject (employeeId, projectId) values ('15', 63);
insert into employeeProject (employeeId, projectId) values ('2', 64);
insert into employeeProject (employeeId, projectId) values ('43', 65);
insert into employeeProject (employeeId, projectId) values ('13', 66);
insert into employeeProject (employeeId, projectId) values ('16', 67);
insert into employeeProject (employeeId, projectId) values ('47', 68);
insert into employeeProject (employeeId, projectId) values ('55', 69);
insert into employeeProject (employeeId, projectId) values ('26', 70);
insert into employeeProject (employeeId, projectId) values ('37', 71);
insert into employeeProject (employeeId, projectId) values ('49', 72);
insert into employeeProject (employeeId, projectId) values ('30', 73);
insert into employeeProject (employeeId, projectId) values ('35', 74);
insert into employeeProject (employeeId, projectId) values ('46', 75);
insert into employeeProject (employeeId, projectId) values ('4', 76);
insert into employeeProject (employeeId, projectId) values ('11', 77);
insert into employeeProject (employeeId, projectId) values ('28', 78);
insert into employeeProject (employeeId, projectId) values ('22', 79);
insert into employeeProject (employeeId, projectId) values ('31', 80);

# projectTimeLog
insert into projectTimeLog (projectId, logId) values ('14', '2');
insert into projectTimeLog (projectId, logId) values ('45', '13');
insert into projectTimeLog (projectId, logId) values ('46', '12');
insert into projectTimeLog (projectId, logId) values ('8', '60');
insert into projectTimeLog (projectId, logId) values ('25', '59');
insert into projectTimeLog (projectId, logId) values ('44', '55');
insert into projectTimeLog (projectId, logId) values ('22', '38');
insert into projectTimeLog (projectId, logId) values ('28', '49');
insert into projectTimeLog (projectId, logId) values ('7', '4');
insert into projectTimeLog (projectId, logId) values ('17', '9');
insert into projectTimeLog (projectId, logId) values ('20', '16');
insert into projectTimeLog (projectId, logId) values ('35', '54');
insert into projectTimeLog (projectId, logId) values ('60', '14');
insert into projectTimeLog (projectId, logId) values ('16', '34');
insert into projectTimeLog (projectId, logId) values ('10', '48');
insert into projectTimeLog (projectId, logId) values ('23', '30');
insert into projectTimeLog (projectId, logId) values ('9', '25');
insert into projectTimeLog (projectId, logId) values ('36', '20');
insert into projectTimeLog (projectId, logId) values ('37', '33');
insert into projectTimeLog (projectId, logId) values ('54', '42');
insert into projectTimeLog (projectId, logId) values ('47', '10');
insert into projectTimeLog (projectId, logId) values ('57', '23');
insert into projectTimeLog (projectId, logId) values ('42', '22');
insert into projectTimeLog (projectId, logId) values ('24', '32');
insert into projectTimeLog (projectId, logId) values ('43', '35');
insert into projectTimeLog (projectId, logId) values ('33', '21');
insert into projectTimeLog (projectId, logId) values ('26', '5');
insert into projectTimeLog (projectId, logId) values ('49', '27');
insert into projectTimeLog (projectId, logId) values ('1', '28');
insert into projectTimeLog (projectId, logId) values ('40', '46');
insert into projectTimeLog (projectId, logId) values ('55', '43');
insert into projectTimeLog (projectId, logId) values ('15', '11');
insert into projectTimeLog (projectId, logId) values ('48', '3');
insert into projectTimeLog (projectId, logId) values ('21', '50');
insert into projectTimeLog (projectId, logId) values ('38', '26');
insert into projectTimeLog (projectId, logId) values ('11', '47');
insert into projectTimeLog (projectId, logId) values ('39', '18');
insert into projectTimeLog (projectId, logId) values ('6', '15');
insert into projectTimeLog (projectId, logId) values ('34', '19');
insert into projectTimeLog (projectId, logId) values ('27', '40');
insert into projectTimeLog (projectId, logId) values ('29', '52');
insert into projectTimeLog (projectId, logId) values ('13', '17');
insert into projectTimeLog (projectId, logId) values ('31', '37');
insert into projectTimeLog (projectId, logId) values ('19', '41');
insert into projectTimeLog (projectId, logId) values ('53', '44');
insert into projectTimeLog (projectId, logId) values ('4', '45');
insert into projectTimeLog (projectId, logId) values ('56', '53');
insert into projectTimeLog (projectId, logId) values ('50', '6');
insert into projectTimeLog (projectId, logId) values ('12', '7');
insert into projectTimeLog (projectId, logId) values ('5', '56');
insert into projectTimeLog (projectId, logId) values ('59', '24');
insert into projectTimeLog (projectId, logId) values ('52', '39');
insert into projectTimeLog (projectId, logId) values ('30', '51');
insert into projectTimeLog (projectId, logId) values ('41', '57');
insert into projectTimeLog (projectId, logId) values ('2', '36');
insert into projectTimeLog (projectId, logId) values ('3', '58');
insert into projectTimeLog (projectId, logId) values ('51', '29');
insert into projectTimeLog (projectId, logId) values ('18', '1');
insert into projectTimeLog (projectId, logId) values ('58', '31');
insert into projectTimeLog (projectId, logId) values ('32', '8');
insert into projectTimeLog (projectId, logId) values ('50', '16');
insert into projectTimeLog (projectId, logId) values ('25', '22');
insert into projectTimeLog (projectId, logId) values ('30', '37');
insert into projectTimeLog (projectId, logId) values ('34', '32');
insert into projectTimeLog (projectId, logId) values ('44', '3');
insert into projectTimeLog (projectId, logId) values ('5', '49');
insert into projectTimeLog (projectId, logId) values ('41', '48');
insert into projectTimeLog (projectId, logId) values ('57', '43');
insert into projectTimeLog (projectId, logId) values ('2', '58');
insert into projectTimeLog (projectId, logId) values ('58', '45');
insert into projectTimeLog (projectId, logId) values ('49', '38');
insert into projectTimeLog (projectId, logId) values ('22', '11');
insert into projectTimeLog (projectId, logId) values ('14', '39');
insert into projectTimeLog (projectId, logId) values ('17', '52');
insert into projectTimeLog (projectId, logId) values ('54', '5');
insert into projectTimeLog (projectId, logId) values ('26', '35');
insert into projectTimeLog (projectId, logId) values ('55', '21');
insert into projectTimeLog (projectId, logId) values ('16', '59');
insert into projectTimeLog (projectId, logId) values ('56', '42');
insert into projectTimeLog (projectId, logId) values ('39', '31');

# clientCommunication
insert into clientCommunication (messageId, attachments, client, text, projectId) values (1, 'VestibulumRutrumRutrum.txt', 'Topiczoom', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '55');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (2, 'SodalesSedTincidunt.ppt', 'Zoonoodle', 'Quisque ut erat.', '28');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (3, 'IpsumAliquamNon.tiff', 'Twitterworks', 'Integer non velit.', '18');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (4, 'PosuereMetus.mov', 'Zooxo', 'Maecenas pulvinar lobortis est.', '1');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (5, 'Ac.tiff', 'Blogtags', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '31');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (6, 'DuiNecNisi.mp3', 'Meejo', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '19');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (7, 'PedeMalesuadaIn.avi', 'Thoughtworks', 'Praesent lectus.', '57');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (8, 'Lectus.avi', 'Roombo', 'In blandit ultrices enim.', '5');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (9, 'VelAugue.xls', 'Brainverse', 'Pellentesque viverra pede ac diam.', '11');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (10, 'LoremQuisqueUt.xls', 'Skyvu', 'Maecenas pulvinar lobortis est.', '44');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (11, 'LectusSuspendissePotenti.xls', 'Kwideo', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '41');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (12, 'RhoncusMauris.tiff', 'Latz', 'Ut tellus.', '17');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (13, 'MalesuadaIn.png', 'Yabox', 'Sed sagittis.', '24');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (14, 'Libero.mpeg', 'Meezzy', 'Sed accumsan felis.', '8');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (15, 'Eget.mpeg', 'Devify', 'Mauris lacinia sapien quis libero.', '26');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (16, 'Magna.mp3', 'Pixonyx', 'Aliquam erat volutpat.', '51');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (17, 'QuisOrciNullam.avi', 'InnoZ', 'Donec vitae nisi.', '34');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (18, 'Lacus.mpeg', 'Muxo', 'Nulla ut erat id mauris vulputate elementum.', '3');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (19, 'Massa.jpeg', 'Youopia', 'Vestibulum sed magna at nunc commodo placerat.', '40');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (20, 'Justo.xls', 'Skyble', 'Etiam justo.', '38');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (21, 'SedLacus.ppt', 'Trunyx', 'Aenean fermentum.', '50');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (22, 'MagnaAcConsequat.mp3', 'Oloo', 'Vestibulum rutrum rutrum neque.', '22');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (23, 'Rutrum.avi', 'Rhyloo', 'Nulla suscipit ligula in lacus.', '48');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (24, 'RhoncusSedVestibulum.ppt', 'Zoomdog', 'Phasellus in felis.', '7');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (25, 'Nulla.ppt', 'Quaxo', 'Proin at turpis a pede posuere nonummy.', '43');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (26, 'Congue.ppt', 'Thoughtbridge', 'Maecenas tincidunt lacus at velit.', '33');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (27, 'SedSagittisNam.avi', 'Flashdog', 'Nullam molestie nibh in lectus.', '49');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (28, 'HabitassePlateaDictumst.xls', 'Skimia', 'In blandit ultrices enim.', '53');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (29, 'MaurisLacinia.avi', 'Zoonoodle', 'Maecenas pulvinar lobortis est.', '39');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (30, 'Et.txt', 'Kare', 'Vivamus in felis eu sapien cursus vestibulum.', '45');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (31, 'PraesentId.mpeg', 'Browsezoom', 'Morbi porttitor lorem id ligula.', '12');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (32, 'DuiNec.avi', 'Realmix', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '25');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (33, 'NonPretiumQuis.ppt', 'Buzzster', 'Morbi ut odio.', '13');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (34, 'PedePosuere.avi', 'Livetube', 'Etiam faucibus cursus urna.', '42');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (35, 'NullaSedVel.mov', 'Tagpad', 'In sagittis dui vel nisl.', '23');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (36, 'Pede.xls', 'Realcube', 'Proin eu mi.', '32');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (37, 'AnteIpsumPrimis.mp3', 'Lajo', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '4');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (38, 'NecNisi.xls', 'Avavee', 'Curabitur convallis.', '20');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (39, 'BibendumMorbi.doc', 'Mynte', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '15');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (40, 'MiNulla.png', 'Yombu', 'Sed accumsan felis.', '37');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (41, 'UtAtDolor.ppt', 'Bubbletube', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '47');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (42, 'Eget.xls', 'Buzzster', 'Sed sagittis.', '21');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (43, 'InQuam.tiff', 'Jetpulse', 'Praesent lectus.', '36');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (44, 'A.tiff', 'Gigaclub', 'Nunc nisl.', '52');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (45, 'ElitSodales.xls', 'Yakijo', 'Aliquam quis turpis eget elit sodales scelerisque.', '10');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (46, 'EleifendDonec.ppt', 'Jayo', 'Vivamus vel nulla eget eros elementum pellentesque.', '58');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (47, 'EnimIn.jpeg', 'Bluezoom', 'In hac habitasse platea dictumst.', '29');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (48, 'Magna.doc', 'Centimia', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', '6');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (49, 'AugueVestibulum.tiff', 'Quatz', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '35');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (50, 'Eros.ppt', 'Fadeo', 'Vestibulum ac est lacinia nisi venenatis tristique.', '59');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (51, 'Sagittis.xls', 'Gigabox', 'Morbi vel lectus in quam fringilla rhoncus.', '9');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (52, 'ConsequatInConsequat.ppt', 'Rhyloo', 'Morbi ut odio.', '60');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (53, 'Feugiat.xls', 'Ozu', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (54, 'Purus.tiff', 'Gigazoom', 'Maecenas ut massa quis augue luctus tincidunt.', '16');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (55, 'Phasellus.avi', 'Feedfire', 'Praesent blandit.', '46');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (56, 'Sagittis.avi', 'Skidoo', 'Curabitur convallis.', '30');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (57, 'MontesNasceturRidiculus.ppt', 'Twimm', 'In eleifend quam a odio.', '56');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (58, 'LoremQuisque.pdf', 'Eire', 'In congue.', '27');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (59, 'DiamNam.ppt', 'Eadel', 'Nam dui.', '14');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (60, 'MorbiUtOdio.ppt', 'Tagpad', 'Vestibulum ac est lacinia nisi venenatis tristique.', '54');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (61, 'CrasIn.mpeg', 'Meezzy', 'Nulla facilisi.', '1');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (62, 'IdTurpis.mov', 'Yodoo', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '12');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (63, 'AliquamAugue.ppt', 'Kimia', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '45');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (64, 'EgestasMetusAenean.pdf', 'Gigaclub', 'Curabitur in libero ut massa volutpat convallis.', '3');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (65, 'PurusPhasellus.mpeg', 'Twitterwire', 'Donec ut mauris eget massa tempor convallis.', '42');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (66, 'PretiumIaculis.avi', 'Eimbee', 'Fusce posuere felis sed lacus.', '9');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (67, 'NecNisiVulputate.jpeg', 'Youtags', 'Fusce consequat.', '13');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (68, 'Ac.png', 'Myworks', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '30');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (69, 'HabitassePlatea.avi', 'Dynazzy', 'Morbi non lectus.', '27');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (70, 'Cubilia.avi', 'Kwideo', 'Duis bibendum.', '33');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (71, 'Turpis.pdf', 'Thoughtworks', 'Etiam vel augue.', '24');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (72, 'ConvallisNulla.ppt', 'Kazu', 'Pellentesque ultrices mattis odio.', '17');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (73, 'LacusCurabitur.xls', 'Rhybox', 'In hac habitasse platea dictumst.', '58');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (74, 'Vestibulum.gif', 'Jabbersphere', 'Phasellus id sapien in sapien iaculis congue.', '44');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (75, 'OdioConsequatVarius.ppt', 'Tagchat', 'In congue.', '37');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (76, 'AIpsum.mov', 'Dynazzy', 'Donec vitae nisi.', '43');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (77, 'Consequat.mp3', 'Camimbo', 'Morbi non quam nec dui luctus rutrum.', '5');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (78, 'Nulla.ppt', 'Brainverse', 'Nunc purus.', '50');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (79, 'Tempus.avi', 'Brightdog', 'Sed accumsan felis.', '54');
insert into clientCommunication (messageId, attachments, client, text, projectId) values (80, 'ViverraDiam.mp3', 'Dynava', 'Nulla ut erat id mauris vulputate elementum.', '52');

# groupMembers
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (1, 'Keven', 'Hodcroft', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', '11');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (2, 'Natalee', 'Auston', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '19');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (3, 'Dall', 'Cattermull', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '27');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (4, 'Romola', 'Clingan', 'Aliquam non mauris. Morbi non lectus.', '23');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (5, 'Lon', 'Denial', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '6');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (6, 'Fredra', 'Heenan', 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '4');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (7, 'Ailee', 'Jenkins', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '33');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (8, 'Helaina', 'Edmondson', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', '47');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (9, 'See', 'Methven', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (10, 'Irvin', 'Brinklow', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', '43');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (11, 'Lucina', 'Fretson', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', '25');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (12, 'Ardyce', 'Eplate', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '5');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (13, 'Jorie', 'Hamm', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '40');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (14, 'Maximo', 'Espadate', 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', '31');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (15, 'Ford', 'Farge', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', '10');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (16, 'Nancie', 'Broszkiewicz', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '60');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (17, 'Zonnya', 'Dowsey', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '17');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (18, 'Friedrick', 'Philipeau', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '49');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (19, 'Arlinda', 'Perrington', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '35');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (20, 'Daniela', 'Robeson', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', '8');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (21, 'Emmott', 'Count', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '38');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (22, 'Martina', 'Cianelli', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', '9');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (23, 'Chryste', 'Jickells', 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '34');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (24, 'Berkley', 'Broxholme', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', '52');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (25, 'Marshall', 'Fernan', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '28');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (26, 'Delphinia', 'Eades', 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '16');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (27, 'Betsey', 'Jurisic', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '41');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (28, 'Martyn', 'MacEnelly', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '55');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (29, 'Bibbye', 'Foffano', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', '3');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (30, 'Deni', 'Pepperell', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '29');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (31, 'Carmelia', 'Gaven', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '53');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (32, 'Chrissie', 'Dumbar', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '15');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (33, 'Binni', 'Mitchely', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', '54');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (34, 'Mohammed', 'MacCathay', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '59');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (35, 'Anselma', 'Tindall', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', '57');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (36, 'Dawn', 'Gotecliffe', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', '24');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (37, 'Cole', 'Waterfield', 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '46');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (38, 'Genevieve', 'Cord', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '22');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (39, 'Madelena', 'Silbermann', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '37');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (40, 'Garwood', 'Shakspeare', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '12');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (41, 'Suzann', 'Ribbens', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '48');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (42, 'Alexis', 'Curbishley', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '58');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (43, 'Nathanil', 'Brixey', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', '45');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (44, 'Silvester', 'Ollarenshaw', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '32');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (45, 'Enrique', 'Kittoe', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', '56');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (46, 'Chiquia', 'Flindall', 'Morbi non lectus.', '50');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (47, 'Nevin', 'Rowcliffe', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', '21');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (48, 'Demetris', 'Antognelli', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', '18');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (49, 'Jdavie', 'Skyram', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '51');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (50, 'Aloin', 'Iacovini', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '1');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (51, 'Sybila', 'Nacci', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', '20');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (52, 'Hildegarde', 'Aronstein', 'In sagittis dui vel nisl.', '14');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (53, 'Elysha', 'Bransom', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', '39');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (54, 'Herminia', 'Medlar', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '36');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (55, 'Jonathon', 'Tunnacliffe', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', '13');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (56, 'Howard', 'Filisov', 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '7');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (57, 'Curcio', 'Goudie', 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '30');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (58, 'Haslett', 'Kezor', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', '42');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (59, 'Lorilee', 'Senussi', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '44');
insert into groupMembers (memberId, firstName, lastName, role, projectId) values (60, 'Auria', 'Paumier', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '26');

# exam
insert into exam (examId, date, grade, courseId) values (1, '2023-08-15', 45, '3');
insert into exam (examId, date, grade, courseId) values (2, '2023-07-05', 62, '46');
insert into exam (examId, date, grade, courseId) values (3, '2023-02-23', 100, '32');
insert into exam (examId, date, grade, courseId) values (4, '2023-05-17', 90, '47');
insert into exam (examId, date, grade, courseId) values (5, '2023-06-03', 83, '10');
insert into exam (examId, date, grade, courseId) values (6, '2023-11-04', 44, '31');
insert into exam (examId, date, grade, courseId) values (7, '2022-12-02', 22, '16');
insert into exam (examId, date, grade, courseId) values (8, '2023-05-24', 11, '7');
insert into exam (examId, date, grade, courseId) values (9, '2023-01-12', 67, '38');
insert into exam (examId, date, grade, courseId) values (10, '2022-12-09', 65, '15');
insert into exam (examId, date, grade, courseId) values (11, '2023-08-09', 27, '33');
insert into exam (examId, date, grade, courseId) values (12, '2023-04-23', 27, '34');
insert into exam (examId, date, grade, courseId) values (13, '2023-06-03', 54, '4');
insert into exam (examId, date, grade, courseId) values (14, '2022-12-11', 98, '9');
insert into exam (examId, date, grade, courseId) values (15, '2023-08-15', 76, '11');
insert into exam (examId, date, grade, courseId) values (16, '2023-09-05', 98, '30');
insert into exam (examId, date, grade, courseId) values (17, '2023-08-30', 98, '14');
insert into exam (examId, date, grade, courseId) values (18, '2023-03-31', 65, '51');
insert into exam (examId, date, grade, courseId) values (19, '2023-11-30', 98, '22');
insert into exam (examId, date, grade, courseId) values (20, '2023-05-28', 87, '20');
insert into exam (examId, date, grade, courseId) values (21, '2023-10-07', 76, '55');
insert into exam (examId, date, grade, courseId) values (22, '2023-03-31', 76, '59');
insert into exam (examId, date, grade, courseId) values (23, '2023-08-11', 76, '28');
insert into exam (examId, date, grade, courseId) values (24, '2023-05-07', 87, '54');
insert into exam (examId, date, grade, courseId) values (25, '2023-01-01', 76, '42');
insert into exam (examId, date, grade, courseId) values (26, '2023-02-22', 76, '53');
insert into exam (examId, date, grade, courseId) values (27, '2023-08-14', 87, '40');
insert into exam (examId, date, grade, courseId) values (28, '2023-02-03', 98, '12');
insert into exam (examId, date, grade, courseId) values (29, '2023-08-06', 100, '8');
insert into exam (examId, date, grade, courseId) values (30, '2023-06-12', 76, '37');
insert into exam (examId, date, grade, courseId) values (31, '2023-05-29', 65, '35');
insert into exam (examId, date, grade, courseId) values (32, '2023-11-09', 54 ,'52');
insert into exam (examId, date, grade, courseId) values (33, '2023-11-06', 43, '1');
insert into exam (examId, date, grade, courseId) values (34, '2023-01-10', 65, '43');
insert into exam (examId, date, grade, courseId) values (35, '2023-01-12', 87 ,'44');
insert into exam (examId, date, grade, courseId) values (36, '2023-03-30', 7, '58');
insert into exam (examId, date, grade, courseId) values (37, '2023-02-11', 2, '45');
insert into exam (examId, date, grade, courseId) values (38, '2023-09-23', 98, '27');
insert into exam (examId, date, grade, courseId) values (39, '2023-08-28', 54, '49');
insert into exam (examId, date, grade, courseId) values (40, '2023-01-22', 43, '56');
insert into exam (examId, date, grade, courseId) values (41, '2023-01-24', 43,'26');
insert into exam (examId, date, grade, courseId) values (42, '2023-07-04', 43, '24');
insert into exam (examId, date, grade, courseId) values (43, '2023-04-23', 54, '41');
insert into exam (examId, date, grade, courseId) values (44, '2023-02-20', 43, '18');
insert into exam (examId, date, grade, courseId) values (45, '2023-09-09', 43, '13');
insert into exam (examId, date, grade, courseId) values (46, '2023-01-02', 76, '25');
insert into exam (examId, date, grade, courseId) values (47, '2023-10-28', 76, '19');
insert into exam (examId, date, grade, courseId) values (48, '2023-09-05', 7, '39');
insert into exam (examId, date, grade, courseId) values (49, '2023-08-18', 54, '23');
insert into exam (examId, date, grade, courseId) values (50, '2023-02-01', 43,'29');
insert into exam (examId, date, grade, courseId) values (51, '2023-01-21', 43, '17');
insert into exam (examId, date, grade, courseId) values (52, '2023-01-07', 43, '2');
insert into exam (examId, date, grade, courseId) values (53, '2023-11-28', 32, '6');
insert into exam (examId, date, grade, courseId) values (54, '2023-04-29', 43, '5');
insert into exam (examId, date, grade, courseId) values (55, '2023-08-04', 87, '60');
insert into exam (examId, date, grade, courseId) values (56, '2023-11-22', 98, '57');
insert into exam (examId, date, grade, courseId) values (57, '2023-05-25', 98, '36');
insert into exam (examId, date, grade, courseId) values (58, '2023-05-24', 98, '50');
insert into exam (examId, date, grade, courseId) values (59, '2023-01-29', 98, '48');
insert into exam (examId, date, grade, courseId) values (60, '2023-10-26', 98, '21');

# section
insert into section (sectionId, sectionNumber, courseId) values (1, '06', '44');
insert into section (sectionId, sectionNumber, courseId) values (2, '74', '58');
insert into section (sectionId, sectionNumber, courseId) values (3, '52', '11');
insert into section (sectionId, sectionNumber, courseId) values (4, '23', '37');
insert into section (sectionId, sectionNumber, courseId) values (5, '55', '23');
insert into section (sectionId, sectionNumber, courseId) values (6, '61', '4');
insert into section (sectionId, sectionNumber, courseId) values (7, '12', '54');
insert into section (sectionId, sectionNumber, courseId) values (8, '37', '35');
insert into section (sectionId, sectionNumber, courseId) values (9, '63', '6');
insert into section (sectionId, sectionNumber, courseId) values (10, '76', '30');
insert into section (sectionId, sectionNumber, courseId) values (11, '82', '15');
insert into section (sectionId, sectionNumber, courseId) values (12, '19', '34');
insert into section (sectionId, sectionNumber, courseId) values (13, '52', '38');
insert into section (sectionId, sectionNumber, courseId) values (14, '66', '18');
insert into section (sectionId, sectionNumber, courseId) values (15, '60', '41');
insert into section (sectionId, sectionNumber, courseId) values (16, '53', '43');
insert into section (sectionId, sectionNumber, courseId) values (17, '86', '36');
insert into section (sectionId, sectionNumber, courseId) values (18, '58', '20');
insert into section (sectionId, sectionNumber, courseId) values (19, '34', '5');
insert into section (sectionId, sectionNumber, courseId) values (20, '62', '21');
insert into section (sectionId, sectionNumber, courseId) values (21, '07', '52');
insert into section (sectionId, sectionNumber, courseId) values (22, '30', '22');
insert into section (sectionId, sectionNumber, courseId) values (23, '48', '10');
insert into section (sectionId, sectionNumber, courseId) values (24, '36', '26');
insert into section (sectionId, sectionNumber, courseId) values (25, '91', '16');
insert into section (sectionId, sectionNumber, courseId) values (26, '45', '1');
insert into section (sectionId, sectionNumber, courseId) values (27, '02', '7');
insert into section (sectionId, sectionNumber, courseId) values (28, '72', '46');
insert into section (sectionId, sectionNumber, courseId) values (29, '60', '19');
insert into section (sectionId, sectionNumber, courseId) values (30, '61', '42');
insert into section (sectionId, sectionNumber, courseId) values (31, '33', '55');
insert into section (sectionId, sectionNumber, courseId) values (32, '82', '28');
insert into section (sectionId, sectionNumber, courseId) values (33, '89', '12');
insert into section (sectionId, sectionNumber, courseId) values (34, '32', '24');
insert into section (sectionId, sectionNumber, courseId) values (35, '23', '32');
insert into section (sectionId, sectionNumber, courseId) values (36, '25', '27');
insert into section (sectionId, sectionNumber, courseId) values (37, '44', '2');
insert into section (sectionId, sectionNumber, courseId) values (38, '11', '39');
insert into section (sectionId, sectionNumber, courseId) values (39, '93', '60');
insert into section (sectionId, sectionNumber, courseId) values (40, '54', '50');
insert into section (sectionId, sectionNumber, courseId) values (41, '96', '17');
insert into section (sectionId, sectionNumber, courseId) values (42, '32', '51');
insert into section (sectionId, sectionNumber, courseId) values (43, '77', '33');
insert into section (sectionId, sectionNumber, courseId) values (44, '20', '13');
insert into section (sectionId, sectionNumber, courseId) values (45, '75', '14');
insert into section (sectionId, sectionNumber, courseId) values (46, '34', '25');
insert into section (sectionId, sectionNumber, courseId) values (47, '16', '57');
insert into section (sectionId, sectionNumber, courseId) values (48, '61', '31');
insert into section (sectionId, sectionNumber, courseId) values (49, '85', '9');
insert into section (sectionId, sectionNumber, courseId) values (50, '91', '49');
insert into section (sectionId, sectionNumber, courseId) values (51, '20', '3');
insert into section (sectionId, sectionNumber, courseId) values (52, '03', '45');
insert into section (sectionId, sectionNumber, courseId) values (53, '31', '53');
insert into section (sectionId, sectionNumber, courseId) values (54, '92', '56');
insert into section (sectionId, sectionNumber, courseId) values (55, '94', '59');
insert into section (sectionId, sectionNumber, courseId) values (56, '24', '47');
insert into section (sectionId, sectionNumber, courseId) values (57, '38', '8');
insert into section (sectionId, sectionNumber, courseId) values (58, '24', '29');
insert into section (sectionId, sectionNumber, courseId) values (59, '23', '48');
insert into section (sectionId, sectionNumber, courseId) values (60, '68', '40');

# student
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (1, 'Ezri', 'Limeburn', '717-363-2102', 5, 'elimeburn0@tripod.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (2, 'Jermaine', 'Muslim', '487-436-5526', 2, 'jmuslim1@yellowpages.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (3, 'Viviyan', 'Docharty', '859-735-3936', 3, 'vdocharty2@geocities.jp');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (4, 'Carmela', 'Pinkerton', '223-285-9704', 3, 'cpinkerton3@mysql.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (5, 'Ailyn', 'McCole', '735-881-0396', 4, 'amccole4@mayoclinic.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (6, 'Michel', 'Meadley', '511-759-9601', 5, 'mmeadley5@geocities.jp');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (7, 'Virginie', 'Youson', '513-174-5340', 5, 'vyouson6@joomla.org');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (8, 'Mandel', 'Plaster', '638-107-2150', 5, 'mplaster7@wp.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (9, 'Lyell', 'Andrejevic', '353-294-6537', 5, 'landrejevic8@dedecms.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (10, 'Aldrich', 'Ferryman', '214-388-3508', 3, 'aferryman9@amazon.co.uk');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (11, 'Johnath', 'Dugget', '663-903-5115', 4, 'jduggeta@vistaprint.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (12, 'Kelly', 'Vicker', '430-434-8083', 5, 'kvickerb@google.com.br');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (13, 'Arlan', 'Cosgreave', '730-948-9283', 3, 'acosgreavec@odnoklassniki.ru');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (14, 'Florentia', 'Stower', '550-304-8220', 1, 'fstowerd@imdb.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (15, 'Meaghan', 'Brandino', '227-185-5240', 3, 'mbrandinoe@ow.ly');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (16, 'Hana', 'Angric', '798-983-8627', 4, 'hangricf@dagondesign.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (17, 'Klarrisa', 'Starford', '345-478-0848', 5, 'kstarfordg@netvibes.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (18, 'Robby', 'Burdess', '551-695-5939', 5, 'rburdessh@weebly.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (19, 'Torie', 'Gullyes', '330-933-8171', 1, 'tgullyesi@google.es');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (20, 'Wilie', 'Maltby', '442-392-5705', 3, 'wmaltbyj@smugmug.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (21, 'Giselle', 'Bruhn', '989-685-5151', 3, 'gbruhnk@people.com.cn');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (22, 'Aubine', 'Molfino', '825-575-1672', 5, 'amolfinol@zimbio.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (23, 'Abey', 'Sabates', '656-707-4769', 5, 'asabatesm@reverbnation.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (24, 'Petra', 'De Minico', '240-426-7407', 2, 'pdeminicon@ucoz.ru');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (25, 'Pavel', 'Pritchett', '875-211-0738', 3, 'ppritchetto@drupal.org');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (26, 'Beauregard', 'Mouser', '704-887-1449', 4, 'bmouserp@chron.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (27, 'Jean', 'Leatherland', '644-746-5418', 5, 'jleatherlandq@miitbeian.gov.cn');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (28, 'Micheil', 'Gooddy', '319-255-1017', 3, 'mgooddyr@gov.uk');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (29, 'Jacquie', 'Galvan', '188-556-0132', 5, 'jgalvans@infoseek.co.jp');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (30, 'Laurel', 'Riglar', '643-184-9361', 4, 'lriglart@posterous.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (31, 'Gayle', 'Armistead', '205-765-4889', 3, 'garmisteadu@bloglines.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (32, 'Cherlyn', 'Wornham', '763-200-1487', 2, 'cwornhamv@mozilla.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (33, 'Blinni', 'Cobby', '297-937-7415', 3, 'bcobbyw@pen.io');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (34, 'Fulton', 'de Clerk', '371-113-1689', 4, 'fdeclerkx@w3.org');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (35, 'Shandra', 'Mingotti', '105-840-2256', 5, 'smingottiy@washingtonpost.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (36, 'Mylo', 'Guage', '319-150-2495', 5, 'mguagez@uiuc.edu');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (37, 'Roland', 'Thompkins', '428-697-8013', 3, 'rthompkins10@furl.net');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (38, 'Karl', 'Harron', '186-581-0550', 1, 'kharron11@moonfruit.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (39, 'Sylas', 'Varker', '167-647-4020', 5, 'svarker12@huffingtonpost.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (40, 'Valina', 'Powers', '125-234-5913', 2, 'vpowers13@blinklist.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (41, 'Wylie', 'Bratton', '800-745-5945', 4, 'wbratton14@theguardian.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (42, 'Yale', 'Stopper', '743-181-9055', 3, 'ystopper15@miibeian.gov.cn');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (43, 'Shandee', 'Ivanitsa', '111-215-1566', 3, 'sivanitsa16@freewebs.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (44, 'Gisele', 'Bushe', '654-113-4960', 2, 'gbushe17@sina.com.cn');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (45, 'Bride', 'Mays', '271-451-0914', 1, 'bmays18@geocities.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (46, 'Chickie', 'Bottom', '531-199-6703', 3, 'cbottom19@tiny.cc');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (47, 'Bern', 'Gregorio', '469-705-2122', 5, 'bgregorio1a@foxnews.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (48, 'Hesther', 'Nudde', '176-816-5213', 2, 'hnudde1b@nationalgeographic.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (49, 'Crysta', 'Pautot', '405-315-5167', 1, 'cpautot1c@51.la');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (50, 'Joana', 'Shernock', '953-991-7237', 3, 'jshernock1d@nifty.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (51, 'Tasia', 'Howie', '826-301-5101', 1, 'thowie1e@spiegel.de');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (52, 'Inna', 'Lorking', '926-845-2066', 4, 'ilorking1f@va.gov');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (53, 'Ashley', 'Twining', '761-605-5414', 1, 'atwining1g@pen.io');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (54, 'Evie', 'Rolles', '104-643-2496', 5, 'erolles1h@smh.com.au');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (55, 'Abraham', 'Piercy', '319-961-2528', 3, 'apiercy1i@huffingtonpost.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (56, 'Moishe', 'Raddan', '936-590-2603', 1, 'mraddan1j@home.pl');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (57, 'Hubie', 'Abrashkov', '459-430-8986', 5, 'habrashkov1k@lycos.com');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (58, 'Kasey', 'Fealey', '881-134-9383', 2, 'kfealey1l@drupal.org');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (59, 'Jaime', 'Reddecliffe', '122-274-5345', 5, 'jreddecliffe1m@independent.co.uk');
insert into student (studentId, firstName, lastName, phoneNumber, year, email) values (60, 'Larissa', 'Clapshaw', '810-569-9685', 3, 'lclapshaw1n@yahoo.com');

# studentSection
insert into studentSection (studentId, sectionId) values ('40', '9');
insert into studentSection (studentId, sectionId) values ('34', '51');
insert into studentSection (studentId, sectionId) values ('42', '45');
insert into studentSection (studentId, sectionId) values ('9', '21');
insert into studentSection (studentId, sectionId) values ('25', '44');
insert into studentSection (studentId, sectionId) values ('4', '6');
insert into studentSection (studentId, sectionId) values ('23', '55');
insert into studentSection (studentId, sectionId) values ('1', '30');
insert into studentSection (studentId, sectionId) values ('35', '33');
insert into studentSection (studentId, sectionId) values ('8', '5');
insert into studentSection (studentId, sectionId) values ('56', '56');
insert into studentSection (studentId, sectionId) values ('51', '28');
insert into studentSection (studentId, sectionId) values ('28', '24');
insert into studentSection (studentId, sectionId) values ('55', '46');
insert into studentSection (studentId, sectionId) values ('60', '43');
insert into studentSection (studentId, sectionId) values ('18', '20');
insert into studentSection (studentId, sectionId) values ('26', '39');
insert into studentSection (studentId, sectionId) values ('6', '8');
insert into studentSection (studentId, sectionId) values ('24', '48');
insert into studentSection (studentId, sectionId) values ('53', '36');
insert into studentSection (studentId, sectionId) values ('21', '4');
insert into studentSection (studentId, sectionId) values ('27', '34');
insert into studentSection (studentId, sectionId) values ('31', '58');
insert into studentSection (studentId, sectionId) values ('12', '16');
insert into studentSection (studentId, sectionId) values ('43', '15');
insert into studentSection (studentId, sectionId) values ('52', '53');
insert into studentSection (studentId, sectionId) values ('33', '57');
insert into studentSection (studentId, sectionId) values ('20', '50');
insert into studentSection (studentId, sectionId) values ('54', '47');
insert into studentSection (studentId, sectionId) values ('13', '54');
insert into studentSection (studentId, sectionId) values ('19', '35');
insert into studentSection (studentId, sectionId) values ('10', '49');
insert into studentSection (studentId, sectionId) values ('44', '3');
insert into studentSection (studentId, sectionId) values ('16', '22');
insert into studentSection (studentId, sectionId) values ('2', '52');
insert into studentSection (studentId, sectionId) values ('36', '1');
insert into studentSection (studentId, sectionId) values ('39', '37');
insert into studentSection (studentId, sectionId) values ('29', '17');
insert into studentSection (studentId, sectionId) values ('37', '2');
insert into studentSection (studentId, sectionId) values ('49', '11');
insert into studentSection (studentId, sectionId) values ('38', '27');
insert into studentSection (studentId, sectionId) values ('7', '7');
insert into studentSection (studentId, sectionId) values ('30', '18');
insert into studentSection (studentId, sectionId) values ('14', '14');
insert into studentSection (studentId, sectionId) values ('22', '41');
insert into studentSection (studentId, sectionId) values ('59', '31');
insert into studentSection (studentId, sectionId) values ('57', '29');
insert into studentSection (studentId, sectionId) values ('17', '19');
insert into studentSection (studentId, sectionId) values ('46', '25');
insert into studentSection (studentId, sectionId) values ('58', '40');
insert into studentSection (studentId, sectionId) values ('45', '59');
insert into studentSection (studentId, sectionId) values ('47', '12');
insert into studentSection (studentId, sectionId) values ('3', '60');
insert into studentSection (studentId, sectionId) values ('50', '42');
insert into studentSection (studentId, sectionId) values ('32', '23');
insert into studentSection (studentId, sectionId) values ('48', '26');
insert into studentSection (studentId, sectionId) values ('15', '10');
insert into studentSection (studentId, sectionId) values ('11', '32');
insert into studentSection (studentId, sectionId) values ('41', '13');
insert into studentSection (studentId, sectionId) values ('5', '38');
insert into studentSection (studentId, sectionId) values ('55', '59');
insert into studentSection (studentId, sectionId) values ('32', '42');
insert into studentSection (studentId, sectionId) values ('4', '39');
insert into studentSection (studentId, sectionId) values ('36', '19');
insert into studentSection (studentId, sectionId) values ('23', '48');
insert into studentSection (studentId, sectionId) values ('57', '58');
insert into studentSection (studentId, sectionId) values ('53', '53');
insert into studentSection (studentId, sectionId) values ('56', '31');
insert into studentSection (studentId, sectionId) values ('5', '36');
insert into studentSection (studentId, sectionId) values ('48', '32');
insert into studentSection (studentId, sectionId) values ('22', '18');
insert into studentSection (studentId, sectionId) values ('9', '25');
insert into studentSection (studentId, sectionId) values ('37', '23');
insert into studentSection (studentId, sectionId) values ('38', '49');
insert into studentSection (studentId, sectionId) values ('33', '5');
insert into studentSection (studentId, sectionId) values ('43', '57');
insert into studentSection (studentId, sectionId) values ('14', '7');
insert into studentSection (studentId, sectionId) values ('19', '26');
insert into studentSection (studentId, sectionId) values ('2', '55');
insert into studentSection (studentId, sectionId) values ('54', '41');
insert into studentSection (studentId, sectionId) values ('15', '35');
insert into studentSection (studentId, sectionId) values ('8', '29');
insert into studentSection (studentId, sectionId) values ('42', '8');
insert into studentSection (studentId, sectionId) values ('46', '56');
insert into studentSection (studentId, sectionId) values ('7', '37');
insert into studentSection (studentId, sectionId) values ('40', '46');
insert into studentSection (studentId, sectionId) values ('10', '27');
insert into studentSection (studentId, sectionId) values ('50', '9');
insert into studentSection (studentId, sectionId) values ('21', '12');
insert into studentSection (studentId, sectionId) values ('31', '22');
insert into studentSection (studentId, sectionId) values ('20', '10');
insert into studentSection (studentId, sectionId) values ('45', '21');
insert into studentSection (studentId, sectionId) values ('35', '20');
insert into studentSection (studentId, sectionId) values ('30', '54');
insert into studentSection (studentId, sectionId) values ('11', '43');
insert into studentSection (studentId, sectionId) values ('24', '30');
insert into studentSection (studentId, sectionId) values ('13', '45');
insert into studentSection (studentId, sectionId) values ('16', '60');
insert into studentSection (studentId, sectionId) values ('47', '4');
insert into studentSection (studentId, sectionId) values ('26', '24');
insert into studentSection (studentId, sectionId) values ('12', '38');
insert into studentSection (studentId, sectionId) values ('59', '3');
insert into studentSection (studentId, sectionId) values ('25', '52');
insert into studentSection (studentId, sectionId) values ('34', '1');
insert into studentSection (studentId, sectionId) values ('39', '34');
insert into studentSection (studentId, sectionId) values ('52', '15');
insert into studentSection (studentId, sectionId) values ('44', '50');
insert into studentSection (studentId, sectionId) values ('17', '11');
insert into studentSection (studentId, sectionId) values ('60', '47');
insert into studentSection (studentId, sectionId) values ('28', '6');
insert into studentSection (studentId, sectionId) values ('49', '51');
insert into studentSection (studentId, sectionId) values ('18', '33');
insert into studentSection (studentId, sectionId) values ('51', '2');
insert into studentSection (studentId, sectionId) values ('3', '40');
insert into studentSection (studentId, sectionId) values ('1', '28');
insert into studentSection (studentId, sectionId) values ('41', '13');
insert into studentSection (studentId, sectionId) values ('58', '14');
insert into studentSection (studentId, sectionId) values ('6', '44');
insert into studentSection (studentId, sectionId) values ('27', '17');
insert into studentSection (studentId, sectionId) values ('29', '16');
insert into studentSection (studentId, sectionId) values ('49', '8');
insert into studentSection (studentId, sectionId) values ('58', '51');
insert into studentSection (studentId, sectionId) values ('41', '10');
insert into studentSection (studentId, sectionId) values ('22', '57');
insert into studentSection (studentId, sectionId) values ('14', '31');
insert into studentSection (studentId, sectionId) values ('53', '6');
insert into studentSection (studentId, sectionId) values ('23', '52');
insert into studentSection (studentId, sectionId) values ('59', '7');
insert into studentSection (studentId, sectionId) values ('16', '15');
insert into studentSection (studentId, sectionId) values ('27', '42');
insert into studentSection (studentId, sectionId) values ('17', '37');
insert into studentSection (studentId, sectionId) values ('1', '47');
insert into studentSection (studentId, sectionId) values ('46', '20');
insert into studentSection (studentId, sectionId) values ('28', '59');
insert into studentSection (studentId, sectionId) values ('18', '48');
insert into studentSection (studentId, sectionId) values ('33', '55');
insert into studentSection (studentId, sectionId) values ('24', '14');
insert into studentSection (studentId, sectionId) values ('47', '18');
insert into studentSection (studentId, sectionId) values ('8', '13');
insert into studentSection (studentId, sectionId) values ('3', '28');
insert into studentSection (studentId, sectionId) values ('2', '27');
insert into studentSection (studentId, sectionId) values ('56', '34');
insert into studentSection (studentId, sectionId) values ('29', '3');
insert into studentSection (studentId, sectionId) values ('57', '38');
insert into studentSection (studentId, sectionId) values ('6', '45');
insert into studentSection (studentId, sectionId) values ('44', '60');
insert into studentSection (studentId, sectionId) values ('51', '33');
insert into studentSection (studentId, sectionId) values ('4', '30');
insert into studentSection (studentId, sectionId) values ('13', '24');
insert into studentSection (studentId, sectionId) values ('11', '32');
insert into studentSection (studentId, sectionId) values ('31', '29');
insert into studentSection (studentId, sectionId) values ('7', '36');
insert into studentSection (studentId, sectionId) values ('37', '23');
insert into studentSection (studentId, sectionId) values ('25', '43');
insert into studentSection (studentId, sectionId) values ('60', '4');
insert into studentSection (studentId, sectionId) values ('52', '53');
insert into studentSection (studentId, sectionId) values ('15', '16');
insert into studentSection (studentId, sectionId) values ('40', '17');
insert into studentSection (studentId, sectionId) values ('21', '58');
insert into studentSection (studentId, sectionId) values ('19', '11');
insert into studentSection (studentId, sectionId) values ('55', '41');
insert into studentSection (studentId, sectionId) values ('50', '39');
insert into studentSection (studentId, sectionId) values ('38', '5');
insert into studentSection (studentId, sectionId) values ('54', '19');
insert into studentSection (studentId, sectionId) values ('43', '2');
insert into studentSection (studentId, sectionId) values ('32', '21');
insert into studentSection (studentId, sectionId) values ('10', '35');
insert into studentSection (studentId, sectionId) values ('35', '44');
insert into studentSection (studentId, sectionId) values ('42', '54');
insert into studentSection (studentId, sectionId) values ('36', '40');
insert into studentSection (studentId, sectionId) values ('20', '1');
insert into studentSection (studentId, sectionId) values ('5', '56');
insert into studentSection (studentId, sectionId) values ('39', '46');
insert into studentSection (studentId, sectionId) values ('45', '50');
insert into studentSection (studentId, sectionId) values ('26', '26');
insert into studentSection (studentId, sectionId) values ('34', '25');
insert into studentSection (studentId, sectionId) values ('12', '22');
insert into studentSection (studentId, sectionId) values ('48', '12');
insert into studentSection (studentId, sectionId) values ('9', '49');
insert into studentSection (studentId, sectionId) values ('30', '9');
insert into studentSection (studentId, sectionId) values ('18', '45');
insert into studentSection (studentId, sectionId) values ('43', '12');
insert into studentSection (studentId, sectionId) values ('55', '44');
insert into studentSection (studentId, sectionId) values ('41', '9');
insert into studentSection (studentId, sectionId) values ('45', '36');
insert into studentSection (studentId, sectionId) values ('30', '2');
insert into studentSection (studentId, sectionId) values ('22', '59');
insert into studentSection (studentId, sectionId) values ('33', '17');
insert into studentSection (studentId, sectionId) values ('13', '35');
insert into studentSection (studentId, sectionId) values ('17', '32');
insert into studentSection (studentId, sectionId) values ('21', '16');
insert into studentSection (studentId, sectionId) values ('2', '41');
insert into studentSection (studentId, sectionId) values ('28', '22');
insert into studentSection (studentId, sectionId) values ('59', '25');
insert into studentSection (studentId, sectionId) values ('37', '56');
insert into studentSection (studentId, sectionId) values ('35', '60');
insert into studentSection (studentId, sectionId) values ('3', '57');
insert into studentSection (studentId, sectionId) values ('34', '4');
insert into studentSection (studentId, sectionId) values ('38', '23');
insert into studentSection (studentId, sectionId) values ('5', '6');

# attendance
insert into attendance (attendanceId, date, status) values (1, '2023-08-03', 0);
insert into attendance (attendanceId, date, status) values (2, '2023-01-01', 1);
insert into attendance (attendanceId, date, status) values (3, '2023-07-01', 1);
insert into attendance (attendanceId, date, status) values (4, '2023-01-12', 0);
insert into attendance (attendanceId, date, status) values (5, '2023-01-29', 0);
insert into attendance (attendanceId, date, status) values (6, '2023-06-27', 1);
insert into attendance (attendanceId, date, status) values (7, '2023-02-14', 0);
insert into attendance (attendanceId, date, status) values (8, '2023-06-01', 1);
insert into attendance (attendanceId, date, status) values (9, '2023-01-25', 0);
insert into attendance (attendanceId, date, status) values (10, '2022-12-07', 0);
insert into attendance (attendanceId, date, status) values (11, '2023-03-22', 0);
insert into attendance (attendanceId, date, status) values (12, '2023-01-22', 1);
insert into attendance (attendanceId, date, status) values (13, '2023-01-05', 0);
insert into attendance (attendanceId, date, status) values (14, '2022-12-04', 0);
insert into attendance (attendanceId, date, status) values (15, '2023-08-05', 1);
insert into attendance (attendanceId, date, status) values (16, '2023-05-02', 0);
insert into attendance (attendanceId, date, status) values (17, '2023-05-06', 1);
insert into attendance (attendanceId, date, status) values (18, '2023-09-10', 0);
insert into attendance (attendanceId, date, status) values (19, '2023-06-10', 1);
insert into attendance (attendanceId, date, status) values (20, '2023-07-24', 0);
insert into attendance (attendanceId, date, status) values (21, '2023-05-12', 0);
insert into attendance (attendanceId, date, status) values (22, '2023-01-30', 0);
insert into attendance (attendanceId, date, status) values (23, '2023-07-04', 1);
insert into attendance (attendanceId, date, status) values (24, '2023-03-02', 0);
insert into attendance (attendanceId, date, status) values (25, '2023-02-03', 0);
insert into attendance (attendanceId, date, status) values (26, '2023-10-04', 1);
insert into attendance (attendanceId, date, status) values (27, '2023-08-24', 0);
insert into attendance (attendanceId, date, status) values (28, '2023-08-05', 1);
insert into attendance (attendanceId, date, status) values (29, '2023-09-23', 0);
insert into attendance (attendanceId, date, status) values (30, '2023-10-14', 1);
insert into attendance (attendanceId, date, status) values (31, '2023-08-25', 0);
insert into attendance (attendanceId, date, status) values (32, '2023-02-21', 1);
insert into attendance (attendanceId, date, status) values (33, '2023-08-13', 0);
insert into attendance (attendanceId, date, status) values (34, '2023-08-27', 0);
insert into attendance (attendanceId, date, status) values (35, '2023-05-05', 0);
insert into attendance (attendanceId, date, status) values (36, '2023-09-23', 1);
insert into attendance (attendanceId, date, status) values (37, '2023-11-19', 1);
insert into attendance (attendanceId, date, status) values (38, '2023-08-29', 0);
insert into attendance (attendanceId, date, status) values (39, '2023-04-23', 0);
insert into attendance (attendanceId, date, status) values (40, '2023-09-08', 1);
insert into attendance (attendanceId, date, status) values (41, '2023-05-17', 0);
insert into attendance (attendanceId, date, status) values (42, '2023-11-30', 0);
insert into attendance (attendanceId, date, status) values (43, '2023-07-08', 0);
insert into attendance (attendanceId, date, status) values (44, '2022-12-18', 0);
insert into attendance (attendanceId, date, status) values (45, '2023-05-02', 1);
insert into attendance (attendanceId, date, status) values (46, '2023-10-20', 0);
insert into attendance (attendanceId, date, status) values (47, '2023-01-20', 1);
insert into attendance (attendanceId, date, status) values (48, '2023-07-28', 1);
insert into attendance (attendanceId, date, status) values (49, '2023-03-28', 1);
insert into attendance (attendanceId, date, status) values (50, '2023-03-12', 0);
insert into attendance (attendanceId, date, status) values (51, '2023-03-27', 1);
insert into attendance (attendanceId, date, status) values (52, '2023-09-11', 0);
insert into attendance (attendanceId, date, status) values (53, '2023-08-07', 0);
insert into attendance (attendanceId, date, status) values (54, '2022-12-16', 0);
insert into attendance (attendanceId, date, status) values (55, '2023-08-22', 0);
insert into attendance (attendanceId, date, status) values (56, '2023-06-19', 0);
insert into attendance (attendanceId, date, status) values (57, '2023-11-05', 0);
insert into attendance (attendanceId, date, status) values (58, '2023-08-05', 1);
insert into attendance (attendanceId, date, status) values (59, '2023-09-02', 1);
insert into attendance (attendanceId, date, status) values (60, '2023-09-21', 1);

# studentAttendance
insert into studentAttendance (studentId, sectionId, attendanceId) values ('38', '36', '59');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('13', '23', '29');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('14', '21', '13');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('1', '22', '60');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('3', '15', '58');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('37', '28', '17');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('11', '6', '2');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('22', '27', '39');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('42', '13', '41');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('48', '44', '12');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('53', '8', '54');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('2', '3', '25');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('56', '34', '35');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('25', '52', '19');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('49', '58', '51');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('20', '5', '1');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('35', '2', '56');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('32', '54', '40');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('55', '47', '18');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('60', '48', '33');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('54', '41', '47');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('40', '31', '14');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('8', '10', '31');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('33', '57', '10');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('4', '24', '48');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('17', '4', '34');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('29', '16', '52');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('9', '55', '20');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('39', '60', '24');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('24', '33', '49');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('15', '26', '55');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('7', '43', '30');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('19', '42', '37');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('31', '12', '36');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('41', '46', '7');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('12', '19', '3');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('16', '25', '43');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('44', '40', '38');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('27', '35', '8');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('51', '7', '21');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('47', '53', '53');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('52', '39', '46');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('50', '18', '4');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('26', '37', '44');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('59', '32', '5');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('6', '59', '9');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('46', '51', '11');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('30', '29', '6');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('36', '38', '57');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('43', '45', '28');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('10', '20', '45');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('34', '9', '27');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('5', '56', '26');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('57', '1', '32');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('45', '14', '16');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('21', '11', '22');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('58', '49', '15');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('23', '17', '42');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('28', '30', '23');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('18', '50', '50');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('48', '43', '20');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('42', '32', '11');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('10', '59', '19');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('8', '12', '55');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('39', '38', '59');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('21', '58', '17');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('40', '34', '60');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('47', '40', '34');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('43', '42', '45');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('12', '56', '40');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('31', '7', '27');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('9', '44', '46');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('32', '39', '24');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('50', '35', '9');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('41', '50', '41');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('58', '41', '28');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('53', '57', '53');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('11', '25', '14');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('28', '46', '25');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('17', '26', '21');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('27', '20', '22');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('55', '14', '1');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('16', '47', '39');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('37', '52', '52');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('18', '9', '4');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('45', '18', '32');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('24', '45', '37');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('25', '30', '16');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('15', '11', '50');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('34', '22', '51');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('22', '2', '48');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('52', '10', '5');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('26', '21', '43');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('3', '53', '2');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('56', '55', '29');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('54', '51', '36');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('6', '31', '18');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('1', '49', '23');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('57', '8', '47');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('5', '54', '3');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('14', '36', '56');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('20', '28', '13');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('19', '48', '6');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('59', '6', '26');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('23', '60', '58');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('33', '23', '42');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('30', '16', '54');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('2', '13', '33');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('46', '1', '30');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('49', '29', '12');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('44', '33', '38');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('13', '17', '7');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('29', '19', '8');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('7', '5', '31');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('4', '15', '15');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('35', '27', '44');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('60', '24', '10');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('51', '37', '57');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('36', '3', '35');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('38', '4', '49');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('3', '26', '5');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('51', '49', '54');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('31', '29', '58');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('41', '7', '45');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('8', '25', '15');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('36', '20', '22');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('19', '35', '28');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('33', '52', '23');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('4', '10', '43');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('44', '31', '52');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('16', '43', '7');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('18', '22', '50');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('59', '32', '16');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('14', '38', '49');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('20', '53', '27');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('27', '59', '51');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('60', '23', '25');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('1', '36', '26');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('40', '27', '20');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('26', '56', '19');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('54', '34', '60');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('56', '57', '42');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('58', '45', '38');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('47', '58', '24');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('22', '60', '3');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('28', '39', '9');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('9', '42', '36');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('52', '15', '17');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('2', '11', '41');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('25', '50', '14');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('17', '12', '33');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('15', '16', '53');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('43', '21', '30');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('13', '28', '57');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('39', '14', '1');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('48', '3', '13');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('46', '37', '55');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('10', '18', '59');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('6', '13', '37');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('11', '19', '2');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('32', '8', '47');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('55', '44', '21');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('49', '47', '31');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('24', '24', '48');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('35', '1', '6');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('42', '55', '11');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('30', '9', '40');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('5', '51', '34');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('7', '5', '18');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('34', '17', '44');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('50', '48', '39');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('21', '54', '10');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('53', '46', '46');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('57', '2', '35');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('45', '41', '12');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('37', '30', '29');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('29', '40', '56');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('38', '33', '4');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('23', '6', '8');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('12', '4', '32');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('55', '2', '5');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('50', '15', '54');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('35', '40', '32');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('19', '33', '39');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('31', '47', '41');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('34', '24', '48');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('10', '46', '19');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('23', '35', '17');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('49', '13', '8');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('21', '57', '9');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('5', '53', '29');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('59', '60', '42');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('48', '11', '57');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('25', '5', '31');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('56', '44', '15');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('27', '17', '33');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('12', '49', '27');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('41', '27', '21');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('2', '12', '24');
insert into studentAttendance (studentId, sectionId, attendanceId) values ('39', '55', '44');

# homeworkAssignment
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (1, '2023-04-02', 'Donec dapibus.', 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '13', '23');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (2, '2023-03-01', 'Donec vitae nisi.', 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '16', '42');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (3, '2023-09-29', 'Suspendisse potenti.', 1, 'Donec dapibus.', '40', '2');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (4, '2023-03-18', 'Aliquam quis turpis eget elit sodales scelerisque.', 1, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '56', '51');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (5, '2023-11-06', 'Morbi ut odio.', 0, 'Aliquam sit amet diam in magna bibendum imperdiet.', '23', '35');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (6, '2023-11-24', 'Aliquam erat volutpat.', 0, 'Curabitur at ipsum ac tellus semper interdum.', '49', '26');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (7, '2023-10-25', 'Vivamus in felis eu sapien cursus vestibulum.', 0, 'In quis justo.', '14', '34');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (8, '2023-07-15', 'Vivamus in felis eu sapien cursus vestibulum.', 0, 'Aliquam sit amet diam in magna bibendum imperdiet.', '32', '28');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (9, '2022-12-28', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 1, 'Aliquam sit amet diam in magna bibendum imperdiet.', '38', '3');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (10, '2023-10-17', 'Pellentesque at nulla.', 0, 'Donec quis orci eget orci vehicula condimentum.', '3', '58');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (11, '2023-03-23', 'Fusce posuere felis sed lacus.', 1, 'Etiam justo.', '27', '48');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (12, '2023-09-22', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 1, 'Fusce consequat.', '25', '45');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (13, '2023-03-02', 'Vivamus vestibulum sagittis sapien.', 0, 'Nullam varius.', '41', '30');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (14, '2023-02-05', 'Curabitur gravida nisi at nibh.', 0, 'Sed ante.', '39', '5');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (15, '2023-06-29', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 0, 'Vivamus vestibulum sagittis sapien.', '24', '8');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (16, '2023-02-19', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 0, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2', '25');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (17, '2023-10-15', 'Vivamus vestibulum sagittis sapien.', 0, 'In hac habitasse platea dictumst.', '7', '32');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (18, '2023-08-23', 'Curabitur in libero ut massa volutpat convallis.', 0, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '22', '41');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (19, '2023-07-02', 'In hac habitasse platea dictumst.', 1, 'Nulla ut erat id mauris vulputate elementum.', '57', '50');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (20, '2023-06-22', 'Phasellus sit amet erat.', 0, 'Nullam porttitor lacus at turpis.', '4', '6');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (21, '2023-11-20', 'Praesent lectus.', 1, 'Ut tellus.', '35', '13');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (22, '2022-12-14', 'Duis aliquam convallis nunc.', 1, 'Donec semper sapien a libero.', '34', '31');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (23, '2023-09-10', 'Sed ante.', 1, 'Duis at velit eu est congue elementum.', '33', '40');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (24, '2022-12-28', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1, 'Praesent id massa id nisl venenatis lacinia.', '30', '46');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (25, '2023-08-15', 'Maecenas rhoncus aliquam lacus.', 1, 'Integer ac neque.', '18', '49');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (26, '2023-04-01', 'Etiam pretium iaculis justo.', 0, 'In hac habitasse platea dictumst.', '60', '22');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (27, '2022-12-12', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 0, 'Aenean sit amet justo.', '47', '33');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (28, '2023-08-17', 'Aenean fermentum.', 1, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '31', '44');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (29, '2023-11-22', 'Duis at velit eu est congue elementum.', 0, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '36', '1');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (30, '2022-12-13', 'Morbi non quam nec dui luctus rutrum.', 1, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '52', '38');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (31, '2023-08-22', 'Aenean fermentum.', 1, 'Phasellus sit amet erat.', '6', '54');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (32, '2023-05-28', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1, 'Morbi ut odio.', '59', '53');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (33, '2023-09-17', 'Nullam porttitor lacus at turpis.', 1, 'Morbi a ipsum.', '43', '37');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (34, '2023-01-29', 'Vestibulum ac est lacinia nisi venenatis tristique.', 1, 'Nulla ut erat id mauris vulputate elementum.', '9', '4');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (35, '2023-08-09', 'Ut tellus.', 0, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '19', '21');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (36, '2023-06-25', 'Maecenas pulvinar lobortis est.', 0, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '20', '47');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (37, '2023-11-13', 'Ut at dolor quis odio consequat varius.', 1, 'Nulla suscipit ligula in lacus.', '10', '14');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (38, '2023-09-17', 'Suspendisse ornare consequat lectus.', 0, 'Donec ut mauris eget massa tempor convallis.', '55', '20');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (39, '2023-06-06', 'Curabitur gravida nisi at nibh.', 0, 'Duis aliquam convallis nunc.', '53', '10');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (40, '2023-01-16', 'Praesent id massa id nisl venenatis lacinia.', 1, 'Proin at turpis a pede posuere nonummy.', '8', '29');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (41, '2023-03-25', 'Donec vitae nisi.', 0, 'Nunc purus.', '44', '24');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (42, '2023-06-10', 'Vestibulum sed magna at nunc commodo placerat.', 1, 'Nulla ac enim.', '45', '55');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (43, '2023-06-19', 'Sed vel enim sit amet nunc viverra dapibus.', 1, 'Nulla nisl.', '29', '27');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (44, '2023-05-11', 'Nullam molestie nibh in lectus.', 1, 'Donec ut dolor.', '50', '17');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (45, '2023-11-19', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 0, 'Phasellus id sapien in sapien iaculis congue.', '42', '56');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (46, '2023-08-13', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 0, 'Vestibulum ac est lacinia nisi venenatis tristique.', '28', '60');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (47, '2023-10-01', 'Ut tellus.', 0, 'In eleifend quam a odio.', '51', '9');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (48, '2023-01-31', 'Cras in purus eu magna vulputate luctus.', 0, 'Ut tellus.', '48', '19');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (49, '2023-06-10', 'Donec dapibus.', 1, 'Sed sagittis.', '54', '57');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (50, '2023-02-15', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 0, 'Nulla facilisi.', '21', '16');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (51, '2023-02-20', 'Curabitur in libero ut massa volutpat convallis.', 0, 'Vivamus vestibulum sagittis sapien.', '12', '11');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (52, '2022-12-06', 'Aliquam quis turpis eget elit sodales scelerisque.', 1, 'Mauris lacinia sapien quis libero.', '37', '12');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (53, '2023-02-11', 'Proin at turpis a pede posuere nonummy.', 0, 'Vivamus in felis eu sapien cursus vestibulum.', '11', '43');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (54, '2023-06-01', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 1, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '26', '18');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (55, '2023-11-12', 'Vestibulum rutrum rutrum neque.', 1, 'Vivamus tortor.', '15', '7');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (56, '2023-04-07', 'In congue.', 0, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '58', '59');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (57, '2023-09-17', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1, 'Phasellus sit amet erat.', '1', '15');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (58, '2023-08-16', 'In hac habitasse platea dictumst.', 0, 'Curabitur gravida nisi at nibh.', '46', '39');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (59, '2023-04-02', 'Cras non velit nec nisi vulputate nonummy.', 0, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '17', '36');
insert into homeworkAssignment (homeworkId, dueDate, description, status, type, studentId, courseId) values (60, '2023-07-24', 'Morbi ut odio.', 0, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '5', '52');

# homeworkSubmission
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (1, '2023-08-02', 85, '48', '40');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (2, '2023-07-03', 38, '50', '11');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (3, '2023-08-17', 43, '21', '32');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (4, '2023-02-15', 8, '22', '56');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (5, '2023-11-29', 53, '4', '1');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (6, '2022-12-12', 3, '13', '17');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (7, '2023-06-17', 82, '31', '14');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (8, '2023-05-31', 31, '10', '10');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (9, '2023-07-05', 30, '45', '55');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (10, '2022-12-04', 15, '42', '31');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (11, '2023-10-01', 44, '41', '58');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (12, '2023-10-27', 84, '11', '39');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (13, '2023-10-12', 7, '40', '59');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (14, '2023-03-07', 85, '9', '7');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (15, '2023-03-04', 0, '16', '29');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (16, '2023-09-14', 74, '32', '45');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (17, '2023-09-05', 79, '59', '18');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (18, '2023-11-19', 36, '56', '53');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (19, '2023-09-11', 99, '58', '51');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (20, '2023-08-05', 24, '51', '9');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (21, '2023-06-12', 57, '49', '52');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (22, '2022-12-07', 55, '15', '38');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (23, '2023-06-20', 42, '26', '24');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (24, '2023-10-04', 62, '24', '19');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (25, '2023-03-26', 60, '14', '37');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (26, '2023-10-19', 79, '57', '47');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (27, '2023-07-23', 27, '7', '60');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (28, '2022-12-11', 79, '19', '2');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (29, '2023-08-29', 44, '52', '48');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (30, '2023-01-30', 62, '1', '49');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (31, '2023-05-04', 35, '2', '42');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (32, '2023-06-12', 36, '54', '12');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (33, '2023-03-08', 16, '8', '27');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (34, '2023-09-20', 35, '34', '15');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (35, '2023-07-30', 54, '39', '4');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (36, '2023-10-25', 8, '29', '34');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (37, '2023-06-15', 39, '25', '30');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (38, '2023-09-21', 9, '12', '8');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (39, '2023-04-28', 79, '47', '13');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (40, '2023-10-24', 86, '46', '22');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (41, '2023-02-07', 70, '5', '25');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (42, '2022-12-26', 31, '60', '43');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (43, '2022-12-20', 17, '43', '33');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (44, '2023-03-21', 68, '28', '21');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (45, '2023-04-20', 51, '23', '44');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (46, '2023-01-10', 79, '35', '35');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (47, '2023-11-17', 27, '44', '41');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (48, '2023-10-07', 33, '33', '57');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (49, '2023-03-30', 22, '37', '28');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (50, '2023-05-17', 84, '3', '50');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (51, '2023-08-06', 85, '17', '26');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (52, '2023-10-01', 91, '38', '6');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (53, '2023-03-09', 73, '27', '36');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (54, '2023-03-14', 54, '36', '20');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (55, '2023-01-09', 4, '53', '5');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (56, '2023-01-07', 6, '18', '54');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (57, '2023-05-18', 65, '6', '3');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (58, '2023-04-02', 20, '30', '23');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (59, '2023-03-24', 48, '55', '46');
insert into homeworkSubmission (submissionId, submissionDate, grade, homeworkId, studentId) values (60, '2023-02-13', 18, '20', '16');

# studyPlan
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (1, '2023-01-14', 11, '0', '13');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (2, '2023-06-27', 26, '4', '17');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (3, '2023-11-15', 18, '5', '7');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (4, '2023-11-21', 25, '8', '23');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (5, '2022-12-25', 27, '4', '55');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (6, '2022-12-07', 3, '9', '46');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (7, '2023-11-07', 2, '2', '31');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (8, '2022-12-15', 28, '2', '14');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (9, '2023-10-18', 7, '5', '21');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (10, '2023-01-13', 7, '9', '47');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (11, '2023-11-16', 11, '5', '10');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (12, '2023-10-22', 24, '6', '29');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (13, '2023-08-25', 15, '0', '58');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (14, '2023-05-02', 12, '7', '28');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (15, '2023-06-08', 15, '1', '24');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (16, '2023-06-11', 2, '6', '12');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (17, '2023-04-03', 9, '2', '26');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (18, '2023-01-13', 10, '8', '38');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (19, '2023-04-09', 13, '0', '40');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (20, '2023-07-04', 29, '2', '33');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (21, '2023-03-31', 21, '0', '59');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (22, '2022-12-29', 11, '3', '5');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (23, '2023-07-08', 9, '8', '35');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (24, '2023-09-23', 24, '2', '9');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (25, '2023-01-11', 30, '3', '45');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (26, '2022-12-24', 16, '9', '1');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (27, '2023-03-12', 17, '6', '41');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (28, '2023-08-11', 29, '2', '52');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (29, '2023-01-07', 26, '9', '27');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (30, '2023-03-11', 20, '9', '50');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (31, '2023-02-06', 24, '4', '49');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (32, '2023-06-06', 22, '9', '11');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (33, '2023-02-12', 29, '5', '16');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (34, '2023-04-15', 12, '9', '15');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (35, '2023-07-22', 15, '2', '2');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (36, '2023-03-16', 16, '9', '18');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (37, '2022-12-06', 23, '3', '51');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (38, '2023-05-30', 25, '3', '53');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (39, '2023-02-05', 5, '8', '25');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (40, '2023-01-10', 11, '9', '39');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (41, '2023-09-22', 24, '8', '56');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (42, '2023-10-06', 22, '2', '42');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (43, '2023-06-20', 7, '1', '54');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (44, '2023-05-15', 23, '7', '48');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (45, '2023-06-12', 27, '0', '32');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (46, '2023-04-15', 10, '6', '34');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (47, '2023-05-03', 12, '3', '6');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (48, '2022-12-11', 24, '9', '44');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (49, '2023-11-15', 11, '7', '4');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (50, '2023-04-05', 27, '1', '60');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (51, '2023-10-15', 23, '4', '22');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (52, '2023-01-10', 13, '9', '57');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (53, '2023-03-06', 15, '1', '36');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (54, '2023-06-23', 12, '3', '8');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (55, '2023-11-10', 20, '0', '37');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (56, '2023-06-20', 4, '3', '43');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (57, '2023-01-21', 15, '9', '19');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (58, '2023-04-23', 2, '6', '20');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (59, '2023-06-25', 15, '6', '30');
insert into studyPlan (planId, examDate, chapters, confidenceLevel, homeworkId) values (60, '2023-01-05', 19, '4', '3');

# studyBreak
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (1, '3:49:17', '14:01:07', '31');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (2, '5:21:34', '22:09:40', '4');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (3, '4:25:11', '13:52:26', '46');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (4, '11:29:48', '17:32:53', '3');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (5, '9:00:19', '22:24:09', '1');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (6, '7:38:11', '14:23:19', '59');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (7, '3:33:20', '16:08:04', '21');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (8, '9:10:13', '14:54:48', '54');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (9, '2:30:46', '14:04:55', '48');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (10, '0:52:49', '16:34:12', '2');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (11, '5:40:30', '13:51:57', '42');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (12, '9:26:12', '13:28:41', '47');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (13, '7:34:31', '15:55:42', '45');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (14, '6:33:11', '23:04:09', '18');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (15, '1:41:18', '17:23:00', '19');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (16, '9:49:09', '22:11:58', '44');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (17, '9:47:23', '14:46:18', '39');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (18, '11:43:03', '20:30:04', '30');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (19, '3:04:56', '14:39:35', '17');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (20, '7:14:50', '12:08:09', '36');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (21, '2:11:57', '22:38:30', '50');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (22, '1:54:44', '22:14:25', '33');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (23, '11:45:35', '16:12:06', '55');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (24, '11:02:02', '13:27:45', '40');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (25, '0:03:53', '23:32:48', '11');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (26, '11:41:01', '18:42:00', '22');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (27, '4:55:23', '22:19:00', '15');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (28, '10:42:28', '16:20:01', '25');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (29, '1:59:36', '16:01:29', '49');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (30, '0:54:31', '22:21:30', '29');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (31, '9:04:38', '20:15:32', '5');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (32, '2:05:04', '23:38:22', '23');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (33, '11:14:20', '19:48:26', '53');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (34, '0:27:37', '23:21:32', '9');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (35, '10:12:26', '15:53:59', '37');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (36, '10:09:10', '12:48:19', '38');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (37, '8:04:45', '13:23:07', '8');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (38, '8:28:25', '16:30:41', '27');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (39, '10:46:15', '20:06:12', '10');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (40, '0:57:43', '19:16:29', '28');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (41, '11:29:28', '21:27:15', '60');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (42, '0:12:38', '12:37:38', '58');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (43, '7:27:50', '14:35:10', '41');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (44, '0:03:41', '16:44:53', '7');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (45, '1:23:58', '17:08:00', '16');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (46, '0:58:33', '17:14:36', '43');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (47, '7:14:47', '21:23:14', '35');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (48, '10:56:32', '23:41:41', '14');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (49, '2:36:07', '23:14:45', '26');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (50, '9:00:19', '16:11:58', '57');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (51, '3:33:50', '20:56:55', '20');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (52, '7:48:01', '23:40:29', '32');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (53, '6:33:18', '23:12:56', '51');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (54, '11:20:06', '22:42:09', '34');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (55, '2:51:24', '12:24:20', '6');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (56, '11:29:24', '15:32:26', '56');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (57, '5:31:05', '22:13:12', '52');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (58, '10:36:59', '22:12:44', '24');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (59, '8:11:23', '16:55:14', '12');
insert into studyBreak (breakId, startTime, endTime, homeworkId) values (60, '5:18:19', '18:00:08', '13');
