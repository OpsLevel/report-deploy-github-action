FROM public.ecr.aws/opslevel/cli:v2023.12.18
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
