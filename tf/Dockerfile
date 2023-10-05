#docker run --rm -v /tf:/tf/ --name tfcont custom-terraform-aws:latest

# Use the official Terraform image as the base image
FROM hashicorp/terraform:latest

# Install AWS CLI for AWS validation
RUN apk add --update curl python3 py3-pip && \
    pip3 install awscli --upgrade && \
    apk --purge -v del py-pip && \
    rm -rf /var/cache/apk/*

# Set environment variables for AWS (they'll be overridden by runtime values)
ENV AWS_ACCESS_KEY_ID=""
ENV AWS_SECRET_ACCESS_KEY=""

# Entry script to validate AWS credentials, then run Terraform
COPY entryscript.sh /entryscript.sh
COPY . .
RUN chmod +x /entryscript.sh
ENTRYPOINT ["/entryscript.sh"]