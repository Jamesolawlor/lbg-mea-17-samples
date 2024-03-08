FROM python:latest

# Use Python 3.6 or later as a base image

COPY app.py app.py
COPY requirements.txt requirements.txt

# Copy contents into image
 
RUN pip install --upgrade pip

RUN pip install -r requirements.txt
# Install pip dependencies from requirements

ENV YOUR_NAME=QA
# Set YOUR_NAME environment variable

# Expose the correct port

EXPOSE 5500

# Create an entrypoint
ENTRYPOINT ["python","app.py"]
