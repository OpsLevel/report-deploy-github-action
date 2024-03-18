FROM public.ecr.aws/opslevel/cli:v2024.3.15
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
