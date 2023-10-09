FROM public.ecr.aws/opslevel/cli:v2023.10.8
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
