# Use the official Python 3.12 image as the base image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /application

# Copy the current directory contents into the container at /application
COPY . /application

# Ensure that the virtual environment is used for installing dependencies
RUN python -m venv .venv

# Activate the virtual environment and install dependencies
#RUN . .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

# Make the script executable
RUN chmod +x /application/start-local.sh

# Define environment variables
ENV PYTHONUNBUFFERED=1

# Expose the port on which the application will run
EXPOSE 3000

# Define the entrypoint to run the script
ENTRYPOINT ["/application/start-local.sh"]
