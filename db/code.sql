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

y