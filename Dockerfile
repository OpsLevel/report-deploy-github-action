FROM public.ecr.aws/opslevel/cli:v2024.5.28
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
