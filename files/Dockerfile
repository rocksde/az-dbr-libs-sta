FROM python:3.8-slim-buster
COPY ./requirements.txt /home/requirements.txt
COPY ./uploadlib.sh /home/uploadlib.sh
RUN apt-get update; apt-get install -y curl
# Install Azure CLI to push libraries to storage account
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN chmod +x /home/uploadlib.sh
ENTRYPOINT [ "./home/uploadlib.sh" ]