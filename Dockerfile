FROM public.ecr.aws/opslevel/cli:v2023.3.16
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
