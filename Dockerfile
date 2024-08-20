FROM amazonlinux

# Add sample application
ADD server.py /tmp/application.py

EXPOSE 8000

# Run it
ENTRYPOINT ["echo", "$HOME"]
