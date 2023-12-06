from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


student = Blueprint('student', __name__)

# Return a list of all assignment due dates for a particular student
@student.route('/student/<studentID>/assignments/dueDate', methods=['GET'])
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
@student.route('/studyBreak/<homeworkId>', methods=['POST'])
def add_new_study_break(studentID, homeworkId):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    breakId = the_data['breakId']
    startTime = the_data['startTime']
    endTime = the_data['endTime']
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