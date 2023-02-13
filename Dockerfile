FROM public.ecr.aws/opslevel/cli:v2023.2.10
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
