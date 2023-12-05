from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


student = Blueprint('student', __name__)

# Get all the products from the database
@student.route('/students/<studentID>/assignments/dueDate', methods=['GET'])
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
