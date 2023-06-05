FROM public.ecr.aws/opslevel/cli:v2023.5.18
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
