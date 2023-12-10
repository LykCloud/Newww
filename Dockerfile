FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget tar

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

# Set up entrypoint
ENTRYPOINT ["/home/xmriguser/entrypoint.sh"]
