FROM public.ecr.aws/opslevel/cli:v2024.1.16
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
