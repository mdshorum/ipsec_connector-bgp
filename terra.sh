#!/bin/bash

/opt/homebrew/bin/terraform init;
/opt/homebrew/bin/terraform plan -out=tfplan;
/opt/homebrew/bin/terraform apply tfplan;
