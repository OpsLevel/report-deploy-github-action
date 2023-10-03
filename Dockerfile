FROM public.ecr.aws/opslevel/cli:v2023.9.12
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
