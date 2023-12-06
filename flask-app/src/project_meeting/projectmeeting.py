#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  5 20:19:10 2023

@author: giannidiarbi
"""


from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

# everything in this file is related to project and meetings
# these are combined as meetings are directly tied to specific projects

project = Blueprint('project', __name__)

# view project page with all of the respective info
@project.route('/project/<projectId>/status/employee/<employeeId', methods=['GET'])
def view_project(projectId):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    
    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM project')
    
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

# Create feedback to add to a project (feedback in the summary section)
@project.route('/project/<projectId>', methods=['POST'])
def add_feedback_project(projectId):
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    summary = the_data['summary']

    # Constructing the query
    query = 'insert into project (summary) value ("'
    query += summary + '", "'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

meeting = Blueprint('meeting', __name__)

# Get all the meetings from the database
@meeting.route('/meeting', methods=['GET'])
def view_meeting(meeting_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    
    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM meeting')
    
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

# Create a meeting
@meeting.route('/meeting', methods=['POST'])
def create_meeting():
     # collecting data from the request object 
     the_data = request.json
     current_app.logger.info(the_data)

     #extracting the variable
     meetingId = the_data['meetingId']
     location = the_data['location']
     time = the_data['time']
     date = the_data['date']
     employeeId = the_data['employeeId']

     # Constructing the query
     query = 'insert into products (meetingId, location, time, date, employeeId) values ("'
     query += meetingId + '", "'
     query += location + '", "'
     query += time + '", '
     query += date + '", '
     query += employeeId + '", '
     current_app.logger.info(query)

     # executing and committing the insert statement 
     cursor = db.get_db().cursor()
     cursor.execute(query)
     db.get_db().commit()
     
     return 'Success!'
     
# Update a meeting
@meeting.route('/meeting/<meeting_id>', methods=['PUT'])
def update_meeting(meeting_id):
    # collecting data from the request object
    the_data = request.json
    current_app.logger.info(the_data)

    # Extracting variables
    location = the_data['location']
    time = the_data['time']
    date = the_data['date']
    employeeId = the_data['employeeId']

    # Constructing the query
    query = 'UPDATE meetings SET '
    query += f"location = '{location}', "
    query += f"time = '{time}', "
    query += f"date = '{date}', "
    query += f"employeeId = '{employeeId}' "
    query += f"WHERE meetingId = '{meeting_id}'"
    current_app.logger.info(query)

    # executing and committing the update statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'


# Cancel a meeting
@meeting.route('/meeting/<meeting_id>', methods=['DELETE'])
def cancel_meeting(meeting_id):
    # Constructing the delete query
    query = f'DELETE FROM meeting WHERE meetingId = "{meeting_id}"'
    
    # executing and committing the delete statement
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    # Check if any row was affected (meeting was deleted)
    if cursor.rowcount == 0:
        return jsonify({'error': 'Meeting not found'}), 404

    return 'Meeting canceled successfully'



