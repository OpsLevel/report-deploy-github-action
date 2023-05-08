FROM public.ecr.aws/opslevel/cli:v2023.4.11
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
