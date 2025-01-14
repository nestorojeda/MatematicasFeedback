# Use the official Python base image
FROM jupyter/datascience-notebook:latest

# Set environment variables to prevent interactive prompts and ensure UTF-8 locale
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Set a working directory inside the container
WORKDIR /app

# Install the requirements.txt file
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entrypoint script
COPY  --chmod=755 start-jupyter.sh /app/

# Expose the default Jupyter notebook port
EXPOSE 8888

# Start the Jupyter server using the script
CMD ["/app/start-jupyter.sh"]
