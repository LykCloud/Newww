FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget tar python3 python3-pip

# Download and extract xmrig
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-linux-x64.tar.gz && \
    tar -xf xmrig-6.21.0-linux-x64.tar.gz && \
    rm xmrig-6.21.0-linux-x64.tar.gz

# Create a non-root user
RUN useradd -m xmriguser
USER xmriguser
WORKDIR /home/xmriguser

# Copy and set up xmrig configuration
COPY entrypoint.sh /home/xmriguser/

# Expose ports for xmrig and Flask
EXPOSE 8060
EXPOSE 5000

# Install Python dependencies
COPY requirements.txt /home/xmriguser/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy Python application files
COPY app.py /home/xmriguser/
COPY templates /home/xmriguser/templates

# Set up entrypoint
ENTRYPOINT ["/home/xmriguser/entrypoint.sh"]
