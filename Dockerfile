FROM public.ecr.aws/opslevel/cli:v2023.8.15
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
