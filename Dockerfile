FROM public.ecr.aws/opslevel/cli:v2023.7.19
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
