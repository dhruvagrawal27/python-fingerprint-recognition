FROM python:3.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the basic packages to run opencv
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make run.sh executable
RUN chmod +x /app/run.sh

# Run run.sh when the container launches
ENTRYPOINT ["/bin/bash", "/app/run.sh"]
