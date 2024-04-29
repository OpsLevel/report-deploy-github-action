FROM public.ecr.aws/opslevel/cli:v2024.4.26
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
