from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


student = Blueprint('student', __name__)

# Return a list of all assignment due dates for a student
@student.route('/student/<studentID>/homeworkAssignment/dueDate', methods=['GET'])
def get_student(studentID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''SELECT dueDate
                   FROM homeworkAssignment
                   JOIN onus.student s on s.studentId = homeworkAssignment.studentId
                   WHERE s.studentId =''' + str(studentID))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# add a new studybreak 
@student.route('/studyBreak/<breakId>/<startTime>/<endTime>/<homeworkId>', methods=['PUT'])
def add_new_study_break(homeworkId):

    #extracting the variables
    breakId = breakId
    startTime = startTime
    endTime = endTime
    homeworkID = homeworkId

    # Constructing the query
    query = 'insert into studyBreak (breakId, startTime, endTime, homeworkId) values ("'
    query += breakId + '", "'
    query += startTime + '", "'
    query += endTime + '", '
    query += homeworkID + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

# delete a homework assignment 
@student.route('/homeworkAssignment/<homeworkId>', methods=['DELETE'])
def delete_hw(meeting_id):
    # Constructing the delete query
    query = f'DELETE FROM homeworkAssignment WHERE homeworkId =' + str(homeworkId)
    
    # executing and committing the delete statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    # Check if any row was affected (meeting was deleted)
    if cursor.rowcount == 0:
        return jsonify({'error': 'Course not found'}), 404

    return 'Homework removed successfully'

# check all homework submission grades
@student.route('/student/<studentID>/homeworkSubmission/grade', methods=['GET'])
def get_hw_grades(studentID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''''SELECT homeworkId, grade
                   FROM homeworkSubmission
                   JOIN onus.homeworkAssignment hA on homeworkSubmission.homeworkId = hA.homeworkId
                   Join onus.course c on hA.courseId = c.courseId
                   JOIN onus.section s on c.courseId = s.courseId
                   JOIN onus.studentSection sS on s.sectionId = sS.sectionId
                   JOIN onus.student s2 on s2.studentId = sS.studentId
                   WHERE s2.studentId =''' + str(studentID))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# check all exams grades
@student.route('/student/<studentID>/exam/grade', methods=['GET'])
def get_exam_grades(studentID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''SELECT examID, grade FROM exam
                   JOIN onus.course c on exam.courseId = c.courseId
                   JOIN onus.section s on c.courseId = s.courseId
                   JOIN onus.studentSection sS on s.sectionId = sS.sectionId
                   JOIN onus.student s2 on s2.studentId = sS.studentId
                   WHERE s2.studentId =''' + str(studentID))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# update student year
@student.route('/student/<studentId>/<year>', methods=['PUT'])
def update_year(studentId):
    # collecting data from the request object
    the_data = request.json
    current_app.logger.info(the_data)

    # Extracting variables
    studentId = studentId
    year = year

    # Constructing the query
    query = 'UPDATE student SET '
    query += f'year =' + str(year)
    query += f'WHERE studentId =' + str(studentId) 
    current_app.logger.info(query)

    # executing and committing the update statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'
