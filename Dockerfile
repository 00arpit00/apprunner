FROM python:3.8

# Add sample application
ADD server.py /tmp/application.py

EXPOSE 8000

# Run it
ENTRYPOINT ["python", "/tmp/application.py"]
