FROM public.ecr.aws/opslevel/cli:v2024.1.5
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
