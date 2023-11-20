FROM public.ecr.aws/opslevel/cli:v2023.11.16
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
