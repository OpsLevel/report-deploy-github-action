FROM public.ecr.aws/opslevel/cli:v2023.1.25
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
