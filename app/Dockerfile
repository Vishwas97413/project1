# Use the official Python image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy dependency file first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the remaining application files
COPY . .

# Inform Docker that the application listens on port 5000
EXPOSE 5000

# Command to start the Flask application
CMD ["python", "app.py"]
