FROM public.ecr.aws/opslevel/cli:v2022.12.22
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
